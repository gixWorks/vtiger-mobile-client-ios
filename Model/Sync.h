//
//  Sync.h
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 12/1/13.
//  Copyright (c) 2013 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Service;

@interface Sync : NSManagedObject

@property (nonatomic) NSTimeInterval syncdate;
@property (nonatomic, retain) NSString * syncmodule;
@property (nonatomic) int32_t syncrecordsdeleted;
@property (nonatomic) int32_t syncrecordsupdated;
@property (nonatomic) int32_t syncsuccess;
@property (nonatomic, retain) NSString * synctoken;
@property (nonatomic, retain) Service *service;

@end
