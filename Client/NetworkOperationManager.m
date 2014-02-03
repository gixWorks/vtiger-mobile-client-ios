//
//  NetworkOperationManager.m
//  FunctionalitiesApp
//
//  Created by Giovanni on 11/23/13.
//  Copyright (c) 2013 gixWorks. All rights reserved.
//

#import "NetworkOperationManager.h"

//Notification constants
NSString* const kManagerHasFinishedCheckURL = @"kManagerHasFinishedCheckURL";
NSString* const kManagerHasFinishedLogin = @"kManagerHasFinishedLogin";
NSString* const kManagerHasFinishedSyncCalendar = @"kManagerHasFinishedSyncCalendar";
NSString* const kManagerHasFinishedDefine = @"kManagerHasFinishedDefine";
NSString* const kManagerHasFinishedFetchRecord = @"kManagerHasFinishedFetchRecord";
NSString* const kManagerHasFinishedFetchRecordWithGrouping = @"kManagerHasFinishedFetchRecordWithGrouping";
NSString* const kManagerHasFinishedFetchRecordsWithGrouping = @"kManagerHasFinishedFetchRecordsWithGrouping";

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

@property (nonatomic, strong) NSMutableDictionary* recordsToFetch;

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
        
        _recordsToFetch = [[NSMutableDictionary alloc] init];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleClientFinishedLogin:) name:kClientHasFinishedLogin object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleClientFinishedSync:) name:kClientHasFinishedSyncCalendar object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleClientFinishedDescribe:) name:kClientHasFinishedDescribe object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleClientFinishedFetchRecord:) name:kClientHasFinishedFetchRecord object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleClientFinishedFetchRecordWithGrouping:) name:kClientHasFinishedFetchRecordWithGrouping object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleClientHasFinishedLoginAndFetchModules:) name:kClientHasFinishedLoginAndFetchModules object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleClientFinishedFetchRecordsWithGrouping:) name:kClientHasFinishedFetchRecordsWithGrouping object:nil];
    }
    return self;
}

- (void)dealloc
{
    
//    [self save];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kClientHasFinishedLogin object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kClientHasFinishedSyncCalendar object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kClientHasFinishedDescribe object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kClientHasFinishedFetchRecord object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kClientHasFinishedFetchRecordWithGrouping object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kClientHasFinishedLoginAndFetchModules object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kClientHasFinishedFetchRecordsWithGrouping object:nil];
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
//    
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
                NSLog(@"error must be somewhere else");
                NSDictionary *userInfo = @{@"error": @"The URL provided is not a valid URL"};
                [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasFinishedCheckURL object:self userInfo:userInfo];
            }
            else{
                //adding HTTP worked, means that the user just forgot the http:// stuff at beginning
                //In this case, we need to test HTTPS first and then HTTP
                //TODO: test HTTPS first, then HTTP
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
    NSString *password = [CredentialsManager getPassword];
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:kOperationLogin,@"_operation", username, @"username", password, @"password", nil];
    NSLog(@"%@ %@ Starting Login operation", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    [[VTHTTPClient sharedInstance] executeOperationWithoutLoginWithParameters:parameters notificationName:kClientHasFinishedLogin];
}

- (void)loginAndSyncModules
{
    NSString *username = [Service getActiveServiceUsername];
    NSString *password = [CredentialsManager getPassword];
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:kOperationLoginAndFetchModules,@"_operation", username, @"username", password, @"password", nil];
    NSLog(@"%@ %@ Starting LoginAndSync operation", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    [[VTHTTPClient sharedInstance] executeOperationWithoutLoginWithParameters:parameters notificationName:kClientHasFinishedLoginAndFetchModules];
}

- (void)loginSetup
{
    
}

- (void)loginWithUsername:(NSString*)username password:(NSString*)password
{
    //Used when testing if username and password are correct during login
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                kOperationLogin,@"_operation",
                                username, @"username",
                                password, @"password",
                                nil];
    [[VTHTTPClient sharedInstance] executeOperationWithoutLoginWithParameters:parameters notificationName:kClientHasFinishedLogin];
}

- (void)loginAndSyncModulesWithUsername:(NSString*)username password:(NSString*)password
{
    //TODO: Keep?
    [CredentialsManager savePassword:password];
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:kOperationLoginAndFetchModules,@"_operation", username, @"username", password, @"password", nil];
    [[VTHTTPClient sharedInstance] executeOperationWithoutLoginWithParameters:parameters notificationName:kClientHasFinishedLoginAndFetchModules];
}

