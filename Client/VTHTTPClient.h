//
//  VTHTTPClient.h
//  FunctionalitiesApp
//
//  Created by Giovanni on 11/18/13.
//  Copyright (c) 2013 gixWorks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "CredentialsManager.h"

//These constants are accessed from the NetworkOperationManager 
extern NSString* const kClientHasFinishedLogin;
extern NSString* const kClientHasFinishedLoginAndFetchModules;
extern NSString* const kClientHasFinishedSyncCalendar;
extern NSString* const kClientHasFinishedDescribe;
extern NSString* const kClientHasFinishedFetchRecord;
extern NSString* const kClientHasFinishedFetchRecordWithGrouping;
extern NSString* const kClientHasFinishedFetchRecordsWithGrouping;

@interface VTHTTPClient : AFHTTPClient

+ (VTHTTPClient*)sharedInstance;

- (void)executeOperationWithParameters:(NSDictionary*)parameters notificationName:(NSString*)notificationName;


@end
