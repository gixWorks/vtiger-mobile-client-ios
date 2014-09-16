//
//  NSDictionary+GWJSONString.h
//  ContactiCalVtiger
//
//  Created by Giovanni on 17/02/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (GWJSONString)

-(NSString*) gw_jsonStringWithPrettyPrint:(BOOL) prettyPrint;

@end
