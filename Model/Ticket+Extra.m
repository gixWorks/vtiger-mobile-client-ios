//
//  Ticket+Extra.m
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 1/9/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import "Ticket+Extra.h"
#import "NetworkOperationManager.h"

NSString* const kTicketFieldId = @"id";
NSString* const kTicketFieldAssignedTo = @"assigned_user_id";
NSString* const kTicketFieldProductId = @"product_id";
NSString* const kTicketFieldPriority = @"ticketpriorities";
NSString* const kTicketFieldStatus = @"ticketstatus";
NSString* const kTicketFieldSeverity = @"ticketseverities";
NSString* const kTicketFieldHours = @"hours";
NSString* const kTicketFieldDays = @"days";
NSString* const kTicketFieldCategory = @"ticketcategories";
NSString* const kTicketFieldTicketNo = @"ticket_no";
NSString* const kTicketFieldParentId = @"parent_id";
NSString* const kTicketFieldProduct = @"product_id";
NSString* const kTicketFieldTitle = @"title";

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
    }
    else{
        instance = [Lead MR_createEntity];
    }
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if([dict isKindOfClass:[NSDictionary class]]) {
        
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
            instance.crm_parent_type = [ResponseParser decodeRecordType:instance.crm_parent_id];
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
