//
//  Group.h
//  ContactiCalVtiger
//
//  Created by Giovanni on 24/02/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Service;

@interface Group : NSManagedObject

@property (nonatomic, retain) NSString * crm_id;
@property (nonatomic, retain) NSString * crm_label;
@property (nonatomic, retain) Service *service;

@end
