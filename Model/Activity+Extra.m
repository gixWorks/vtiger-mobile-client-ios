//
//  Activity+Extra.m
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 11/30/13.
//  Copyright (c) 2013 gixWorks. All rights reserved.
//

#import "Activity+Extra.h"
#import "NetworkOperationManager.h"
#import "ModulesHelper.h"
#import "GWPreferencesHelper.h"
#import "CRMFieldConstants.h"

@implementation Activity (Extra)

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
        [dateTimeFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
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
            
            NSDateFormatter *dateTimeFormat = [[NSDateFormatter alloc] init];
            [dateTimeFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            NSDate *time_modified = [dateTimeFormat dateFromString:[dict objectForKey:kFieldModifiedTime]];
            NSDate *time_created = [dateTimeFormat dateFromString:[dict objectForKey:kFieldCreatedTime]];
            instance.crm_time_modified = time_modified;
            instance.crm_time_created = time_created;
            
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
            instance.crm_subject = [dict objectForKey:kCalendarFieldsubject];
            instance.crm_time_start = start_time;
            instance.crm_date_start = start_date;
//            instance.crm_time_end = end_time;
            instance.crm_id = [dict objectForKey:kCalendarFieldid];
            instance.crm_assigned_user_id = [[dict objectForKey:kCalendarFieldassigned_user_id] objectForKey:@"value"];
            instance.crm_assigned_user_name = [[dict objectForKey:kCalendarFieldassigned_user_id] objectForKey:@"label"];
            instance.crm_activitytype = [dict objectForKey:kCalendarFieldactivitytype];
            instance.crm_notime = [dict objectForKey:kCalendarFieldnotime];
            instance.crm_sendnotification = [dict objectForKey:kCalendarFieldsendnotification];
            instance.crm_visibility = [dict objectForKey:kCalendarFieldvisibility];
            instance.crm_location = [dict objectForKey:kCalendarFieldlocation];
            instance.crm_priority = [dict objectForKey:kCalendarFieldtaskpriority];
            instance.crm_recurringtype = [dict objectForKey:kCalendarFieldrecurringtype];
            instance.crm_due_date =  due_date;
            instance.crm_duration_hours = duration_hours;
            instance.crm_duration_minutes = duration_minutes;
            if ([instance.crm_activitytype isEqualToString:@"Task"]) {
                instance.crm_status = [dict objectForKey:kCalendarFieldtaskstatus];
            }
            else{
                instance.crm_status = [dict objectForKey:kCalendarFieldeventstatus];
            }
            
            //Properties defined by me
            NSCalendar *gregorian = [[NSCalendar alloc]
                                     initWithCalendarIdentifier:NSGregorianCalendar];
            NSDateComponents *comps = [[NSDateComponents alloc] init];
            NSDateComponents *start_date_comp = [gregorian components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:instance.crm_date_start];
            NSDateComponents *start_time_comp;
            //Xcode complains if I try to get Time Components from a nil NSDate, so I first check if it's nil
            if (instance.crm_time_start == nil) {
                start_time_comp = [NSDateComponents alloc];
                [start_time_comp setHour:0];
                [start_time_comp setMinute:0];
                [start_time_comp setSecond:0];
            }
            else{
                start_time_comp = [gregorian components:(NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:instance.crm_time_start];
            }
            [comps setYear:[start_date_comp year]];
            [comps setMonth:[start_date_comp month]];
            [comps setDay:[start_date_comp day]];
            [comps setHour:[start_time_comp hour]];
            [comps setMinute:[start_time_comp minute]];
            
            instance.my_datetime_start = [gregorian dateFromComponents:comps];
            NSTimeInterval duration = ( [instance.crm_duration_hours integerValue] * 60.0 * 60.0 ) + ( [instance.crm_duration_minutes integerValue] * 60.0 );
            instance.my_datetime_end = [instance.my_datetime_start dateByAddingTimeInterval:duration];
            
            //Now that we have end date, we check if we should actually sync it
            NSDate *syncBackTo = [GWPreferencesHelper getDateToSyncBackTo];
            if ([instance.my_datetime_end compare:syncBackTo] == NSOrderedAscending) {
                //Means we should not sync this item
#if DEBUG
                NSLog(@"%@ Skipping item %@ as it happens earlier than the date to sync back to: %@", NSStringFromSelector(_cmd), instance.crm_id, syncBackTo);
#endif
                return nil;
            }
            
            //Related records
            NSDictionary *parent_record = [dict objectForKey:kCalendarFieldparent_id];
            if ([[parent_record objectForKey:@"value"] length] > 0) {
                instance.crm_parent_id = [parent_record objectForKey:@"value"];
                instance.crm_parent_name = [parent_record objectForKey:@"label"];
                instance.crm_parent_type = [ModulesHelper decodeModuleForRecordId:instance.crm_parent_id];
                [[NetworkOperationManager sharedInstance] addRecordToFetchQueue:instance.crm_parent_id];
            }
            NSDictionary *contact_id = [dict objectForKey:kCalendarFieldcontact_id];
            if ([[contact_id objectForKey:@"value"] length] > 0) {
                instance.crm_contact_id = [contact_id objectForKey:@"value"];
                instance.crm_contact_name = [contact_id objectForKey:@"label"];
                [[NetworkOperationManager sharedInstance] addRecordToFetchQueue:instance.crm_contact_id];
            }
            
            //Custom fields
            NSError *cfieldsError;
            instance.my_custom_fields = [NSJSONSerialization dataWithJSONObject:cfields options:NSJSONWritingPrettyPrinted error:&cfieldsError];
            if (cfieldsError != nil) {
                NSLog(@"Entity: %@ Error in custom fields: %@", instance.crm_id, [cfieldsError description]);
            }
            
            //Add the relationship with the current service
            instance.service = [Service getActive];
        }
        @catch (NSException *exception) {
            //clean this object from the context
            [[NSManagedObjectContext MR_defaultContext] deleteObject:instance];
            //log the exception
            NSLog(@"%@ %@ Exception: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [exception description]);
        }
    }
    return instance;
}

- (NSDictionary *)crmRepresentation
{
    //TODO: represent as dictionary rebuilding the CRM fields from the Core Data entities
    return nil;
}

@end
