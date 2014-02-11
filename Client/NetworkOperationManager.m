//
//  NetworkOperationManager.m
//  FunctionalitiesApp
//
//  Created by Giovanni on 11/23/13.
//  Copyright (c) 2013 gixWorks. All rights reserved.
//

#import "NetworkOperationManager.h"
#import "VTHTTPClient.h"
#import "CredentialsHelper.h"
#import "ResponseParser.h"
#import "URLCheckerClient.h"
#import "NSURL+GWAdditions.h"
#import "ModulesHelper.h"

//Notification constants
NSString* const kManagerHasFinishedCheckURL = @"kManagerHasFinishedCheckURL";
NSString* const kManagerHasFinishedLogin = @"kManagerHasFinishedLogin";
NSString* const kManagerHasFinishedSetupLogin = @"kManagerHasFinishedSetupLogin";
NSString* const kManagerHasFinishedSyncCalendar = @"kManagerHasFinishedSyncCalendar";
NSString* const kManagerHasFinishedDescribe = @"kManagerHasFinishedDescribe";
NSString* const kManagerHasFinishedFetchRecord = @"kManagerHasFinishedFetchRecord";
NSString* const kManagerHasFinishedFetchRecordWithGrouping = @"kManagerHasFinishedFetchRecordWithGrouping";
NSString* const kManagerHasFinishedFetchRecordsWithGrouping = @"kManagerHasFinishedFetchRecordsWithGrouping";

NSString* const kManagerHasStartedSyncCalendar = @"kManagerHasStartedSyncCalendar";

//Notification suffix for building notifications to the HTTP client
NSString* const kNotificationSuffixHTTP = @"HTTP";

//Operation constants
NSString* const kOperationLogin = @"login";
NSString* const kOperationLoginAndFetchModules = @"loginAndFetchModules";
NSString* const kOperationSyncModuleRecords = @"syncModuleRecords";
NSString* const kOperationDescribe = @"describe";
NSString* const kOperationFetchRecord = @"fetchRecord";
NSString* const kOperationFetchRecordWithGrouping = @"fetchRecordWithGrouping";
NSString* const kOperationFetchRecordsWithGrouping = @"fetchRecordsWithGrouping";

//Parameters
NSString* const kSyncModePRIVATE = @"PRIVATE";
NSString* const kSyncModePUBLIC = @"PUBLIC";

@interface NetworkOperationManager ()
{
    //TODO: This is quite ugly for managing multiple Describe operations. Find a qay to manage the queue of operations
    NSInteger countOfDescribes;
    NSInteger receivedDescribes;
}

@property (nonatomic, strong) NSMutableDictionary* recordsToFetch;
@property (nonatomic, strong) NSMutableArray* describeErrors; //TODO: also this is quite ugly. Find a qay to manage the queue of operations

@end

@implementation NetworkOperationManager

+(NetworkOperationManager *)sharedInstance {
    static dispatch_once_t pred;
    static NetworkOperationManager *shared = nil;
    dispatch_once(&pred, ^{
        shared = [[NetworkOperationManager alloc] init];
    });
    return shared;
}

- (id)init
{
    self = [super init];
    if (self) {
        
        _recordsToFetch = [[NSMutableDictionary alloc] init]; //or load from disk if "save" file is there
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleClientFinishedLogin:) name:kClientHasFinishedLogin object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleClientFinishedLoginWithoutSave:) name:kClientHasFinishedLoginWithoutSave object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleClientFinishedSync:) name:kClientHasFinishedSyncCalendar object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleClientFinishedDescribe:) name:kClientHasFinishedDescribe object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleClientFinishedFetchRecord:) name:kClientHasFinishedFetchRecord object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleClientFinishedFetchRecordWithGrouping:) name:kClientHasFinishedFetchRecordWithGrouping object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleClientHasFinishedLoginAndFetchModules:) name:kClientHasFinishedLoginAndFetchModules object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleClientFinishedFetchRecordsWithGrouping:) name:kClientHasFinishedFetchRecordsWithGrouping object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleClientFinishedSaveRecord:) name:kClientHasFinishedSaveRecord object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleClientFinishedDeleteRecords:) name:kClientHasFinishedDeleteRecords object:nil];
    }
    return self;
}

