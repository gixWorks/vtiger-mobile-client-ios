#import "Activity.h"
#import "CRMClient.h"
#import "ModulesHelper.h"
#import "GWPreferencesHelper.h"
#import "CRMFieldConstants.h"
#import "CRMConstants.h"
#import "NSDate+GWUtilities.h"


@interface Activity ()

// Private interface goes here.

@end


@implementation Activity

+ (Activity *)modelObjectWithDictionary:(NSDictionary *)dict
{
    //Extract custom fields
    NSMutableDictionary *cfields = [[NSMutableDictionary alloc] init];
    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([key hasPrefix:@"cf_"]) {
            //it's a custom field
            [cfields setObject:@{key : obj} forKey:key];
        }
    }];
    return [Activity modelObjectWithDictionary:dict customFields:cfields];
}

+ (Activity *)modelObjectWithDictionary:(NSDictionary *)dict customFields:(NSDictionary*)cfields
{
    NSString *record_id = [dict objectForKey:kCalendarFieldid];
    Activity *instance;
    
    //I first try to count the entities (should take less time) and load the entity only if strictly necessary (if count > 0). The Count operation should be less intensive than the Fetch, so I use it for checking the existence
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"crm_id = %@", record_id];
    NSUInteger count = [Activity MR_countOfEntitiesWithPredicate:predicate];
    
    if (count > 0) {
        instance = [Activity MR_findFirstByAttribute:@"crm_id" withValue:record_id];
        NSDateFormatter *dateTimeFormat = [[NSDateFormatter alloc] init];
        [dateTimeFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
        NSDate *time_modified = [dateTimeFormat dateFromString:[dict objectForKey:kFieldModifiedTime]];
        if ([time_modified compare:instance.crm_time_created] == NSOrderedSame) {
#if DEBUG
            NSLog(@"%@ %@ skipping %@ as modified_time is the same", NSStringFromClass([self class]), NSStringFromSelector(_cmd), record_id);
#endif
            //It's the same instance
            return instance;
        }
    }
    else{
        instance = [Activity MR_createEntity];
    }
    
    if (![instance updateModelObjectWithDictionary:dict customFields:cfields]) {
        return nil;
    }
    return instance;
}

