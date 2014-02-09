//
//  CRMFieldPicklistValue.h
//  ContactiCalVtiger
//
//  Created by Giovanni on 09/02/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CRMField;

@interface CRMFieldPicklistValue : NSManagedObject

@property (nonatomic, retain) NSString * crm_label;
@property (nonatomic, retain) NSString * crm_value;
@property (nonatomic, retain) CRMField *field;

@end