- (void)dealloc
{
    
//    [self save];

    [[NSNotificationCenter defaultCenter] removeObserver:self];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:kClientHasFinishedLogin object:nil];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:kClientHasFinishedSyncCalendar object:nil];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:kClientHasFinishedDescribe object:nil];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:kClientHasFinishedFetchRecord object:nil];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:kClientHasFinishedFetchRecordWithGrouping object:nil];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:kClientHasFinishedLoginAndFetchModules object:nil];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:kClientHasFinishedFetchRecordsWithGrouping object:nil];
}

//#pragma mark - Save and restore
//
//- (BOOL)save
//{
//    NSString *docsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//    NSString *filePath = [docsPath stringByAppendingPathComponent: @"Operations"];
//    NSMutableData *data = [NSMutableData data];
//    NSKeyedArchiver *encoder = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
//    
//    [encoder encodeObject:_recordsToFetch forKey:@"recordsToFetch"];
//    [encoder finishEncoding];
//    
//    BOOL result = [data writeToFile:filePath atomically:YES];
//    [self addSkipBackupAttributeToItemAtURL:filePath]; //convert filePath to URL first
//    return result;
//}
//
//- (void)restore
//{
//    NSLog(@"RESTORE NETWORKOPERATIONSMANAGER!");
//    NSString *docsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//    NSString *filePath = [docsPath stringByAppendingPathComponent: @"Operations"];
//    NSMutableData *data = [[NSMutableData alloc] initWithContentsOfFile:filePath];
//    
//    if (data){
//        NSKeyedUnarchiver *decoder = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
//        _recordsToFetch = [decoder decodeObjectForKey:@"recordsToFetch"];
//        [decoder finishDecoding];
//    }
//    else
//    {
//        NSLog(@"Data for restoring is NULL");
//    }
//    
//}

/** Avoid to backup to iCloud
 @param URL the file URL
 @return the success of the operation
 */
- (BOOL)addSkipBackupAttributeToItemAtURL:(NSURL *)URL
{
    assert([[NSFileManager defaultManager] fileExistsAtPath: [URL path]]);
    
    NSError *error = nil;
    BOOL success = [URL setResourceValue: [NSNumber numberWithBool: YES]
                                  forKey: NSURLIsExcludedFromBackupKey error: &error];
    if(!success){
        NSLog(@"Error excluding %@ from backup %@", [URL lastPathComponent], error);
    }
    return success;
}

#pragma mark - Actions

- (void)checkURL:(NSString*)serverUrl
{
    //Check if the url entered is valid
    NSString *urlString = serverUrl;
    if (![self validateUrl:serverUrl]) {
        //the url is not a valid url!
        //maybe it just needs the resource specifier
        if (![urlString hasPrefix:@"http://"] && ![urlString hasPrefix:@"https://"]) {
            //We are here: means the server url does not start neither with http or https
            //I try to build a http:// URL
            urlString = [@"http://" stringByAppendingString:urlString];
            if (![self validateUrl:urlString]) {
                //it's not a valid url either, means the error must be somewhere else along the URL
                NSDictionary *userInfo = @{@"error": @"The URL provided is not a valid URL"};
                [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasFinishedCheckURL object:self userInfo:userInfo];
            }
            else{
                //adding HTTP worked, means that the user just forgot the http:// stuff at beginning
                //In this case, we need to test HTTPS first and then HTTP
            }
        }
    }
    //If we're here, we got a URL that is synctactically correct
    NSURL *userUrl = [NSURL URLWithString:urlString];
    NSString *mobileModulePath = @"modules/Mobile/api.php";
    if ([[userUrl lastPathComponent] isEqualToString:@"api.php"]) {
        //means that the user already entered a path that ends with api.php, so we just continue
    }
    else{
        //if we are here, means that the user specified an URL without the ending "api.php", so it may be just the base CRM url
        userUrl = [userUrl URLByAppendingPathComponent:mobileModulePath];
    }
    
    //Now it's time to check if the provided url has https:// already or not. and we create 2 URLs: a secure and a non-secure one
    //Is it HTTP or HTTPS? This is what resourceSpecifier is for
    NSURL *secureUserUrl;
    if ([[userUrl scheme] isEqualToString:@"http"]) {
        secureUserUrl = [userUrl GW_secureURL];
    }
    else{
        secureUserUrl = userUrl;
        userUrl = [userUrl GW_nonSecureURL];
    }

    //We now send a request to URL, to check if it points to an existing resource (HTTP CODE = 200)
    URLCheckerClient *client =  [[URLCheckerClient alloc] initWithDelegate:self url:secureUserUrl];
    [client startTestingReachability];
}

