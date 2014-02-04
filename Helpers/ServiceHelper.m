//
//  ServiceHelper.m
//  ContactiCal
//
//  Created by Giovanni on 1/31/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import "ServiceHelper.h"
#import "MagicalRecord+GMAdditions.h"
#import "CredentialsHelper.h"
#import "GWPreferencesHelper.h"

@implementation ServiceHelper

/*
 Creates a new Service with the specified parameters
 
 @param url The URL
 @param username The Username
 @param password The user Password
 @param serverTimeZone the time zone of server
 @param userTimeZone time zone specified by user
 @param onDemand indicates if it's a "Cloud installation" (if YES) or a "on premise installation" (if NO)
 */
+ (void)createNewServiceWithServerURL:(NSURL*)url Username:(NSString*)username password:(NSString*)password serverTimeZone:(NSString*)serverTimeZone userTimeZone:(NSString*)userTimeZone onDemand:(BOOL)onDemand
{
    //Delete all services eventually there
    [MagicalRecord GW_cleanAndResetupDB];
    
    //Create new service
    Service *s = [Service createAndSetActiveWithUsername:username url:[url absoluteString] crmOnDemand:onDemand];
    //Save the password in keychain
    [CredentialsHelper savePassword:password];
    
    s.crm_timezone_server = serverTimeZone;
    s.crm_timezone_user = userTimeZone;
    
    //Initialize the preferences for the newly created service
    [GWPreferencesHelper initializePreferencesForService:[url absoluteString]];

    [[NSManagedObjectContext MR_context] MR_saveOnlySelfWithCompletion:nil];
}

/*
 Creates a new Service with the specified parameters without saving to persistent store
 
 @param url The URL
 @param username The Username
 @param onDemand indicates if it's a "Cloud installation" (if YES) or a "on premise installation" (if NO)
 */
+ (void)createNewServiceWithoutSavingWithServerURL:(NSURL *)url username:(NSString*)username onDemand:(BOOL)onDemand
{
    [Service createAndSetActiveWithUsername:username url:[url absoluteString] crmOnDemand:onDemand];
}

@end
