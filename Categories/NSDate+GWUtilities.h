//
//  NSDate+GWUtilities.h
//  ContactiCalVtiger
//
//  Created by Giovanni on 21/06/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (GWUtilities)

- (NSDate*)gw_convertToTimeZone:(NSString*)timeZoneName;
- (NSDate*)gw_TimePart;
- (NSDate*)gw_DatePart;

@end
