//
//  Lead+Extra.m
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 12/1/13.
//  Copyright (c) 2013 gixWorks. All rights reserved.
//

#import "Lead+Extra.h"
#import "CRMFieldConstants.h"

NSString* const kLeadFieldid = @"id";

@implementation Lead (Extra)

+ (Lead *)modelObjectWithDictionary:(NSDictionary *)dict customFields:(NSDictionary *)cfields
{
    NSString *record_id = [dict objectForKey:kLeadFieldid];
    Lead *instance;
    
    //I first try to count the entities (should take less time) and load the entity only if strictly necessary (if count > 0). The Count operation should be less intensive than the Fetch, so I use it for checking the existence
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"lead_leadid = %@", record_id];
    NSUInteger count = [Lead MR_countOfEntitiesWithPredicate:predicate];
    
    if (count > 0) {
        instance = [Lead MR_findFirstByAttribute:@"lead_leadid" withValue:record_id];
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
        instance = [Lead MR_createEntity];
    }
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if([dict isKindOfClass:[NSDictionary class]]) {
        
        //Setup the number formatter
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
        
        //Setup the date formatters
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
        [timeFormat setDateFormat:@"HH:mm:ss"];
        
        NSDateFormatter *dateTimeFormat = [[NSDateFormatter alloc] init];
        [dateTimeFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate *time_modified = [dateTimeFormat dateFromString:[dict objectForKey:kFieldModifiedTime]];
        NSDate *time_created = [dateTimeFormat dateFromString:[dict objectForKey:kFieldCreatedTime]];
        instance.crm_time_modified = time_modified;
        instance.crm_time_created = time_created;

        //Properties defined by CRM
        instance.lead_leadid = [dict objectForKey:kLeadFieldid];
        instance.lead_lastname = [dict objectForKey:@"lastname"];
        instance.lead_firstname = [dict objectForKey:@"firstname"];
        instance.lead_company = [dict objectForKey:@"company"];
        instance.lead_assigned_user_id = [dict valueForKey:@"assigned_user_id.value"];
        instance.lead_assigned_user_name = [dict valueForKey:@"assigned_user_id.name"];
        instance.lead_company_annualrevenue =  [numberFormatter numberFromString:[dict objectForKey:@"company_annualrevenue"]];
        instance.lead_company_industry = [dict objectForKey:@"company_industry"];
        instance.lead_company_noofemployees = [numberFormatter numberFromString:[dict objectForKey:@"company_industry"]];
        instance.lead_company_website = [dict objectForKey:@"company_website"];
        instance.lead_designation = [dict objectForKey:@"designation"];
        instance.lead_email = [dict objectForKey:@"email"];
        instance.lead_fax = [dict objectForKey:@"fax"];
        instance.lead_lead_no = [dict objectForKey:@"lead_no"];
        instance.lead_leadsource = [dict objectForKey:@"leadsource"];
        instance.lead_leadstatus = [dict objectForKey:@"leadstatus"];
        instance.lead_mobile = [dict objectForKey:@"mobile"];
        instance.lead_phone= [dict objectForKey:@"phone"];
        instance.lead_rating = [dict objectForKey:@"rating"];
        instance.lead_salutationtype = [dict objectForKey:@"salutationtype"];
        instance.lead_yahooid = [dict objectForKey:@"yahooid"];
        
        //Custom fields
        NSError *cfieldsError;
        if(cfields != nil) {
            instance.my_custom_fields = [NSJSONSerialization dataWithJSONObject:cfields options:NSJSONWritingPrettyPrinted error:&cfieldsError];
            if (cfieldsError != nil) {
                NSLog(@"Entity: %@ Error in custom fields: %@", instance.lead_leadid, [cfieldsError description]);
            }
        }
        
        //Add the relationship with the current service
        instance.service = [Service getActive];
    }
    return instance;
}

@end
