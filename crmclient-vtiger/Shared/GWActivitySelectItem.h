//
//  GWActivitySelectItem.h
//  ContactiCalVtiger
//
//  Created by Giovanni on 12/04/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GWActivitySelectItem : NSObject

+ (instancetype)itemWithLabel:(NSString*)label value:(NSObject*)value;
+ (instancetype)itemWithLabelAndValue:(NSObject*)value;

@property (nonatomic, strong) NSString *label;
@property (nonatomic, strong) NSObject *value;

@end
