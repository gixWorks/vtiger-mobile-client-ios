//
//  NSURL+GMAdditions.h
//  ContactiCal
//
//  Created by Giovanni on 1/31/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (GWAdditions)

- (NSURL*)GW_secureURL;
- (NSURL*)GW_nonSecureURL;

@end
