//
//  Potential.h
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 1/9/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Service;

@interface Potential : NSManagedObject

@property (nonatomic, retain) NSDecimalNumber * crm_amount;
@property (nonatomic, retain) NSString * crm_assigned_user_id;
@property (nonatomic, retain) NSString * crm_assigned_user_name;
@property (nonatomic, retain) NSString * crm_campaign_id;
@property (nonatomic, retain) NSString * crm_campaign_name;
@property (nonatomic, retain) NSDate * crm_closingdate;
@property (nonatomic, retain) NSString * crm_id;
@property (nonatomic, retain) NSString * crm_leadsource;
@property (nonatomic, retain) NSString * crm_nextstep;
@property (nonatomic, retain) NSString * crm_opportunity_type;
@property (nonatomic, retain) NSString * crm_potential_no;
@property (nonatomic, retain) NSString * crm_potentialname;
@property (nonatomic, retain) NSNumber * crm_probability;
@property (nonatomic, retain) NSString * crm_related_to_id;
@property (nonatomic, retain) NSString * crm_related_to_name;
@property (nonatomic, retain) NSString * crm_related_to_type;
@property (nonatomic, retain) NSString * crm_sales_stage;
@property (nonatomic, retain) Service *service;

@end
