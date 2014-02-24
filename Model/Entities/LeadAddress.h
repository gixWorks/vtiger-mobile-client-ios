//
//  LeadAddress.h
//  ContactiCalVtiger
//
//  Created by Giovanni on 12/02/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Lead;

@interface LeadAddress : NSManagedObject

@property (nonatomic, retain) NSString * crm_pobox;
@property (nonatomic, retain) NSString * crm_code;
@property (nonatomic, retain) NSString * crm_state;
@property (nonatomic, retain) NSString * crm_country;
@property (nonatomic, retain) NSString * crm_city;
@property (nonatomic, retain) NSString * crm_street;
@property (nonatomic, retain) Lead *lead;

@end