- (BOOL)updateModelObjectWithDictionary:(NSDictionary*)dict customFields:(NSDictionary*)cfields
{
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if([dict isKindOfClass:[NSDictionary class]]) {
        @try {
            //Setup the number formatter
            NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
            [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
            
            //Setup the date formatters
            NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
            [dateFormat setDateFormat:@"yyyy-MM-dd"];
            NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
            [timeFormat setDateFormat:@"HH:mm:ss"];
            
            //This is a stupid fix because sometimes we get start time with seconds 14:30:00 sometimes not 14:30
            NSString *start_time_string = [dict objectForKey:kCalendarFieldtime_start];
            if ([[start_time_string componentsSeparatedByString:@":"] count] < 3 && [start_time_string length] > 1) {
                start_time_string = [start_time_string stringByAppendingString:@":00"];
            }
            NSString *end_time_string = [dict objectForKey:kCalendarFieldtime_end];
            if ([[end_time_string componentsSeparatedByString:@":"] count] < 3 && [end_time_string length] > 1) {
                end_time_string = [end_time_string stringByAppendingString:@":00"];
            }
            
            //DateTime Created and Modified
            NSDateFormatter *dateTimeFormat = [[NSDateFormatter alloc] init];
            [dateTimeFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            NSDate *time_modified = [dateTimeFormat dateFromString:[dict objectForKey:kFieldModifiedTime]];
            NSDate *time_created = [dateTimeFormat dateFromString:[dict objectForKey:kFieldCreatedTime]];
            self.crm_time_modified = time_modified;
            self.crm_time_created = time_created;
            
            //Format some variables
            NSDate *start_date = [dateFormat dateFromString:[dict objectForKey:kCalendarFielddate_start]];
            NSDate *start_time = [timeFormat dateFromString:start_time_string];
            NSDate *end_time;
            NSDate *due_date = [dateFormat dateFromString:[dict objectForKey:kCalendarFielddue_date]];
            NSNumber *duration_minutes = [numberFormatter numberFromString:[dict objectForKey:kCalendarFieldduration_minutes]];
            NSNumber *duration_hours = [numberFormatter numberFromString:[dict objectForKey:kCalendarFieldduration_hours]];
            if ([end_time_string length] > 0) {
                end_time = [timeFormat dateFromString:end_time_string];
            }
            else{
                end_time = [start_time dateByAddingTimeInterval:[duration_hours floatValue]*60*60 + [duration_minutes floatValue]*60];
            }
            
            //Properties defined by CRM
            self.crm_subject = [dict objectForKey:kCalendarFieldsubject];
            self.crm_time_start = start_time;
            self.crm_date_start = start_date;
            //            instance.crm_time_end = end_time;
            self.crm_id = [dict objectForKey:kCalendarFieldid];
            self.crm_assigned_user_id = [[dict objectForKey:kCalendarFieldassigned_user_id] objectForKey:@"value"];
            self.crm_assigned_user_name = [[dict objectForKey:kCalendarFieldassigned_user_id] objectForKey:@"label"];
            self.crm_activitytype = [dict objectForKey:kCalendarFieldactivitytype];
            self.crm_notime = [dict objectForKey:kCalendarFieldnotime];
            self.crm_sendnotification = [dict objectForKey:kCalendarFieldsendnotification];
            self.crm_visibility = [dict objectForKey:kCalendarFieldvisibility];
            self.crm_location = [dict objectForKey:kCalendarFieldlocation];
            self.crm_priority = [dict objectForKey:kCalendarFieldtaskpriority];
            self.crm_recurringtype = [dict objectForKey:kCalendarFieldrecurringtype];
            if ([dict objectForKey:kCalendarFieldreminder_time] != nil) {
                self.crm_reminder_time = [numberFormatter numberFromString:[dict objectForKey:kCalendarFieldreminder_time]]; //!!! When we save a record in Vtiger 5.3.0 for some reasons the reminder_time is not saved. This is to avoid overwriting a reminder_time specified locally with a nil value coming from the CRM. (This honors the choice of the user)
            }
            self.crm_due_date =  due_date;
            self.crm_duration_hours = duration_hours;
            self.crm_duration_minutes = duration_minutes;
            if ([self.crm_activitytype isEqualToString:kCRMActivityTypeTask]) {
                self.crm_eventstatus = [dict objectForKey:kCalendarFieldtaskstatus];
            }
            else{
                self.crm_eventstatus = [dict objectForKey:kCalendarFieldeventstatus];
            }
            
            //Properties defined by me
            NSCalendar *cal = [NSCalendar currentCalendar];
            NSDateComponents *comps = [[NSDateComponents alloc] init];
            NSDateComponents *start_date_comp = [cal components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self.crm_date_start];
            NSDateComponents *start_time_comp;
            //Xcode complains if I try to get Time Components from a nil NSDate, so I first check if it's nil
            if (self.crm_time_start == nil) {
                start_time_comp = [NSDateComponents alloc];
                [start_time_comp setHour:0];
                [start_time_comp setMinute:0];
                [start_time_comp setSecond:0];
            }
            else{
                start_time_comp = [cal components:(NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:self.crm_time_start];
            }
            [comps setYear:[start_date_comp year]];
            [comps setMonth:[start_date_comp month]];
            [comps setDay:[start_date_comp day]];
            [comps setHour:[start_time_comp hour]];
            [comps setMinute:[start_time_comp minute]];
            
            self.my_datetime_start = [[cal dateFromComponents:comps] gw_convertToTimeZone:[Service getActive].crm_timezone_server];
            NSTimeInterval duration = ( [self.crm_duration_hours integerValue] * 60.0 * 60.0 ) + ( [self.crm_duration_minutes integerValue] * 60.0 );
            self.my_datetime_end = [self.my_datetime_start dateByAddingTimeInterval:duration];
            self.my_timezone = [Service getActive].crm_timezone_server;
            
            //Set again the other fields now that we have time zone applied
            self.crm_date_start = [self.my_datetime_start gw_DatePart];
            self.crm_time_start = [self.my_datetime_start gw_TimePart];
            self.crm_time_end = [self.my_datetime_end gw_TimePart];
            
            
            //Now that we have end date, we check if we should actually sync it
            NSDate *syncBackTo = [GWPreferencesHelper getDateToSyncBackTo];
            if ([self.my_datetime_end compare:syncBackTo] == NSOrderedAscending) {
                //Means we should not sync this item
#if DEBUG
                NSLog(@"%@ Skipping item %@ as it happens earlier than the date to sync back to: %@", NSStringFromSelector(_cmd), self.crm_id, syncBackTo);
#endif
                return NO;
            }
            
            //Related records
            NSDictionary *parent_record = [dict objectForKey:kCalendarFieldparent_id];
            if ([[parent_record objectForKey:@"value"] length] > 0) {
                self.crm_parent_id = [parent_record objectForKey:@"value"];
                self.crm_parent_name = [parent_record objectForKey:@"label"];
                self.crm_parent_type = [ModulesHelper decodeModuleForRecordId:self.crm_parent_id];
                [[CRMClient sharedInstance] addRecordToFetchQueue:self.crm_parent_id];
            }
            NSDictionary *contact_id = [dict objectForKey:kCalendarFieldcontact_id];
            if ([[contact_id objectForKey:@"value"] length] > 0) {
                self.crm_contact_id = [contact_id objectForKey:@"value"];
                self.crm_contact_name = [contact_id objectForKey:@"label"];
                [[CRMClient sharedInstance] addRecordToFetchQueue:self.crm_contact_id];
            }
            
            //Custom fields
            NSError *cfieldsError;
            self.my_custom_fields = [NSJSONSerialization dataWithJSONObject:cfields options:NSJSONWritingPrettyPrinted error:&cfieldsError];
            if (cfieldsError != nil) {
                NSLog(@"Entity: %@ Error in custom fields: %@", self.crm_id, [cfieldsError description]);
            }
            
            //Add the relationship with the current service
            self.service = [Service getActive];
        }
        @catch (NSException *exception) {
            //clean this object from the context
            [[NSManagedObjectContext MR_defaultContext] deleteObject:self];
            //log the exception
            NSLog(@"%@ %@ Exception: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [exception description]);
        }
    }
    
    return YES;
}

- (NSDictionary *)crmRepresentation
{
    BOOL isNewRecord = NO;
    if ([self.crm_id rangeOfString:@"-"].location != NSNotFound) {
        //if the record id is in the structure 1x4345-5445-54554-445 it's been created with CFUUID
        isNewRecord = YES;
    }
    //Should be like this:
    //{"date_start":"2014-01-18", "due_date": "2014-01-18", "start_time":"14:44","activitytype":"Call","location":"Overhoeksplein 2, Amsterdam","subject":"Call Smith", "assigned_user_id" : "19x1","taskstatus":"Planned","visibility":"Private"}
    //Setup the number formatter
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    //Setup the date formatters
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
    [timeFormat setDateFormat:@"HH:mm:ss"];
    NSDateFormatter *dateTimeFormat = [[NSDateFormatter alloc] init];
    [dateTimeFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:self.crm_activitytype forKey:kCalendarFieldactivitytype];
    if (self.crm_contact_id != nil) {
        //There's a related Contact
        [dict setObject:self.crm_contact_id forKey:kCalendarFieldcontact_id];
        //        [dict setObject:@{ @"value" : self.crm_contact_id, @"label" : self.crm_contact_name} forKey:kCalendarFieldcontact_id];
    }
    [dict setValue:self.crm_description forKey:kCalendarFielddescription];
    [dict setValue:[numberFormatter stringFromNumber:self.crm_duration_hours] forKey:kCalendarFieldduration_hours];
    [dict setValue:[numberFormatter stringFromNumber:self.crm_duration_minutes] forKey:kCalendarFieldduration_minutes];
    if ([self.crm_activitytype isEqualToString:kCRMActivityTypeTask]) {
        [dict setValue:self.crm_eventstatus forKey:kCalendarFieldtaskstatus];
    }
    else{
        [dict setValue:self.crm_eventstatus forKey:kCalendarFieldeventstatus];
    }
    [dict setValue:self.crm_location forKey:kCalendarFieldlocation];
    //    [dict setObject:self.crm_notime forKey:kCalendarFieldnotime]; //skip for the moment
    if (self.crm_parent_id != nil) {
        //There is a related record (not a Contact, for Contacts there is "contact_id")
        [dict setObject:self.crm_parent_id forKey:kCalendarFieldparent_id];
        //        [dict setObject:@{ @"value" : self.crm_parent_id, @"label" : self.crm_parent_name } forKey:kCalendarFieldparent_id];
    }
    [dict setValue:self.crm_recurringtype forKey:kCalendarFieldrecurringtype];
    //    [dict setObject:self.crm_remindertime forKey:kCalendarFieldreminder_time]; //skip for the moment
    //    [dict setObject:self.crm_sendnotification forKey:kCalendarFieldsendnotification]; //skip for the moment
    [dict setValue:self.crm_subject forKey:kCalendarFieldsubject];
    //    [dict setObject:[dateTimeFormat stringFromDate:self.crm_time_created] forKey:kFieldCreatedTime]; //skip for the moment
    //    [dict setObject:[dateTimeFormat stringFromDate:self.crm_time_created] forKey:kFieldCreatedTime]; //skip for the moment
    //    [dict setObject:self.crm_priority forKey:kCalendarFieldtaskpriority];
    
    
    [dateFormat setTimeZone:[NSTimeZone timeZoneWithName:[Service getActive].crm_timezone_server]];
    [timeFormat setTimeZone:[NSTimeZone timeZoneWithName:[Service getActive].crm_timezone_server]];
    [dict setValue:[dateFormat stringFromDate:self.my_datetime_start] forKey:kCalendarFielddate_start];
    [dict setValue:[dateFormat stringFromDate:self.crm_due_date] forKey:kCalendarFielddue_date];
    [dict setValue:[timeFormat stringFromDate:self.my_datetime_end] forKey:kCalendarFieldtime_end];
    [dict setValue:[timeFormat stringFromDate:self.my_datetime_start] forKey:kCalendarFieldtime_start];
    
    
    //    //Time Zone Conversion
    //    NSTimeZone *activityTimeZone = [NSTimeZone timeZoneWithName:self.my_timezone];
    //    NSTimeZone *serverTimeZone = [NSTimeZone timeZoneWithName:[Service getActive].crm_timezone_server];
    //    if([activityTimeZone secondsFromGMT] != [serverTimeZone secondsFromGMT]){
    //
    //        NSInteger offset1 = [activityTimeZone secondsFromGMTForDate: self.my_datetime_start];
    //        NSInteger offset2 = [serverTimeZone secondsFromGMTForDate: self.my_datetime_end];
    //
    //        NSDate *adjusted_dateTimeStart = [self.my_datetime_start dateByAddingTimeInterval:(offset1 - offset2)];
    //        NSDate *adjusted_dateTimeEnd = [self.my_datetime_end dateByAddingTimeInterval:(offset1 - offset2)];
    //        NSDate *adjusted_due_date = [self.crm_due_date dateByAddingTimeInterval:(offset1 - offset2)];
    //
    //        NSDate *adjusted_date_start = [adjusted_dateTimeStart gw_DatePart];
    //        NSDate *adjusted_time_start = [adjusted_dateTimeStart gw_TimePart];
    //        adjusted_due_date = [adjusted_due_date gw_DatePart];
    //        NSDate *adjusted_time_end = [adjusted_dateTimeEnd gw_TimePart];
    //
    //        [dict setValue:[dateFormat stringFromDate:adjusted_date_start] forKey:kCalendarFielddate_start];
    //        [dict setValue:[dateFormat stringFromDate:adjusted_due_date] forKey:kCalendarFielddue_date];
    //        [dict setValue:[timeFormat stringFromDate:adjusted_time_end] forKey:kCalendarFieldtime_end];
    //        [dict setValue:[timeFormat stringFromDate:adjusted_time_start] forKey:kCalendarFieldtime_start];
    //
    //// Previously
    ////        [dict setValue:[dateFormat stringFromDate:self.crm_date_start] forKey:kCalendarFielddate_start];
    ////        [dict setValue:[dateFormat stringFromDate:self.crm_due_date] forKey:kCalendarFielddue_date];
    ////        [dict setValue:[timeFormat stringFromDate:self.crm_time_end] forKey:kCalendarFieldtime_end];
    ////        [dict setValue:[timeFormat stringFromDate:self.crm_time_start] forKey:kCalendarFieldtime_start];
    //
    //    }
    
    [dict setValue:self.crm_visibility forKey:kCalendarFieldvisibility];
    [dict setValue:self.crm_reminder_time forKey:kCalendarFieldreminder_time];
    
    if (isNewRecord == NO) {
        [dict setObject:self.crm_id forKey:kCalendarFieldid];
    }
    if ([self.crm_assigned_user_id length] > 0) {
        [dict setObject:self.crm_assigned_user_id forKey:kCalendarFieldassigned_user_id];
        //        [dict setObject:@{ @"value" : self.crm_assigned_user_id, @"label" : self.crm_assigned_user_name } forKey:kCalendarFieldassigned_user_id];
    }
    
    
    return [dict copy]; //We return the immutable copy because dict is mutable.
}

- (NSDictionary *)proxyForJson
{
    return [self crmRepresentation];
}

@end
