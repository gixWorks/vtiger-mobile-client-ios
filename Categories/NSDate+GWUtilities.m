//
//  NSDate+GWUtilities.m
//  ContactiCalVtiger
//
//  Created by Giovanni on 21/06/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import "NSDate+GWUtilities.h"

@implementation NSDate (GWUtilities)

- (NSDate*)gw_convertToTimeZone:(NSString*)timeZoneName
{
    NSTimeZone *tz = [NSTimeZone timeZoneWithName:timeZoneName];
    if (timeZoneName == nil || tz == nil) {
        return self;
    }
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    return [cal dateFromComponents:((^{
        NSDateComponents *comps =  [cal components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:self];
        
        [comps setTimeZone:tz];
        return comps;
    })())];
}

- (NSDate*)gw_TimePart
{
    NSDateComponents* comps = [[NSCalendar currentCalendar] components:NSHourCalendarUnit|NSCalendarUnitMinute fromDate:self];
    return [[NSCalendar currentCalendar] dateFromComponents:comps];
}

- (NSDate*)gw_DatePart
{
    NSDateComponents* comps = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:self];
    return [[NSCalendar currentCalendar] dateFromComponents:comps];
    
}

@end
