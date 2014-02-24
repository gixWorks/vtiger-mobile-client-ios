//
//  Account.h
//  ContactiCalVtiger
//
//  Created by Giovanni on 14/02/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class AccountAddress, Service;

@interface Account : NSManagedObject

@property (nonatomic, retain) NSString * crm_account_no;
@property (nonatomic, retain) NSString * crm_accountname;
@property (nonatomic, retain) NSString * crm_accounttype;
@property (nonatomic, retain) NSNumber * crm_annual_revenue;
@property (nonatomic, retain) NSString * crm_assigned_user_id;
@property (nonatomic, retain) NSString * crm_assigned_user_name;
@property (nonatomic, retain) NSString * crm_description;
@property (nonatomic, retain) NSString * crm_email1;
@property (nonatomic, retain) NSString * crm_email2;
@property (nonatomic, retain) NSNumber * crm_emailoptout;
@property (nonatomic, retain) NSNumber * crm_employees;
@property (nonatomic, retain) NSString * crm_fax;
@property (nonatomic, retain) NSString * crm_id;
@property (nonatomic, retain) NSString * crm_industry;
@property (nonatomic, retain) NSString * crm_memberof_id;
@property (nonatomic, retain) NSString * crm_memberof_name;
@property (nonatomic, retain) NSNumber * crm_notify_owner;
@property (nonatomic, retain) NSString * crm_otherphone;
@property (nonatomic, retain) NSString * crm_ownership;
@property (nonatomic, retain) NSString * crm_phone;
@property (nonatomic, retain) NSString * crm_rating;
@property (nonatomic, retain) NSString * crm_siccode;
@property (nonatomic, retain) NSString * crm_tickersymbol;
@property (nonatomic, retain) NSDate * crm_time_created;
@property (nonatomic, retain) NSDate * crm_time_modified;
@property (nonatomic, retain) NSString * crm_website;
@property (nonatomic, retain) NSData * my_custom_fields;
@property (nonatomic, retain) AccountAddress *address;
@property (nonatomic, retain) Service *service;

@end
