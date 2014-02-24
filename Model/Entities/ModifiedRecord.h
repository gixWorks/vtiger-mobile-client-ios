//
//  ModifiedRecord.h
//  ContactiCalVtiger
//
//  Created by Giovanni on 13/02/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ModifiedRecord : NSManagedObject

@property (nonatomic, retain) NSString * crm_action;
@property (nonatomic, retain) NSString * crm_id;
@property (nonatomic, retain) NSDate * crm_timestamp;

@end