- (BOOL) validateUrl: (NSString *) candidate {
    NSString *urlRegEx =
    @"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    return [urlTest evaluateWithObject:candidate];
}

- (void)urlCheckerDidFinishWithError:(NSString *)error url:(NSURL *)testedUrl
{
    if (error != nil) {
        //There was an error when trying to reach the URL
        if ([[testedUrl scheme] isEqualToString:@"http"]) {
            //if we were in http:// scheme, means that we totally failed the check
            NSDictionary *userInfo = @{@"url": testedUrl, @"error": error};
            [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasFinishedCheckURL
                                                                object:self
                                                              userInfo:userInfo
             ];
            return;
        }
        else if([[testedUrl scheme] isEqualToString:@"https"]){
            //if it was a https:, we can still try http://
            NSURL *userUrl = [testedUrl GW_nonSecureURL];
            URLCheckerClient *client =  [[URLCheckerClient alloc] initWithDelegate:self url:userUrl];
            [client startTestingReachability];
        }
        else{
            //We should not get here
        }
    }
    else{
        //There was no error, means the check resulted successful and we post the notification
        NSDictionary *userInfo = @{@"url" : testedUrl};
        [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasFinishedCheckURL
                                                            object:self
                                                          userInfo:userInfo
         ];
        return;
    }
}

- (BOOL)checkReachability
{
    VTHTTPClient *c = [VTHTTPClient sharedInstance];
    NSInteger reachable = [c networkReachabilityStatus];
    if (reachable == AFNetworkReachabilityStatusReachableViaWiFi || reachable == AFNetworkReachabilityStatusReachableViaWWAN)   {
        return YES;
    }
    else{
        return NO;
    }
}

- (void)login
{
    NSString *username = [Service getActiveServiceUsername];
    NSString *password = [CredentialsHelper getPassword];
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:kOperationLogin,@"_operation", username, @"username", password, @"password", nil];
    DDLogDebug(@"%@ %@ Starting Login operation", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    [[VTHTTPClient sharedInstance] executeOperationWithoutLoginWithParameters:parameters notificationName:kClientHasFinishedLogin];
}

- (void)loginAndSyncModules
{
    NSString *username = [Service getActiveServiceUsername];
    NSString *password = [CredentialsHelper getPassword];
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:kOperationLoginAndFetchModules,@"_operation", username, @"username", password, @"password", nil];
    DDLogDebug(@"%@ %@ Starting LoginAndSync operation", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    [[VTHTTPClient sharedInstance] executeOperationWithoutLoginWithParameters:parameters notificationName:kClientHasFinishedLoginAndFetchModules];
}

- (void)loginSetup
{
    NSString *username = [Service getActiveServiceUsername];
    NSString *password = [CredentialsHelper getPassword];
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:kOperationLoginAndFetchModules,@"_operation", username, @"username", password, @"password", nil];
    DDLogDebug(@"%@ %@ Starting %@ operation", NSStringFromClass([self class]), NSStringFromSelector(_cmd), kOperationLoginAndFetchModules   );
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleSetupLogin:) name:@"finishedLoginSetup" object:nil];
    [[VTHTTPClient sharedInstance] executeOperationWithoutLoginWithParameters:parameters notificationName:@"finishedLoginSetup"];
}

- (void)loginWithUsername:(NSString*)username password:(NSString*)password
{
    //Used when testing if username and password are correct during login
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                kOperationLogin,@"_operation",
                                username, @"username",
                                password, @"password",
                                nil];
    [[VTHTTPClient sharedInstance] executeOperationWithoutLoginWithParameters:parameters notificationName:kClientHasFinishedLoginWithoutSave];
}

