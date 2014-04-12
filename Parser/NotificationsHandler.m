//
//  NotificationsHandler.m
//  ContactiCalVtiger
//
//  Created by Giovanni on 07/04/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import "NotificationsHandler.h"
#import "ResponseParser.h"
#import "CRMConstants.h"
#import "GWNotificationNames.h"


//
NSString* kNotificationResponseBodyKey = @"responseBody";

@implementation NotificationsHandler

- (void)handleClientHasFinishedRelatedRecords:(NSNotification *)notification
{
    //Check this is not deallocated
    NSArray *params = [[notification name] componentsSeparatedByString:kNotificationSeparator];
    NSString *module = [params objectAtIndex:2];
    NSString *recordId = [params objectAtIndex:1];
    NSString *notificationName = [params objectAtIndex:0];
    DDLogDebug(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    if ([[notification userInfo] objectForKey:kErrorKey]) {
        //There was an error in the HTTPClient
        DDLogWarn(@"HTTPClient Error in %@ %@: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [[[notification userInfo] objectForKey:kErrorKey] objectForKey:@"message"]);
        [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:self userInfo:[notification userInfo]];
    }
    else{
        
        //Everything ok, process
        NSDictionary *JSON = [[notification userInfo] objectForKey:kNotificationResponseBodyKey];
        NSDictionary *parseResult = [ResponseParser parseQuery:JSON module:module];
        if ([parseResult objectForKey:@"error"] != nil){
            DDLogWarn(@"%@ %@ Parser returned error: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [[parseResult objectForKey:@"error"] description]);
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:self userInfo:parseResult];
    }
}

@end
