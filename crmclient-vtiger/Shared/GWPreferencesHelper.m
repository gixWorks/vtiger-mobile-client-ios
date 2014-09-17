//
//  GWPreferencesHelper.m
//  ContactiCal
//
//  Created by Giovanni on 2/1/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import "GWPreferencesHelper.h"
#import "CRMConstants.h"
#import "Service.h"

NSString* const kSettingsCalendarKey = @"calendars";

@implementation GWPreferencesHelper

#pragma mark - In-App Preferences

/*
 Queries the NSUserDefaults for the calendars for the active service
 
 @return The Dictionary of calendars in the form @{ kCalendarPrivate : YES , kCalendarPublic : NO }
 */
+ (NSDictionary *)getCalendarsToShow
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *service = [Service getActiveServiceUrl];
    NSDictionary *cals = [[defaults objectForKey:service] objectForKey:kSettingsCalendarKey];
    if (cals == nil) {
        cals = [[NSDictionary alloc] init];
    }
    return cals;
}

+ (void)setCalendarsToShow:(NSDictionary *)calendars
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *service = [Service getActiveServiceUrl];
    NSDictionary *calpreferences = @{kSettingsCalendarKey : calendars};
    [defaults setObject:calpreferences forKey:service];
    [defaults synchronize];
}

+ (UIColor*)colorForCalendar:(NSString*)calendar
{
    if ([calendar isEqualToString:kCalendarPrivate]) {
        return [UIColor blueColor];
    }
    else if ([calendar isEqualToString:kCalendarPublic]) {
        return [UIColor greenColor];
    }
    return nil;
}

+ (UIImage*)imageForCalendar:(NSString*)calendar
{
    if ([calendar isEqualToString:kCalendarPrivate]) {
        return [UIImage imageNamed:@"lightblue-dot"];
    }
    else if ([calendar isEqualToString:kCalendarPublic]) {
        return [UIImage imageNamed:@"green-dot"];
    }
    return nil;
}

+ (void)clearAllPreferences
{
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
}

+ (void)clearPreferencesForService:(NSString*)service
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:service];
    [defaults synchronize];
}

+ (void)initializePreferencesForService:(NSString*)service
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //calendars
    NSDictionary *defaultsettings = @{kCalendarPrivate : @YES, kCalendarPublic : @YES};
    NSDictionary *calendarDefaults = @{kSettingsCalendarKey : defaultsettings};
    [defaults setObject:calendarDefaults forKey:service];
    [defaults synchronize];
}

#pragma mark - Settings.bundle preferences

+ (NSDate*)getDateToSyncBackTo
{
    NSUserDefaults *preferences=[NSUserDefaults standardUserDefaults];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:0];
    NSString *syncBackTo = [preferences stringForKey:@"sync-back-to"];
    if ([syncBackTo isEqualToString:@"all"]) {
        //date is already ok
    }
    else if ([syncBackTo isEqualToString:@"1year"]){
        NSTimeInterval year = 60 * 60 * 24 * 365;
        date = [[NSDate alloc] initWithTimeIntervalSinceNow:-year];
    }
    else if ([syncBackTo isEqualToString:@"6months"]){
        NSTimeInterval months = 60 * 60 * 24 * 183;
        date = [[NSDate alloc] initWithTimeIntervalSinceNow:-months];
    }
    else if ([syncBackTo isEqualToString:@"no"]){
        date = [NSDate date];
    }
    return date;

}


@end