- (void)syncCalendar
{
    SyncToken *syncToken = [[SyncToken MR_findByAttribute:@"module" withValue:kVTModuleCalendar andOrderBy:@"datetime" ascending:YES] lastObject];
    DDLogDebug(@"%@ with syncToken: %@", NSStringFromSelector(_cmd), syncToken.token);
    //If the date is > xx minutes since last sync
    NSTimeInterval interval = 15 * 60;
    if ([syncToken.datetime timeIntervalSinceNow] < interval) {
        [self syncCalendarFromPage:[NSNumber numberWithInt:0]];
        [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasStartedSyncCalendar object:self];
        DDLogDebug(@"%@ %@ Starting Calendar Sync operation", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    }
    else{
        DDLogInfo(@"%@ %@ last sync time (%@) compared to now > than interval, no syncing", NSStringFromClass([self class]), NSStringFromSelector(_cmd), syncToken.datetime);
    }
}

- (void)resyncCalendar
{
    DDLogVerbose(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    NSString *session = [CredentialsHelper getSession];
    //Build parameters ignoring the synctoken
    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:kOperationSyncModuleRecords,@"_operation", kVTModuleCalendar, @"module", session, @"_session", kSyncModePRIVATE, @"mode", nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasStartedSyncCalendar object:self];
    [[VTHTTPClient sharedInstance] executeOperationWithParameters:params notificationName:kClientHasFinishedSyncCalendar];
}

- (void)syncCalendarFromPage:(NSNumber*)page
{
    DDLogVerbose(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    SyncToken *syncToken = [[SyncToken MR_findByAttribute:@"module" withValue:kVTModuleCalendar andOrderBy:@"datetime" ascending:YES] lastObject];
    NSString *token = syncToken.token;
    NSString *session = [CredentialsHelper getSession];
    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:kOperationSyncModuleRecords,@"_operation", kVTModuleCalendar, @"module", session, @"_session", kSyncModePRIVATE, @"mode", token, @"syncToken", nil];
    [[VTHTTPClient sharedInstance] executeOperationWithParameters:params notificationName:kClientHasFinishedSyncCalendar];

}

- (void)describeModule:(NSString*)module
{
    DDLogVerbose(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    NSString *session = [CredentialsHelper getSession];
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:kOperationDescribe,@"_operation", session, @"_session", module, @"module",  nil];

    [[VTHTTPClient sharedInstance] executeOperationWithParameters:parameters notificationName:kClientHasFinishedDescribe];
}

- (void)fetchRecord:(NSString*)record
{
    NSString *session = [CredentialsHelper getSession];
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:kOperationFetchRecord,@"_operation", session, @"_session", record, @"record",  nil];
    DDLogDebug(@"%@ %@ Starting FetchRecord: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), record);
    [[VTHTTPClient sharedInstance] executeOperationWithParameters:parameters notificationName:kClientHasFinishedFetchRecord];
}

- (void)fetchRecordWithGrouping:(NSString*)record notificationName:(NSString*)notificationName
{
    NSString *httpNotificationName = [NSString stringWithFormat:@"%@-%@", notificationName, kNotificationSuffixHTTP];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleClientFinishedFetchRecordWithGrouping:) name:httpNotificationName object:nil];
    NSString *session = [CredentialsHelper getSession];
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:kOperationFetchRecordWithGrouping,@"_operation", session, @"_session", record, @"record",  nil];
    DDLogDebug(@"%@ %@ Starting FetchRecordWithGrouping: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), record);
    [[VTHTTPClient sharedInstance] executeOperationWithParameters:parameters notificationName:httpNotificationName];
}

- (void)saveChangesToServer
{
    //This goes through the table with records to update and delete and sends to server the requests
}

//- (void)fetchRecord:(NSString*)record andAssociateToRecord:(id<NSObject>)associatedRecord
//{
//    NSString *notificationName = [record stringByAppendingString:@"fetch"];
//    [[NSNotificationCenter defaultCenter] addObserverForName:notificationName object:nil queue:nil usingBlock:^(NSNotification *note) {
//    
//        NSDictionary *JSON = [[note userInfo] objectForKey:kClientNotificationResponseBodyKey];
//        //parse the record and get the fetched record
//        //associate with associatedRecord
//        id <NSObject> object = [[ResponseParser parseFetchRecord:JSON] objectForKey:@"record"];
//        if ([associatedRecord isKindOfClass:[Activity class]]) {
//            //it's an Activity Record
//            if ([object isKindOfClass:[Lead class]]) {
//                [((Activity*)associatedRecord) setRelatedlead:object];
//            }
//        }
//        
//        
//        [[NSNotificationCenter defaultCenter] removeObserver:self name:record object:nil];
//    }];
//    
////    NSString *module_id = [[record componentsSeparatedByString:@"x"] objectAtIndex:0];
//    NSString *session = [[AppState sharedInstance] session];
//    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:kOperationFetchRecordWithGrouping,@"_operation", session, @"_session", record, @"record",  nil];
//    [[VTHTTPClient sharedInstance] executeOperationWithParameters:parameters notificationName:notificationName];
//    
//}

