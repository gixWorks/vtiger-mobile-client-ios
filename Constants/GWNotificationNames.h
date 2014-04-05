//
//  GWNotificationNames.h
//  ContactiCalVtiger
//
//  Created by Giovanni on 05/04/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString* const kNotificationScheduleNotification;
extern NSString* const kNotificationRescheduleNotification;
extern NSString* const kNotificationUnscheduleNotificationForRecord;
extern NSString* const kNotificationUnscheduleNotificationForService;
extern NSString* const kNotificationUnscheduleAllNotifications;

extern NSString* const kNotificationUserInfoActivity;
extern NSString* const kNotificationUserInfoInterval;
extern NSString* const kNotificationUserInfoService;
extern NSString* const kNotificationUserInfoRecordId;

@interface GWNotificationNames : NSObject

@end
