//
//  Ticket.h
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 1/9/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MagicalRecord/CoreData+MagicalRecord.h>

@class Service;

@interface Ticket : NSManagedObject

@property (nonatomic, retain) NSString * crm_id;
@property (nonatomic, retain) NSString * crm_tickettitle;
@property (nonatomic, retain) NSString * crm_parent_id;
@property (nonatomic, retain) NSString * crm_parent_name;
@property (nonatomic, retain) NSString * crm_parent_type;
@property (nonatomic, retain) NSString * crm_assigned_user_id;
@property (nonatomic, retain) NSString * crm_assigned_user_name;
@property (nonatomic, retain) NSString * crm_product_id;
@property (nonatomic, retain) NSString * crm_product_name;
@property (nonatomic, retain) NSString * crm_ticketpriority;
@property (nonatomic, retain) NSString * crm_ticketstatus;
@property (nonatomic, retain) NSString * crm_ticketseverity;
@property (nonatomic, retain) NSNumber * crm_hours;
@property (nonatomic, retain) NSNumber * crm_days;
@property (nonatomic, retain) NSString * crm_ticketcategory;
@property (nonatomic, retain) NSString * crm_ticket_no;
@property (nonatomic, retain) NSDate * crm_time_created;
@property (nonatomic, retain) NSDate * crm_time_modified;
@property (nonatomic, retain) Service *service;

@end
