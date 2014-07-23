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


+ (void)createNewServiceWithServerURL:(NSURL *)url Username:(NSString *)username userid:(NSString *)userid password:(NSString *)password serverTimeZone:(NSString *)serverTimeZone userTimeZone:(NSString *)userTimeZone onDemand:(BOOL)onDemand certificateRef:(NSData *)certificateRef
{
    [ServiceHelper createNewServiceWithServerURL:url Username:username userid:userid password:password serverTimeZone:serverTimeZone userTimeZone:userTimeZone onDemand:onDemand];
    Service *s = [Service getActive];
    s.crm_client_certificate_data = certificateRef;
    [[NSManagedObjectContext MR_defaultContext] MR_saveOnlySelfWithCompletion:nil];
}

+ (void)createNewServiceWithServerURL:(NSURL*)url Username:(NSString*)username userid:(NSString*)userid password:(NSString*)password serverTimeZone:(NSString*)serverTimeZone userTimeZone:(NSString*)userTimeZone onDemand:(BOOL)onDemand
{
    //Delete all services eventually there
    [MagicalRecord GW_cleanAndResetupDB];
    
    //Create new service
    Service *s = [Service createAndSetActiveWithUsername:username userid:userid url:[url absoluteString] crmOnDemand:onDemand];
    //Save the password in keychain
    [CredentialsHelper savePassword:password];
    
    s.crm_timezone_server = serverTimeZone;
    s.crm_timezone_user = userTimeZone;
    
    //Initialize the preferences for the newly created service
    [GWPreferencesHelper initializePreferencesForService:[url absoluteString]];

    [[NSManagedObjectContext MR_defaultContext] MR_saveOnlySelfWithCompletion:nil];
}

+ (void)createNewServiceWithoutSavingWithServerURL:(NSURL *)url username:(NSString*)username onDemand:(BOOL)onDemand
{
    [Service createAndSetActiveWithUsername:username userid:@"" url:[url absoluteString] crmOnDemand:onDemand];
}

+ (NSTimeZone*)currentUserTimeZone
{
    return [NSTimeZone timeZoneWithName:[Service getActive].crm_timezone_user];
}

@end