#pragma mark - Mass Records fetch (no sync)

- (void)addRecordToFetchQueue:(NSString*)record_id
{
    NSString *module = [ModulesHelper decodeModuleForRecordId:record_id];
    NSMutableArray *queue = [_recordsToFetch objectForKey:module];
    if (queue == nil) {
        queue = [[NSMutableArray alloc] init];
        [queue addObject:record_id];
        
    }
    else{
        if ([queue indexOfObject:record_id] == NSNotFound) {
            [queue addObject:record_id];
        }
    }
    DDLogDebug(@"%@ %@ Added record %@ to queue", NSStringFromClass([self class]), NSStringFromSelector(_cmd), record_id);
    [_recordsToFetch setObject:queue forKey:module];
}

- (void)processFetchQueue
{
    for (NSString* module in _recordsToFetch) {
        NSArray *queue = [[_recordsToFetch objectForKey:module] copy];
        if (![queue count] > 0) {
            break;
        }
        NSString *session = [CredentialsHelper getSession];
       
        NSError *jsonError;
        NSString *queueString = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:queue options:0 error:&jsonError] encoding:NSUTF8StringEncoding] ;
        //queueString should be in the form: ["18x1164", "1x1151"]
        
        NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:kOperationFetchRecordsWithGrouping,@"_operation", module, @"module", queueString, @"ids", session, @"_session", @"", @"alertid", nil];
        DDLogDebug(@"%@ %@ Processing fetch queue for module :%@ IDs: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), module, queueString);
        [[VTHTTPClient sharedInstance] executeOperationWithParameters:parameters notificationName:kClientHasFinishedFetchRecordsWithGrouping];
    }
}

#pragma mark - Notification handlers

- (void)handleClientFinishedLogin:(NSNotification*)notification
{
    DDLogDebug(@"%@ %@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [notification userInfo]);
    
    if (![[notification userInfo] objectForKey:kClientNotificationErrorKey]) {
        NSDictionary *JSON = [[notification userInfo] objectForKey:kClientNotificationResponseBodyKey];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSDictionary *parseLoginResult = [ResponseParser parseLogin:JSON saveToDB:YES];
            dispatch_sync(dispatch_get_main_queue(), ^{
                [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasFinishedLogin object:self userInfo:parseLoginResult];
            });
        });
    }
    else{
        //There was an error in the HTTPClient
        DDLogWarn(@"HTTPClient Error in %@ %@: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [[[notification userInfo] objectForKey:@"error"] objectForKey:@"message"]);
        NSDictionary *userInfo = @{@"error" : [notification userInfo][kClientNotificationErrorKey][@"message"] };
        [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasFinishedLogin object:self userInfo:userInfo];
    }
}

