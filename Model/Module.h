//
//  Module.h
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 12/1/13.
//  Copyright (c) 2013 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MagicalRecord/CoreData+MagicalRecord.h>

@class Field, Service;

@interface Module : NSManagedObject

@property (nonatomic, retain) NSString * crm_id;
@property (nonatomic) BOOL crm_isEntity;
@property (nonatomic, retain) NSString * crm_label;
@property (nonatomic, retain) NSString * crm_name;
@property (nonatomic, retain) NSString * crm_singular;
@property (nonatomic, retain) NSSet *fields;
@property (nonatomic, retain) Service *service;
@end

@interface Module (CoreDataGeneratedAccessors)

- (void)addFieldsObject:(Field *)value;
- (void)removeFieldsObject:(Field *)value;
- (void)addFields:(NSSet *)values;
- (void)removeFields:(NSSet *)values;

@end
