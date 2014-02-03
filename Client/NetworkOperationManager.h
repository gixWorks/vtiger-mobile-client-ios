//
//  NetworkOperationManager.h
//  FunctionalitiesApp
//
//  Created by Giovanni on 11/23/13.
//  Copyright (c) 2013 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VTHTTPClient.h"
#import "CredentialsManager.h"
#import "ResponseParser.h"
#import "URLCheckerClient.h"
#import "NSURL+GWAdditions.h"

extern NSString* const kManagerHasFinishedCheckURL;
extern NSString* const kManagerHasFinishedLogin;
extern NSString* const kManagerHasFinishedSyncCalendar;
extern NSString* const kManagerHasFinishedDefine;
extern NSString* const kManagerHasFinishedFetchRecord;
extern NSString* const kManagerHasFinishedFetchRecordWithGrouping;

@interface NetworkOperationManager : NSObject <URLCheckerClientDelegate>

+ (NetworkOperationManager*)sharedInstance;

- (void)checkURL:(NSString*)serverUrl;
- (BOOL)checkReachability;
- (void)login;
- (void)loginAndSyncModules;
- (void)loginSetup;
- (void)loginWithUsername:(NSString*)username password:(NSString*)password;
- (void)loginAndSyncModulesWithUsername:(NSString*)username password:(NSString*)password;
- (void)resyncCalendar;
- (void)syncCalendar;
- (void)syncCalendarFromPage:(NSNumber*)page;
- (void)describeModule:(NSString*)module;
- (void)fetchRecord:(NSString*)record;
//- (void)fetchRecordWithGrouping:(NSString*)record;
- (void)addRecordToFetchQueue:(NSString*)record_id;
//- (void)fetchRecord:(NSString*)record andAssociateToRecord:(id<NSObject>)associatedRecord;

@end
