//
//  GWActivitySelectItem.m
//  ContactiCalVtiger
//
//  Created by Giovanni on 12/04/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import "GWActivitySelectItem.h"

@implementation GWActivitySelectItem

+ (instancetype)itemWithLabel:(NSString*)label value:(NSObject*)value
{
    GWActivitySelectItem *i = [[GWActivitySelectItem alloc] init];
    i.value = value;
    i.label = label;
    return i;
}

+ (instancetype)itemWithLabelAndValue:(NSObject*)value
{
    GWActivitySelectItem *i = [[GWActivitySelectItem alloc] init];
    i.value = value;
    i.label = (NSString*)value;
    return i;
}

@end
