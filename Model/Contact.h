//
//  Contact.h
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 1/9/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Service, ContactAddress;

@interface Contact : NSManagedObject

@property (nonatomic, retain) NSString * crm_id;
@property (nonatomic, retain) NSString * crm_salutationtype;
@property (nonatomic, retain) NSString * crm_firstname;
@property (nonatomic, retain) NSString * crm_lastname;
@property (nonatomic, retain) NSString * crm_contact_no;
@property (nonatomic, retain) NSString * crm_phone;
@property (nonatomic, retain) NSString * crm_account_id;
@property (nonatomic, retain) NSString * crm_account_name;
@property (nonatomic, retain) NSString * crm_mobile;
@property (nonatomic, retain) NSString * crm_leadsource;
@property (nonatomic, retain) NSString * crm_homephone;
@property (nonatomic, retain) NSString * crm_title;
@property (nonatomic, retain) NSString * crm_otherphone;
@property (nonatomic, retain) NSString * crm_department;
@property (nonatomic, retain) NSString * crm_fax;
@property (nonatomic, retain) NSString * crm_email;
@property (nonatomic, retain) NSString * crm_birthday;
@property (nonatomic, retain) NSString * crm_assistant;
@property (nonatomic, retain) NSString * crm_reports_to_id;
@property (nonatomic, retain) NSString * crm_reports_to_name;
@property (nonatomic, retain) NSString * crm_assistantphone;
@property (nonatomic, retain) NSString * crm_yahooid;
@property (nonatomic, retain) NSString * crm_assigned_user_id;
@property (nonatomic, retain) NSString * crm_assigned_user_name;
@property (nonatomic, retain) NSString * crm_description;
@property (nonatomic, retain) UIImage * crm_contact_image;
@property (nonatomic, retain) Service *service;
@property (nonatomic, retain) ContactAddress *address;

@end