- (void)syncCalendar
{
    SyncToken *syncToken = [[SyncToken MR_findByAttribute:@"module" withValue:kVTModuleCalendar andOrderBy:@"datetime" ascending:YES] lastObject];
    //If the date is > xx minutes since last sync
    NSTimeInterval interval = 15 * 60;
    if (syncToken.datetime == nil || [syncToken.datetime timeIntervalSinceNow] > interval) {
        [self syncCalendarFromPage:[NSNumber numberWithInt:0]];
        NSLog(@"%@ %@ Starting Calendar Sync operation", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    }
    else{
        NSLog(@"%@ %@ sync time < than interval, no syncing", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    }
}

- (void)resyncCalendar
{
    NSString *session = [CredentialsManager getSession];
    //Build parameters ignoring the synctoken
    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:kOperationSyncModuleRecords,@"_operation", kVTModuleCalendar, @"module", session, @"_session", kSyncModePRIVATE, @"mode", nil];
    [[VTHTTPClient sharedInstance] executeOperationWithParameters:params notificationName:kClientHasFinishedSyncCalendar];
}

- (void)syncCalendarFromPage:(NSNumber*)page
{
    NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    SyncToken *syncToken = [[SyncToken MR_findByAttribute:@"module" withValue:kVTModuleCalendar andOrderBy:@"datetime" ascending:YES] lastObject];
    NSString *token = syncToken.token;
    NSString *session = [CredentialsManager getSession];
    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:kOperationSyncModuleRecords,@"_operation", kVTModuleCalendar, @"module", session, @"_session", kSyncModePRIVATE, @"mode", token, @"syncToken", nil];
    [[VTHTTPClient sharedInstance] executeOperationWithParameters:params notificationName:kClientHasFinishedSyncCalendar];

}

- (void)describeModule:(NSString*)module
{
    NSString *session = [CredentialsManager getSession];
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:kOperationDescribe,@"_operation", session, @"_session", module, @"module",  nil];

    [[VTHTTPClient sharedInstance] executeOperationWithParameters:parameters notificationName:kClientHasFinishedDescribe];
}

- (void)fetchRecord:(NSString*)record
{
    NSString *session = [CredentialsManager getSession];
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:kOperationFetchRecord,@"_operation", session, @"_session", record, @"record",  nil];
    NSLog(@"%@ %@ Starting FetchRecord: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), record);
    [[VTHTTPClient sharedInstance] executeOperationWithParameters:parameters notificationName:kClientHasFinishedFetchRecord];
}

- (void)fetchRecordWithGrouping:(NSString*)record
{
    NSString *session = [CredentialsManager getSession];
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:kOperationFetchRecordWithGrouping,@"_operation", session, @"_session", record, @"record",  nil];
    NSLog(@"%@ %@ Starting FetchRecordWithGrouping: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), record);
    [[VTHTTPClient sharedInstance] executeOperationWithParameters:parameters notificationName:kClientHasFinishedFetchRecordWithGrouping];
}

//- (void)fetchRecord:(NSString*)record andAssociateToRecord:(id<NSObject>)associatedRecord
//{
//    NSString *notificationName = [record stringByAppendingString:@"fetch"];
//    [[NSNotificationCenter defaultCenter] addObserverForName:notificationName object:nil queue:nil usingBlock:^(NSNotification *note) {
//    
//        NSDictionary *JSON = [[note userInfo] objectForKey:@"result"];
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
    NSString *module = [ResponseParser decodeRecordType:record_id];
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
    NSLog(@"%@ %@ Added record %@ to queue", NSStringFromClass([self class]), NSStringFromSelector(_cmd), record_id);
    [_recordsToFetch setObject:queue forKey:module];
}

- (void)processFetchQueue
{
    for (NSString* module in _recordsToFetch) {
        NSArray *queue = [[_recordsToFetch objectForKey:module] copy];
        if (![queue count] > 0) {
            break;
        }
        NSString *session = [CredentialsManager getSession];
       
        NSError *jsonError;
        NSString *queueString = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:queue options:0 error:&jsonError] encoding:NSUTF8StringEncoding] ;
        
        NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:kOperationFetchRecordsWithGrouping,@"_operation", module, @"module", queueString, @"ids", session, @"_session", @"", @"alertid", nil];
        NSLog(@"%@ %@ Processing fetch queue for IDs: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), queueString);
        [[VTHTTPClient sharedInstance] executeOperationWithParameters:parameters notificationName:kClientHasFinishedFetchRecordsWithGrouping];
    }
}

#pragma mark - Notification handlers

