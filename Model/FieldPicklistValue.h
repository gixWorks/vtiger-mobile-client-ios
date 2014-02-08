//
//  FieldPicklistValue.h
//  Pods
//
//  Created by Giovanni on 11/30/13.
//
//

#import <Foundation/Foundation.h>
#import <MagicalRecord/CoreData+MagicalRecord.h>

@class Field;

@interface FieldPicklistValue : NSManagedObject

@property (nonatomic, retain) NSString * crm_label;
@property (nonatomic, retain) NSString * crm_value;
@property (nonatomic, retain) Field *field;

@end
