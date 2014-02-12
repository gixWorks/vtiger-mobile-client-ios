//
//  CRMField.h
//  ContactiCalVtiger
//
//  Created by Giovanni on 09/02/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MagicalRecord/CoreData+MagicalRecord.h>

@class CRMFieldPicklistValue, Module;

@interface CRMField : NSManagedObject

@property (nonatomic, retain) NSString * attribute;
@property (nonatomic, retain) NSString * crm_label;
@property (nonatomic, retain) NSNumber * crm_mandatory;
@property (nonatomic, retain) NSString * crm_name;
@property (nonatomic, retain) NSString * crm_type;
@property (nonatomic, retain) NSData * crm_options;
@property (nonatomic, retain) Module *module;
@property (nonatomic, retain) CRMFieldPicklistValue *picklist_values;

@end
