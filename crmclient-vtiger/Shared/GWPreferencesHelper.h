//
//  GWPreferencesHelper.h
//  ContactiCal
//
//  Created by Giovanni on 2/1/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

@import Foundation;
@import UIKit;
#import "CredentialsHelper.h"

extern NSString* const kSettingsCalendarKey;

@interface GWPreferencesHelper : NSObject

#pragma mark - In-App preferences
+ (NSDictionary*)getCalendarsToShow;
+ (void)setCalendarsToShow:(NSDictionary*)calendars;
+ (UIColor*)colorForCalendar:(NSString*)calendar;
+ (UIImage*)imageForCalendar:(NSString*)calendar;
+ (void)clearAllPreferences;
+ (void)clearPreferencesForService:(NSString*)service;
+ (void)initializePreferencesForService:(NSString*)service;

#pragma mark - Settings.bundle preferences
+ (NSDate*)getDateToSyncBackTo;

@end
