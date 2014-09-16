//
//  GWNotificationNames.m
//  ContactiCalVtiger
//
//  Created by Giovanni on 05/04/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import "GWNotificationNames.h"

NSString* const kNotificationScheduleNotification = @"com.gixWorks.ContactiCal.scheduleNotificationWithItem";
NSString* const kNotificationRescheduleNotification = @"com.gixWorks.ContactiCal.RescheduleNotificationWithItem";
NSString* const kNotificationUnscheduleNotificationForRecord = @"com.gixWorks.ContactiCal.unscheduleNotificationForRecordId";
NSString* const kNotificationUnscheduleNotificationForService = @"com.gixWorks.ContactiCal.unscheduleNotificationForService";
NSString* const kNotificationUnscheduleAllNotifications = @"com.gixWorks.ContactiCal.unscheduleAllNotifications";

NSString* const kNotificationUserInfoActivity = @"activity";
NSString* const kNotificationUserInfoInterval = @"interval";
NSString* const kNotificationUserInfoService = @"service";
NSString* const kNotificationUserInfoRecordId = @"recordId";

//Separator
NSString* const kNotificationSeparator = @"@@@@@@@";

@implementation GWNotificationNames

@end
