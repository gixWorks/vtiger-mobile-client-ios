//
//  Module.h
//  ContactiCalVtiger
//
//  Created by Giovanni on 09/02/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CRMField, Service;

@interface Module : NSManagedObject

@property (nonatomic, retain) NSString * crm_id;
@property (nonatomic, retain) NSNumber * crm_isEntity;
@property (nonatomic, retain) NSString * crm_label;
@property (nonatomic, retain) NSString * crm_name;
@property (nonatomic, retain) NSString * crm_singular;
@property (nonatomic, retain) NSSet *fields;
@property (nonatomic, retain) Service *service;
@end

@interface Module (CoreDataGeneratedAccessors)

- (void)addFieldsObject:(CRMField *)value;
- (void)removeFieldsObject:(CRMField *)value;
- (void)addFields:(NSSet *)values;
- (void)removeFields:(NSSet *)values;

@end
