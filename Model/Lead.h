//
//  Lead.h
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 12/2/13.
//  Copyright (c) 2013 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Service;

@interface Lead : NSManagedObject

@property (nonatomic, retain) NSString * lead_assigned_user_id;
@property (nonatomic, retain) NSString * lead_company;
@property (nonatomic, retain) NSNumber * lead_company_annualrevenue;
@property (nonatomic, retain) NSString * lead_company_industry;
@property (nonatomic, retain) NSNumber * lead_company_noofemployees;
@property (nonatomic, retain) NSString * lead_company_website;
@property (nonatomic, retain) NSString * lead_designation;
@property (nonatomic, retain) NSString * lead_email;
@property (nonatomic, retain) NSString * lead_fax;
@property (nonatomic, retain) NSString * lead_firstname;
@property (nonatomic, retain) NSString * lead_lastname;
@property (nonatomic, retain) NSString * lead_lead_no;
@property (nonatomic, retain) NSString * lead_leadid;
@property (nonatomic, retain) NSString * lead_leadsource;
@property (nonatomic, retain) NSString * lead_leadstatus;
@property (nonatomic, retain) NSString * lead_mobile;
@property (nonatomic, retain) NSString * lead_phone;
@property (nonatomic, retain) NSString * lead_rating;
@property (nonatomic, retain) NSString * lead_salutationtype;
@property (nonatomic, retain) NSString * lead_yahooid;
@property (nonatomic, retain) NSString * lead_assigned_user_name;
@property (nonatomic, retain) Service *service;

@end
