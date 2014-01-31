//
//  ContactAddress.h
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 1/9/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Contact;

@interface ContactAddress : NSManagedObject

@property (nonatomic, retain) NSString * crm_mailingstreet;
@property (nonatomic, retain) NSString * crm_mailingcity;
@property (nonatomic, retain) NSString * crm_mailingpobox;
@property (nonatomic, retain) NSString * crm_mailingzip;
@property (nonatomic, retain) NSString * crm_mailingstate;
@property (nonatomic, retain) NSString * crm_othercity;
@property (nonatomic, retain) NSString * crm_otherpobox;
@property (nonatomic, retain) NSString * crm_otherstate;
@property (nonatomic, retain) NSString * crm_otherstreet;
@property (nonatomic, retain) NSString * crm_otherzip;
@property (nonatomic, retain) NSString * crm_mailingcountry;
@property (nonatomic, retain) NSString * crm_othercountry;
@property (nonatomic, retain) Contact *contact;

@end
