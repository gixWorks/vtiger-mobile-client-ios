//
//  VTHTTPClient.h
//  FunctionalitiesApp
//
//  Created by Giovanni on 11/18/13.
//  Copyright (c) 2013 gixWorks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>
@class CredentialsHelper;

//These constants are accessed from the NetworkOperationManager 
extern NSString* const kClientHasFinishedLogin;
extern NSString* const kClientHasFinishedLoginAndFetchModules;
extern NSString* const kClientHasFinishedSyncCalendar;
extern NSString* const kClientHasFinishedDescribe;
extern NSString* const kClientHasFinishedFetchRecord;
extern NSString* const kClientHasFinishedFetchRecordWithGrouping;
extern NSString* const kClientHasFinishedFetchRecordsWithGrouping;

//The notifications keys
extern NSString* const kClientNotificationResponseBodyKey;
extern NSString* const kClientNotificationErrorKey;
extern NSString* const kClientNotificationParametersKey;

@interface VTHTTPClient : AFHTTPClient

+ (VTHTTPClient*)sharedInstance;

- (void)executeOperationWithParameters:(NSDictionary*)parameters notificationName:(NSString*)notificationName;
- (void)executeOperationWithoutLoginWithParameters:(NSDictionary*)parameters notificationName:(NSString*)notificationName;


@end
