//
//  Ticket+Extra.m
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 1/9/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import "Ticket+Extra.h"
#import "NetworkOperationManager.h"
#import "ModulesHelper.h"
#import "CRMFieldConstants.h"

@implementation Ticket (Extra)

+ (Ticket *)modelObjectWithDictionary:(NSDictionary *)dict
{
    NSString *record_id = [dict objectForKey:kTicketFieldId];
    Ticket *instance;
    
    
    //I first try to count the entities (should take less time) and load the entity only if strictly necessary (if count > 0). The Count operation should be less intensive than the Fetch, so I use it for checking the existence
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"crm_id = %@", record_id];
    NSUInteger count = [Lead MR_countOfEntitiesWithPredicate:predicate];
    
    if (count > 0) {
        instance = [Lead MR_findFirstByAttribute:@"crm_id" withValue:record_id];
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
        
        NSDateFormatter *dateTimeFormat = [[NSDateFormatter alloc] init];
        [dateTimeFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate *time_modified = [dateTimeFormat dateFromString:[dict objectForKey:kFieldModifiedTime]];
        NSDate *time_created = [dateTimeFormat dateFromString:[dict objectForKey:kFieldCreatedTime]];
        instance.crm_time_modified = time_modified;
        instance.crm_time_created = time_created;
        
        //Properties defined by CRM
        instance.crm_id = [dict objectForKey:kTicketFieldId];
        instance.crm_assigned_user_id = [[dict objectForKey:kTicketFieldAssignedTo] objectForKey:@"value"];
        instance.crm_assigned_user_name = [[dict objectForKey:kTicketFieldAssignedTo] objectForKey:@"label"];
        instance.crm_days = numberFromString([dict objectForKey:kTicketFieldDays]);
        instance.crm_hours = numberFromString([dict objectForKey:kTicketFieldHours]);
        instance.crm_ticket_no = [dict objectForKey:kTicketFieldTicketNo];
        instance.crm_ticketcategory = [dict objectForKey:kTicketFieldCategory];
        instance.crm_ticketpriority = [dict objectForKey:kTicketFieldPriority];
        instance.crm_ticketseverity = [dict objectForKey:kTicketFieldSeverity];
        instance.crm_ticketstatus = [dict objectForKey:kTicketFieldStatus];
        instance.crm_tickettitle = [dict objectForKey:kTicketFieldTitle];
        
        //Decode and load the parent record (Account or Contact)
        NSDictionary *parent_record = [dict objectForKey:kTicketFieldParentId];
        if ([[parent_record objectForKey:@"value"] length] > 0) {
            instance.crm_parent_id = [parent_record objectForKey:@"value"];
            instance.crm_parent_name = [parent_record objectForKey:@"label"];
            instance.crm_parent_type = [ModulesHelper decodeModuleForRecordId:instance.crm_parent_id];
            [[NetworkOperationManager sharedInstance] addRecordToFetchQueue:instance.crm_parent_id];
        }
        
        NSDictionary *product = [dict objectForKey:kTicketFieldProductId];
        if ([[product objectForKey:@"value"] length] > 0) {
            instance.crm_product_id = [product objectForKey:@"value"];
            instance.crm_product_name = [product objectForKey:@"label"];
            [[NetworkOperationManager sharedInstance] addRecordToFetchQueue:instance.crm_product_id];
            //            [[NetworkOperationManager sharedInstance] fetchRecord:instance.my_relatedrecordid andAssociateToRecord:instance];
        }

        //Add the relationship with the current service
        instance.service = [Service getActive];
    }
    
    return instance;
}


@end
