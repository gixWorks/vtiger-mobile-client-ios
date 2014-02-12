//
//  CRMField.h
//  ContactiCalVtiger
//
//  Created by Giovanni on 12/02/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CRMFieldPicklistValue, Module;

@interface CRMField : NSManagedObject

@property (nonatomic, retain) NSString * crm_label;
@property (nonatomic, retain) NSNumber * crm_mandatory;
@property (nonatomic, retain) NSString * crm_name;
@property (nonatomic, retain) NSData * crm_options;
@property (nonatomic, retain) NSString * crm_type;
@property (nonatomic, retain) NSString * crm_uitype;
@property (nonatomic, retain) Module *module;
@property (nonatomic, retain) NSSet *picklist_values;
@end

@interface CRMField (CoreDataGeneratedAccessors)

- (void)addPicklist_valuesObject:(CRMFieldPicklistValue *)value;
- (void)removePicklist_valuesObject:(CRMFieldPicklistValue *)value;
- (void)addPicklist_values:(NSSet *)values;
- (void)removePicklist_values:(NSSet *)values;

@end
