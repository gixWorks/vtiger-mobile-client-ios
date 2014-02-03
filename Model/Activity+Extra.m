//
//  Activity+Extra.m
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 11/30/13.
//  Copyright (c) 2013 gixWorks. All rights reserved.
//

#import "Activity+Extra.h"
#import "NetworkOperationManager.h"

//Vtiger fields
NSString* const kCalendarFieldsubject = @"subject";
NSString* const kCalendarFieldid = @"id";
NSString* const kCalendarFielddate_start = @"date_start";
NSString* const kCalendarFieldactivitytype = @"activitytype";
NSString* const kCalendarFieldtime_start = @"time_start";
NSString* const kCalendarFieldnotime = @"notime";
NSString* const kCalendarFieldsendnotification = @"sendnotification";
NSString* const kCalendarFieldvisibility = @"visibility";
NSString* const kCalendarFieldeventstatus = @"eventstatus";
NSString* const kCalendarFieldtaskstatus = @"taskstatus";
NSString* const kCalendarFieldreminder_time = @"reminder_time";
NSString* const kCalendarFieldassigned_user_id = @"assigned_user_id";
NSString* const kCalendarFieldtime_end = @"time_end";
NSString* const kCalendarFielddue_date = @"due_date";
NSString* const kCalendarFieldrecurringtype = @"recurringtype";
NSString* const kCalendarFieldparent_id = @"parent_id";  //Related to
NSString* const kCalendarFieldcontact_id = @"contact_id"; //Contact name
NSString* const kCalendarFieldtaskpriority = @"taskpriority";
NSString* const kCalendarFieldduration_hours = @"duration_hours";
NSString* const kCalendarFieldduration_minutes = @"duration_minutes";
NSString* const kCalendarFieldlocation = @"location";
NSString* const kCalendarFielddescription = @"description";

@implementation Activity (Extra)

+ (Activity *)modelObjectWithDictionary:(NSDictionary *)dict
{
    NSString *activity_id = [dict objectForKey:kCalendarFieldid];
    Activity *instance;
    
    //I first try to count the entities (should take less time) and load the entity only if strictly necessary (if count > 0). The Count operation should be less intensive than the Fetch, so I use it for checking the existence
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"crm_id = %@", activity_id];
    NSUInteger count = [Activity MR_countOfEntitiesWithPredicate:predicate];
    
    if (count > 0) {
        instance = [Activity MR_findFirstByAttribute:@"crm_id" withValue:activity_id];
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
            if ([[start_time_string componentsSeparatedByString:@":"] count] < 3) {
                start_time_string = [start_time_string stringByAppendingString:@":00"];
            }
            
            //Format some variables
            NSDate *start_date = [dateFormat dateFromString:[dict objectForKey:kCalendarFielddate_start]];
            NSDate *start_time = [timeFormat dateFromString:start_time_string];
            NSDate *due_date = [dateFormat dateFromString:[dict objectForKey:kCalendarFielddue_date]];
            
            //Properties defined by CRM
            instance.crm_subject = [dict objectForKey:kCalendarFieldsubject];
            instance.crm_time_start = start_time;
            instance.crm_date_start = start_date;
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
            instance.crm_duration_hours =  [numberFormatter numberFromString:[dict objectForKey:kCalendarFieldduration_hours]];
            instance.crm_duration_minutes = [numberFormatter numberFromString:[dict objectForKey:kCalendarFieldduration_minutes]];
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
            
            //Related records
            NSDictionary *parent_record = [dict objectForKey:kCalendarFieldparent_id];
            if ([[parent_record objectForKey:@"value"] length] > 0) {
                instance.crm_parent_id = [parent_record objectForKey:@"value"];
                instance.crm_parent_name = [parent_record objectForKey:@"label"];
                instance.crm_parent_type = [ResponseParser decodeRecordType:instance.crm_parent_id];
                [[NetworkOperationManager sharedInstance] addRecordToFetchQueue:instance.crm_parent_id];
            }
            NSDictionary *contact_id = [dict objectForKey:kCalendarFieldcontact_id];
            if ([[contact_id objectForKey:@"value"] length] > 0) {
                instance.crm_contact_id = [contact_id objectForKey:@"value"];
                instance.crm_contact_name = [contact_id objectForKey:@"label"];
                [[NetworkOperationManager sharedInstance] addRecordToFetchQueue:instance.crm_contact_id];
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
