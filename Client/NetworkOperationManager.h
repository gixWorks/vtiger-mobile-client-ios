//
//  NetworkOperationManager.h
//  FunctionalitiesApp
//
//  Created by Giovanni on 11/23/13.
//  Copyright (c) 2013 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URLCheckerClientDelegate.h"

@class URLCheckerClient;
@class NetworkOperationManager;

extern NSString* const kManagerHasFinishedCheckURL;
extern NSString* const kManagerHasFinishedLogin;
extern NSString* const kManagerHasFinishedSetupLogin;
extern NSString* const kManagerHasFinishedSyncCalendar;
extern NSString* const kManagerHasFinishedDescribe;
extern NSString* const kManagerHasFinishedFetchRecord;
extern NSString* const kManagerHasFinishedFetchRecordWithGrouping;
extern NSString* const kManagerHasFinishedFetchRecordsWithGrouping;

extern NSString* const kManagerHasStartedSyncCalendar;

@interface NetworkOperationManager : NSObject <URLCheckerClientDelegate>

+ (NetworkOperationManager*)sharedInstance;

/**
 *  Checks for exisiting server for the specified URL, first trying https then https
 *
 *  @param serverUrl the URL to check
 */
- (void)checkURL:(NSString*)serverUrl;

/**
 *  Checks for reachability of network using Apple reachability
 *
 *  @return the reachability value YES or NO
 */
- (BOOL)checkReachability;

/**
 *  Performs the login operation using the credentials stored in the db/keychain
 */
- (void)login;

/**
 *  Performs the login operation using the credentials stored in the db/keychain and retrieves list of modules
 */
- (void)loginAndSyncModules;

/**
 *  Performs the login operation using the credentials stored in the db/keychain and retrieves list of modules, and for each module retrieves the Description using the "describe" operation
 */
- (void)loginSetup;

/**
 *  Performs the login operation with specified username and password. Used when setting up the app
 *
 *  @param username the user's username
 *  @param password the user's password
 */
- (void)loginWithUsername:(NSString*)username password:(NSString*)password;

/**
 *  Performs the login operation with specified username and password and retrieves list of modules. Used when setting up the app
 *
 *  @param username the user's username
 *  @param password the user's password
 */
- (void)loginAndSyncModulesWithUsername:(NSString*)username password:(NSString*)password;

/**
 *  Performs the syncModule operation for the Calendar module ignoring the existence of sync tokens, thus syncinc from beginning of records
 */
- (void)resyncCalendar;

/**
 *  Performs the syncModule operation for the Calendar module honoring the existence of sync tokens in the db
 */
- (void)syncCalendar;

/**
 *  Performs the syncModule operation for the Calendar starting from a specific page in the paginated records list
 *
 *  @param page the page number
 */
- (void)syncCalendarFromPage:(NSNumber*)page;

/**
 *  Performs the describe operation for the specified module
 *
 *  @param module the module to describe
 */
- (void)describeModule:(NSString*)module;

/**
 *  Performs the fetchRecord operation
 *
 *  @param record the record to fetch
 */
- (void)fetchRecord:(NSString*)record;

/**
 *  Performs the fetchRecordWithGrouping for the specified record and will return the notification requested
 *
 *  @param record           the record to fetch
 *  @param notificationName the notification to post afterwards
 */
- (void)fetchRecordWithGrouping:(NSString*)record notificationName:(NSString*)notificationName;

/**
 *  Adds a record to the queue of records to fetch after Calendar sync is completed
 *
 *  @param record_id the record id
 */
- (void)addRecordToFetchQueue:(NSString*)record_id;

@end