- (void)handleClientFinishedLogin:(NSNotification*)notification
{
#if DEBUG
    NSLog(@"%@ %@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [notification userInfo]);
#endif
    
    if (![[notification userInfo] objectForKey:@"error"]) {
        
        NSDictionary *parseLoginResult = [ResponseParser parseLogin:[[notification userInfo] objectForKey:@"result"]];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasFinishedLogin object:self userInfo:parseLoginResult];
    }
    else{
        //There was an error in the HTTPClient
        NSLog(@"HTTPClient Error in %@ %@: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [[[notification userInfo] objectForKey:@"error"] objectForKey:@"message"]);
        NSDictionary *userInfo = @{@"error" : [notification userInfo][@"error"][@"message"] };
        [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasFinishedLogin object:self userInfo:userInfo];
    }
}

- (void)handleClientHasFinishedLoginAndFetchModules:(NSNotification*)notification
{
#if DEBUG
    NSLog(@"%@ %@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [notification userInfo]);
#endif

    if (![[notification userInfo] objectForKey:@"error"]) {
        //No error, so perform Core Data stuff here
        NSDictionary *JSON = [[notification userInfo] objectForKey:@"result"];
        NSDictionary *result = [ResponseParser parseLogin:JSON];

        if ([result objectForKey:@"error"] != nil){
            NSLog(@"%@ %@ Error: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [[result objectForKey:@"error"] description]);
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasFinishedLogin object:self userInfo:result];
    }
    else{
        //There was an error in the HTTPClient
        NSLog(@"HTTPClient Error in %@ %@: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [[[notification userInfo] objectForKey:@"error"] objectForKey:@"message"]);
        [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasFinishedLogin object:self userInfo:[notification userInfo]];
    }
}

- (void)handleClientFinishedSync:(NSNotification*)notification
{
#if DEBUG
    NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif

    if (![[notification userInfo] objectForKey:@"error"]) {
        //parse the results
        NSDictionary *JSON = [[notification userInfo] objectForKey:@"result"];
        NSDictionary *result = [ResponseParser parseCalendarSync:JSON];
        if ([result objectForKey:@"error"] != nil)
        {
            NSLog(@"%@ %@ Error: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [[result objectForKey:@"error"] description]);

        }
        
        //Sync is finished, time to process the Fetch Queue to fetch all the records that should be associated to the ones that were synced
        [self processFetchQueue];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasFinishedSyncCalendar object:self userInfo:result];
        
    }
    else{
        //There was an error in the HTTPClient
        NSLog(@"HTTPClient Error in %@ %@: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [[[notification userInfo] objectForKey:@"error"] objectForKey:@"message"]);
        [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasFinishedSyncCalendar object:self userInfo:[notification userInfo]];
    }
}

- (void)handleClientFinishedDescribe:(NSNotification*)notification
{
#if DEBUG
    NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif

    if (![[notification userInfo] objectForKey:@"error"]) {
        //Everything ok, pass back to ViewController
        [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasFinishedDefine object:self userInfo:[notification userInfo]];
        
    }
    else{
        //There was an error in the HTTPClient
        NSLog(@"HTTPClient Error in %@ %@: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [[[notification userInfo] objectForKey:@"error"] objectForKey:@"message"]);
        [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasFinishedDefine object:self userInfo:[notification userInfo]];
    }
}


- (void)handleClientFinishedFetchRecord:(NSNotification*)notification
{
#if DEBUG
    NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif

    if (![[notification userInfo] objectForKey:@"error"]) {
        //No error, process
        //parse the results
        NSDictionary *JSON = [[notification userInfo] objectForKey:@"result"];

        NSDictionary *result = [ResponseParser parseFetchRecord:JSON];
        if ([result objectForKey:@"error"] != nil){
            NSLog(@"%@ %@ Error: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [[result objectForKey:@"error"] description]);
        }
    }
    else{
        //There was an error in the HTTPClient
        NSLog(@"HTTPClient Error in %@ %@: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [[[notification userInfo] objectForKey:@"error"] objectForKey:@"message"]);
        [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasFinishedFetchRecord object:self userInfo:[notification userInfo]];
    }
}

- (void)handleClientFinishedFetchRecordWithGrouping:(NSNotification*)notification
{
#if DEBUG
    NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif

    if (![[notification userInfo] objectForKey:@"error"]) {
        //Everything ok, process
        //TODO: NOT IMPLEMENTED IN PARSER YET
        [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasFinishedFetchRecordWithGrouping object:self userInfo:[notification userInfo]];
    }
    else{
        //There was an error in the HTTPClient
        NSLog(@"HTTPClient Error in %@ %@: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [[[notification userInfo] objectForKey:@"error"] objectForKey:@"message"]);
        [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasFinishedFetchRecordWithGrouping object:self userInfo:[notification userInfo]];
    }
}

- (void)handleClientFinishedFetchRecordsWithGrouping:(NSNotification*)notification
{
#if DEBUG
    NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
#endif

    if (![[notification userInfo] objectForKey:@"error"]) {
        //Everything ok, process
        NSDictionary *JSON = [[notification userInfo] objectForKey:@"result"];
        NSString *module = [[[notification userInfo] objectForKey:@"parameters"] objectForKey:@"module"];
        NSDictionary *result = [ResponseParser parseFetchRecordsWithGrouping:JSON forModule:module];
        
        if ([result objectForKey:@"error"] != nil){
            NSLog(@"%@ %@ Error in module %@: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), module, [[result objectForKey:@"error"] description]);
        }
        [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasFinishedFetchRecordWithGrouping object:self userInfo:[notification userInfo]];
    }
    else{
        //There was an error in the HTTPClient
        NSLog(@"API  Error in %@ %@: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [[[notification userInfo] objectForKey:@"error"] objectForKey:@"message"]);
        [[NSNotificationCenter defaultCenter] postNotificationName:kManagerHasFinishedFetchRecordWithGrouping object:self userInfo:[notification userInfo]];
    }
}

@end
