//
//  NSURL+GMAdditions.m
//  ContactiCal
//
//  Created by Giovanni on 1/31/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import "NSURL+GWAdditions.h"

@implementation NSURL (GWAdditions)

- (NSURL*)GW_secureURL
{
    if ([[self scheme] isEqualToString:@"https"]) {
        return self;
    }
    NSString *str = [self absoluteString];
    NSInteger colon = [str rangeOfString:@":"].location;
    if (colon != NSNotFound) { // wtf how would it be missing
        str = [str substringFromIndex:colon]; // strip off existing scheme
        str = [@"https" stringByAppendingString:str];
    }
    return [NSURL URLWithString:str];
}

- (NSURL*)GW_nonSecureURL
{
    if ([[self scheme] isEqualToString:@"http"]) {
        return self;
    }
    NSString *str = [self absoluteString];
    NSInteger colon = [str rangeOfString:@":"].location;
    if (colon != NSNotFound) { // wtf how would it be missing
        str = [str substringFromIndex:colon]; // strip off existing scheme
        str = [@"http" stringByAppendingString:str];
    }
    return [NSURL URLWithString:str];
}

@end
