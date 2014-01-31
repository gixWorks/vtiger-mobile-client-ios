//
//  SyncToken.h
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 1/10/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Service;

@interface SyncToken : NSManagedObject

@property (nonatomic, retain) NSString * module;
@property (nonatomic, retain) NSString * token;
@property (nonatomic, retain) NSDate * datetime;
@property (nonatomic, retain) Service *service;

@end
