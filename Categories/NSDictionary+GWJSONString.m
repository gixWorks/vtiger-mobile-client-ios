//
//  NSDictionary+GWJSONString.m
//  ContactiCalVtiger
//
//  Created by Giovanni on 17/02/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import "NSDictionary+GWJSONString.h"

@implementation NSDictionary (GWJSONString)

-(NSString*) gw_jsonStringWithPrettyPrint:(BOOL) prettyPrint {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:(NSJSONWritingOptions)    (prettyPrint ? NSJSONWritingPrettyPrinted : 0)
                                                         error:&error];
    
    if (! jsonData) {
        NSLog(@"bv_jsonStringWithPrettyPrint: error: %@", error.localizedDescription);
        return @"{}";
    } else {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
}

@end
