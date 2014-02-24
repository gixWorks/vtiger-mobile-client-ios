//
//  Product.h
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 1/9/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Service;

@interface Product : NSManagedObject

@property (nonatomic, retain) NSString * crm_productname;
@property (nonatomic, retain) NSString * crm_product_no;
@property (nonatomic, retain) NSNumber * crm_discontinued;
@property (nonatomic, retain) NSString * crm_productcode;
@property (nonatomic, retain) NSDate * crm_sales_start_date;
@property (nonatomic, retain) NSString * crm_manufacturer;
@property (nonatomic, retain) NSString * crm_productcategory;
@property (nonatomic, retain) NSDate * crm_support_start_date;
@property (nonatomic, retain) NSDate * crm_sales_end_date;
@property (nonatomic, retain) NSString * crm_vendor_id;
@property (nonatomic, retain) NSString * crm_vendor_name;
@property (nonatomic, retain) NSString * crm_website;
@property (nonatomic, retain) NSString * crm_vendor_part_no;
@property (nonatomic, retain) NSString * crm_mfr_part_no;
@property (nonatomic, retain) NSString * crm_productsheet;
@property (nonatomic, retain) NSString * crm_serial_no;
@property (nonatomic, retain) NSString * crm_glacct;
@property (nonatomic, retain) NSString * crm_description;
@property (nonatomic, retain) NSString * crm_id;
@property (nonatomic, retain) NSDate * crm_support_end_date;
@property (nonatomic, retain) NSDate * crm_time_created;
@property (nonatomic, retain) NSDate * crm_time_modified;
@property (nonatomic, retain) Service *service;

@end
