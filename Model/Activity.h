//
//  Activity.h
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 12/2/13.
//  Copyright (c) 2013 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MagicalRecord/CoreData+MagicalRecord.h>

@class Service;

@interface Activity : NSManagedObject

@property (nonatomic, retain) NSString * crm_activitytype;
@property (nonatomic, retain) NSString * crm_contact_id;
@property (nonatomic, retain) NSString * crm_contact_name;
@property (nonatomic, retain) NSDate * crm_date_start;
@property (nonatomic, retain) NSString * crm_description;
@property (nonatomic, retain) NSDate * crm_due_date;
@property (nonatomic, retain) NSNumber * crm_duration_hours;
@property (nonatomic, retain) NSNumber * crm_duration_minutes;
@property (nonatomic, retain) NSString * crm_eventstatus;
@property (nonatomic, retain) NSString * crm_id;
@property (nonatomic, retain) NSString * crm_location;
@property (nonatomic, retain) NSString * crm_notime;
@property (nonatomic, retain) NSString * crm_parent_id;
@property (nonatomic, retain) NSString * crm_parent_name;
@property (nonatomic, retain) NSString * crm_parent_type;
@property (nonatomic, retain) NSString * crm_priority;
@property (nonatomic, retain) NSString * crm_recurringtype;
@property (nonatomic, retain) NSString * crm_sendnotification;
@property (nonatomic, retain) NSString * crm_status;
@property (nonatomic, retain) NSString * crm_subject;
@property (nonatomic, retain) NSDate * crm_time_start;
@property (nonatomic, retain) NSString * crm_visibility;
@property (nonatomic, retain) NSData * my_custom_fields;
@property (nonatomic, retain) NSDate * my_datetime_end;
@property (nonatomic, retain) NSDate * my_datetime_start;
@property (nonatomic, retain) NSString * crm_assigned_user_id;
@property (nonatomic, retain) NSString * crm_assigned_user_name;
@property (nonatomic, retain) NSDate * crm_time_created;
@property (nonatomic, retain) NSDate * crm_time_modified;
@property (nonatomic, retain) Service *service;

@end
