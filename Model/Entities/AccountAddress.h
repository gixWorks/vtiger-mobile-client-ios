//
//  AccountAddress.h
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 12/2/13.
//  Copyright (c) 2013 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MagicalRecord/CoreData+MagicalRecord.h>

@class Account;

@interface AccountAddress : NSManagedObject

@property (nonatomic, retain) NSString * crm_bill_city;
@property (nonatomic, retain) NSString * crm_bill_street;
@property (nonatomic, retain) NSString * crm_ship_city;
@property (nonatomic, retain) NSString * crm_ship_street;
@property (nonatomic, retain) NSString * crm_bill_state;
@property (nonatomic, retain) NSString * crm_ship_state;
@property (nonatomic, retain) NSString * crm_bill_code;
@property (nonatomic, retain) NSString * crm_ship_code;
@property (nonatomic, retain) NSString * crm_bill_country;
@property (nonatomic, retain) NSString * crm_ship_country;
@property (nonatomic, retain) NSString * crm_bill_pobox;
@property (nonatomic, retain) NSString * crm_ship_pobox;
@property (nonatomic, retain) Account *account;

@end