- (void)handleClientFinishedLoginWithoutSave:(NSNotification*)notification
{
    DDLogDebug(@"%@ %@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [notification userInfo]);
    
    if (![[notification userInfo] objectForKey:kClientNotificationErrorKey]) {
        NSDictionary *JSON = [[notification userInfo] objectForKey:kClientNotificationResponseBodyKey];
        NSDictionary *parseLoginResult = [ResponseParser parseLogin:JSON saveToDB:NO];
        [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasFinishedLogin object:self userInfo:parseLoginResult];
    }
    else{
        //There was an error in the HTTPClient
        DDLogWarn(@"HTTPClient Error in %@ %@: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [[[notification userInfo] objectForKey:@"error"] objectForKey:@"message"]);
        NSDictionary *userInfo = @{@"error" : [notification userInfo][kClientNotificationErrorKey][@"message"] };
        [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasFinishedLogin object:self userInfo:userInfo];
    }
}

- (void)handleSetupLogin:(NSNotification*)notification
{
    DDLogDebug(@"%@ %@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [notification userInfo]);
    
    if (![[notification userInfo] objectForKey:kClientNotificationErrorKey]) {
        NSDictionary *parseLoginResult = [ResponseParser parseLogin:[[notification userInfo] objectForKey:kClientNotificationResponseBodyKey] saveToDB:YES];
        if ([parseLoginResult objectForKey:@"error"] == nil) {
            //login result was parsed, which means that modules have been created
            NSPredicate *p = [NSPredicate predicateWithFormat:@"service = %@", [Service getActive]];
            NSInteger count = [Module MR_countOfEntitiesWithPredicate:p];
            DDLogDebug(@"%d modules to Describe found in current Service", count);
            NSArray *modules = [Module MR_findAllWithPredicate:p inContext:[NSManagedObjectContext MR_defaultContext]];
            countOfDescribes = count;
            receivedDescribes = 0;
            _describeErrors = nil;
            _describeErrors = [[NSMutableArray alloc] init];
            for (Module *module in modules) {
                [self describeModule:module.crm_name];
            }
        }
        //Don't notify yet. Notification will be sent when all Describe operations are over
    }
    else{
        //There was an error in the HTTPClient
        DDLogWarn(@"HTTPClient Error in %@ %@: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [[[notification userInfo] objectForKey:@"error"] objectForKey:@"message"]);
        NSDictionary *userInfo = @{@"error" : [notification userInfo][kClientNotificationErrorKey][@"message"] };
        [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasFinishedSetupLogin object:self userInfo:userInfo];
    }
}

- (void)handleClientHasFinishedLoginAndFetchModules:(NSNotification*)notification
{
    DDLogDebug(@"%@ %@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [notification userInfo]);

    if (![[notification userInfo] objectForKey:kClientNotificationErrorKey]) {
        //No error, so perform Core Data stuff here
        NSDictionary *JSON = [[notification userInfo] objectForKey:kClientNotificationResponseBodyKey];
        NSDictionary *parseResult = [ResponseParser parseLogin:JSON saveToDB:YES];

        if ([parseResult objectForKey:@"error"] != nil){
            DDLogWarn(@"%@ %@ Error: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [[parseResult objectForKey:@"error"] description]);
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasFinishedLogin object:self userInfo:parseResult];
    }
    else{
        //There was an error in the HTTPClient
        DDLogWarn(@"HTTPClient Error in %@ %@: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [[[notification userInfo] objectForKey:kClientNotificationErrorKey] objectForKey:@"message"]);
        [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasFinishedLogin object:self userInfo:[notification userInfo]];
    }
}

- (void)handleClientFinishedSync:(NSNotification*)notification
{
    DDLogDebug(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    
    if (![[notification userInfo] objectForKey:kClientNotificationErrorKey]) {
        //parse the results
        NSDictionary *JSON = [[notification userInfo] objectForKey:kClientNotificationResponseBodyKey];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSDictionary *parseResult = [ResponseParser parseCalendarSync:JSON];
            if ([parseResult objectForKey:@"error"] != nil)
            {
                DDLogWarn(@"%@ %@ Error: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [[parseResult objectForKey:@"error"] description]);
            }
            dispatch_sync(dispatch_get_main_queue(), ^{
                //Sync is finished calendar records are parsed, it's time to process the Fetch Queue to fetch all the records that should be associated to the ones that were synced
                [self processFetchQueue];
                [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasFinishedSyncCalendar object:self userInfo:parseResult];
            });
        });
    }
    else{
        //There was an error in the HTTPClient
        DDLogWarn(@"HTTPClient Error in %@ %@: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [[[notification userInfo] objectForKey:kClientNotificationErrorKey] objectForKey:@"message"]);
        [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasFinishedSyncCalendar object:self userInfo:[notification userInfo]];
    }
}

- (void)handleClientFinishedDescribe:(NSNotification*)notification
{
    DDLogDebug(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    
    if (![[notification userInfo] objectForKey:kClientNotificationErrorKey]) {
        NSDictionary *JSON = [[notification userInfo] objectForKey:kClientNotificationResponseBodyKey];
        NSDictionary *parseResult = [ResponseParser parseDescribe:JSON];
        if ([parseResult objectForKey:@"error"] != nil){
            DDLogWarn(@"%@ %@ Error: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [[parseResult objectForKey:@"error"] description]);
            [_describeErrors addObject:[parseResult objectForKey:@"error"]];
        }
    }
    else{
        //There was an error in the HTTPClient
        DDLogWarn(@"HTTPClient Error in %@ %@: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [[[notification userInfo] objectForKey:kClientNotificationErrorKey] objectForKey:@"message"]);
        [_describeErrors addObject:[[[notification userInfo] objectForKey:kClientNotificationErrorKey] objectForKey:@"message"]];
    }
    receivedDescribes += 1;
    if (receivedDescribes == countOfDescribes) {
        NSDictionary *userInfo = @{@"error" : _describeErrors};
        [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasFinishedSetupLogin object:self userInfo:userInfo];
    }
}


- (void)handleClientFinishedFetchRecord:(NSNotification*)notification
{
    DDLogDebug(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));

    if (![[notification userInfo] objectForKey:kClientNotificationErrorKey]) {
        NSDictionary *JSON = [[notification userInfo] objectForKey:kClientNotificationResponseBodyKey];
        NSDictionary *parseResult = [ResponseParser parseFetchRecord:JSON];
        if ([parseResult objectForKey:@"error"] != nil){
            DDLogWarn(@"%@ %@ Parser returned error: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [[parseResult objectForKey:@"error"] description]);
            [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasFinishedFetchRecord object:self userInfo:parseResult];
        }
    }
    else{
        //There was an error in the HTTPClient
        DDLogWarn(@"HTTPClient Error in %@ %@: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [[[notification userInfo] objectForKey:kClientNotificationErrorKey] objectForKey:@"message"]);
        [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasFinishedFetchRecord object:self userInfo:[notification userInfo]];
    }
}

- (void)handleClientFinishedFetchRecordWithGrouping:(NSNotification*)notification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:notification.name object:nil];
    //Notification name should be in the form fetchRecordWithGrouping1x123-http , so we discard the "http" part and we take the first part, which is the notification name that the ViewController is watching
    NSString *notificationName = [[notification.name componentsSeparatedByString:@"-"] objectAtIndex:0];
    DDLogDebug(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    if (![[notification userInfo] objectForKey:kClientNotificationErrorKey]) {
        //Everything ok, process
        NSDictionary *JSON = [[notification userInfo] objectForKey:kClientNotificationResponseBodyKey];
        NSDictionary *parseResult = [ResponseParser parseFetchRecordWithGrouping:JSON];
        if ([parseResult objectForKey:@"error"] != nil){
            DDLogWarn(@"%@ %@ Parser returned error: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [[parseResult objectForKey:@"error"] description]);
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:self userInfo:parseResult];
    }
    else{
        //There was an error in the HTTPClient
        DDLogWarn(@"HTTPClient Error in %@ %@: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [[[notification userInfo] objectForKey:kClientNotificationErrorKey] objectForKey:@"message"]);
        [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:self userInfo:[notification userInfo]];
    }
}

- (void)handleClientFinishedFetchRecordsWithGrouping:(NSNotification*)notification
{
    DDLogDebug(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));

    if (![[notification userInfo] objectForKey:kClientNotificationErrorKey]) {
        //Everything ok, process
        NSDictionary *JSON = [[notification userInfo] objectForKey:kClientNotificationResponseBodyKey];
        NSString *module = [[[notification userInfo] objectForKey:@"parameters"] objectForKey:@"module"];
        NSDictionary *parseResult = [ResponseParser parseFetchRecordsWithGrouping:JSON forModule:module];
        
        if ([parseResult objectForKey:@"error"] != nil){
            DDLogWarn(@"%@ %@ Parser returned error: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [[parseResult objectForKey:@"error"] description]);
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasFinishedFetchRecordsWithGrouping object:self userInfo:nil];
    }
    else{
        //There was an error in the HTTPClient
        DDLogWarn(@"API  Error in %@ %@: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [[[notification userInfo] objectForKey:kClientNotificationErrorKey] objectForKey:@"message"]);
        [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasFinishedFetchRecordsWithGrouping object:self userInfo:[notification userInfo]];
    }
}

- (void)handleSaveRecord:(NSNotification*)notification
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    //check if response is positive
    //remove record from table of records to be sent to server
}

- (void)handleDeleteRecords:(NSNotification*)notification
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    //check if response is positive
    //remove records from table of records to be sent to server for deletion
}

@end
