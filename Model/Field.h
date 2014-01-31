//
//  Field.h
//  Pods
//
//  Created by Giovanni on 11/30/13.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Field : NSManagedObject

@property (nonatomic, retain) NSString * crm_name;
@property (nonatomic, retain) NSString * crm_label;
@property (nonatomic, retain) NSNumber * crm_mandatory;
@property (nonatomic, retain) NSString * crm_type;
@property (nonatomic, retain) NSManagedObject *module;
@property (nonatomic, retain) NSManagedObject *picklist_values;

@end
