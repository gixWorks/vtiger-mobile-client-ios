//
//  CRMHTTPClient.m
//  FunctionalitiesApp
//
//  Created by Giovanni on 11/18/13.
//  Copyright (c) 2013 gixWorks. All rights reserved.
//

#import "CRMHTTPClient.h"
#import "CredentialsHelper.h"
#import "CRMLoginRequestOperation.h"
#import "GWCertificatesHelper.h"
#import "Service.h"
#import <CocoaLumberjack.h>
#import "DDLogLevel.h"

//Notification constants
NSString* const kClientHasFinishedLogin = @"kClientHasFinishedLogin";
NSString* const kClientHasFinishedLoginWithoutSave = @"kClientHasFinishedLoginWithoutSave";
NSString* const kClientHasFinishedLoginAndFetchModules = @"kClientHasFinishedLoginAndFetchModules";
NSString* const kClientHasFinishedSyncCalendar = @"kClientHasFinishedSyncCalendar";
NSString* const kClientHasFinishedSync = @"kClientHasFinishedSync";
NSString* const kClientHasFinishedDescribe = @"kClientHasFinishedDescribe";
NSString* const kClientHasFinishedFetchRecord = @"kClientHasFinishedFetchRecord";
NSString* const kClientHasFinishedFetchRecordWithGrouping = @"kClientHasFinishedFetchRecordWithGrouping";
NSString* const kClientHasFinishedFetchRecordsWithGrouping =  @"kClientHasFinishedFetchRecordsWithGrouping";
NSString* const kClientHasFinishedSaveRecord = @"kClientHasFinishedSaveRecord";
NSString* const kClientHasFinishedDeleteRecords = @"kClientHasFinishedDeleteRecords";
NSString* const kClientHasFinishedListRecords = @"kClientHasFinishedListRecords";
NSString* const kClientHasFinishedQuery = @"kClientHasFinishedQuery";


//Notification keys constants
NSString* const kClientNotificationResponseBodyKey = @"responseBody";
NSString* const kClientNotificationErrorKey = @"error";
NSString* const kClientNotificationParametersKey = @"parameters";

NSInteger const kErrorCodeAuthenticationFailed = 1210;
NSInteger const kErrorCodeLoginRequired = 1501;

#if DEBUG
static NSInteger kRefreshIntervalMinutes = 5;
#else
static NSInteger kRefreshIntervalMinutes = 30;
#endif

@interface CRMHTTPClient ()

@property (nonatomic, strong) NSTimer *sessionTimer;
@property (nonatomic, strong) __block void (^clientCertificateBlock)(NSURLConnection*, NSURLAuthenticationChallenge*);

@end

@implementation CRMHTTPClient

- (id) initWithBaseURL:(NSURL *)url {
	self = [super initWithBaseURL:url];
	if (self){
		[[self operationQueue] setMaxConcurrentOperationCount:1];
		self.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
		__weak CRMHTTPClient *weakSelf = self;
		self.clientCertificateBlock = ^(NSURLConnection* connection, NSURLAuthenticationChallenge *challenge){
			if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodClientCertificate]) {
#if DEBUG
				NSLog(@"%@ %@ AuthenticationChallenge Client Certificate", NSStringFromClass([weakSelf class]), NSStringFromSelector(_cmd));
#endif
				
				if ([Service getActive].crm_client_certificate_data == nil) {
					//If the data contained in the database is nil, perform default handling (it will fail) and return from block
					[challenge.sender performDefaultHandlingForAuthenticationChallenge:challenge];
					return ;
				}
				if (challenge.previousFailureCount > 1) {
					[challenge.sender cancelAuthenticationChallenge:challenge];
				}
				
				SecIdentityRef myIdentity = [GWCertificatesHelper gw_identityFromPersistentRef:[Service getActive].crm_client_certificate_data];
				
				//New initialization
				SecCertificateRef myCertificate;
				
				SecIdentityCopyCertificate(myIdentity, &myCertificate);
				const void *certs[] = { myCertificate };
				CFArrayRef certsArray = CFArrayCreate(NULL, certs, 1, NULL);
				NSURLCredential *credential = [NSURLCredential credentialWithIdentity:myIdentity certificates:(__bridge NSArray*)certsArray persistence:NSURLCredentialPersistenceNone];
				//
				[[challenge sender] useCredential:credential forAuthenticationChallenge:challenge];
				
			}
			else if([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodHTTPBasic] ||
					([challenge.protectionSpace.protocol isEqualToString:@"http"] && [challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodDefault])){
				if (challenge.previousFailureCount > 1){
					[challenge.sender cancelAuthenticationChallenge:challenge];
				}
				else{
					NSURLCredential *newCredential = [NSURLCredential credentialWithUser:[CredentialsHelper getBasicHTTPAuthUsernameForService:weakSelf.baseURL.absoluteString]
																				password:[CredentialsHelper getBasicHTTPAuthPasswordForService:weakSelf.baseURL.absoluteString]
																			 persistence:NSURLCredentialPersistenceNone];
					
					[[challenge sender] useCredential:newCredential forAuthenticationChallenge:challenge];
				}
			}
			else if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
				[challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust] forAuthenticationChallenge:challenge];
			}
			else{
				[challenge.sender performDefaultHandlingForAuthenticationChallenge:challenge];
			}
		};
	}
	return self;
}

#pragma mark - Session

- (void)updateSession:(NSString *)session
{
	[CredentialsHelper saveSession:session];
	NSTimeInterval interval = kRefreshIntervalMinutes*60.0; //Minutes * seconds
	[_sessionTimer invalidate];
	_sessionTimer = nil;
	_sessionTimer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(loginWithTimer:) userInfo:nil repeats:NO];
#if DEBUG
	NSLog(@"Setting timer at %@", [NSDate dateWithTimeIntervalSinceNow:interval]);
#endif
}

- (void)loginWithTimer:(NSTimer*)timer
{
	[self loginAndExecuteSelector:nil withObject:nil withObject:nil];
}

#pragma mark - Network methods

/*
 This method will execute a AFJSONRequestOperation to login to remote system before performing the other operation that was called.
 @param selector The selector to call after it's finished
 @param selectorObject1 first parameter for the selector being called
 @param selectorObject2 second parameter for the selector being called
 
 */
- (void)loginAndExecuteSelector:(SEL)selector withObject:(NSDictionary*)selectorObject1 withObject:(id<NSObject>)selectorObject2
{
#if DEBUG
	NSLog(@"%@ %@ obj1: %@ obj2: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), selectorObject1, selectorObject2);
#endif
	NSString *username = [Service getActiveServiceUsername];
	NSString *password = [CredentialsHelper getPassword];
	__block NSString *session;
	
	//Check if a Login operation is already in the queue!
	for (NSOperation *operation in self.operationQueue.operations) {
		if ([operation isKindOfClass:[CRMLoginRequestOperation class]]) {
			//there's already a login operation!
			//TODO: we should somehow stop the queue
		}
	}
	
	NSString *urlString = [[self.baseURL absoluteString] stringByAppendingString:@"api.php"];
	NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:@"POST" URLString:urlString parameters:[NSDictionary dictionaryWithObjectsAndKeys:@"login",@"_operation", username, @"username", password, @"password", nil] error:nil];
	[request setCachePolicy:NSURLRequestReloadIgnoringCacheData];
	
	CRMLoginRequestOperation *operation = (CRMLoginRequestOperation*)[self HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id responseObject) {
		NSDictionary *loginError = [responseObject objectForKey:@"error"];
		if(loginError)
		{
			DDLogDebug(@"%@ %@ Login error: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), loginError);
			//means that there was an error
			NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
			[numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
			NSNumber *errorNumber;
			if ([[loginError objectForKey:@"code"] isKindOfClass:[NSString class]]) {
				errorNumber = [numberFormatter numberFromString:[loginError objectForKey:@"code"]];
			}
			else{
				errorNumber = [loginError objectForKey:@"code"];
			}
			NSString *errorMessage = [loginError objectForKey:@"message"];
			NSDictionary *errorInfo = [NSDictionary dictionaryWithObjectsAndKeys:errorNumber, @"code", errorMessage, @"message", nil];
			[[NSNotificationCenter defaultCenter] postNotificationName:kClientHasFinishedLogin object:self userInfo:[NSDictionary dictionaryWithObjectsAndKeys:errorInfo, @"error", nil]];
		}
		else{
			
			session = [[[responseObject valueForKeyPath:@"result"] valueForKeyPath:@"login"] valueForKeyPath:@"session"] ;
			//Writes the new session
			[self updateSession:session];
			
			NSDictionary *result;
			if([NSJSONSerialization isValidJSONObject:responseObject]){
				result = responseObject;
			}
			
			if(selector != nil){
				//Update the session in the parameters
				NSMutableDictionary *updatedParams = [selectorObject1 mutableCopy];
				[updatedParams setObject:session forKey:@"_session"];
				
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
				[self performSelector:selector withObject:updatedParams withObject:selectorObject2];
#pragma clang diagnostic pop
			}
			
			[[NSNotificationCenter defaultCenter] postNotificationName:kClientHasFinishedLogin object:self userInfo:[NSDictionary dictionaryWithObjectsAndKeys:result, kClientNotificationResponseBodyKey, nil]];
		}
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		DDLogDebug(@"%@ %@ Request failed: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [error description]);
		[[NSNotificationCenter defaultCenter] postNotificationName:kClientHasFinishedLogin object:self userInfo:[NSDictionary dictionaryWithObjectsAndKeys:[error description], kClientNotificationErrorKey, nil]];
	}];
	operation.responseSerializer = [AFJSONResponseSerializer serializer];
#if TARGET_IPHONE_SIMULATOR
	operation.securityPolicy.allowInvalidCertificates = YES;    //Only when debugging locally
#endif
	[operation setWillSendRequestForAuthenticationChallengeBlock:_clientCertificateBlock];
	[self.operationQueue addOperation:operation];
}

#pragma mark - Most generic method to call

/*
 This method will execute a AFJSONRequestOperation with the parameters specified. Will post a NSNotification at the end with the name specified by notificationName
 @param parameters The parameters specified as a NSDictionary
 @param notificationName The name of the notification to post at the end
 
 */
- (void)executeOperationWithParameters:(NSDictionary*)parameters notificationName:(NSString*)notificationName
{
#if DEBUG
	NSLog(@"%@ %@ Parameters: %@ NotificationName %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), parameters, notificationName);
#endif
	if ([parameters objectForKey:@"_session"] == nil) {
		[self loginAndExecuteSelector:_cmd withObject:parameters withObject:notificationName];
		return;
	}
	
	NSString *urlString = [[self.baseURL absoluteString] stringByAppendingString:@"api.php"];
	NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:@"POST" URLString:urlString parameters:parameters error:nil];
	[request setCachePolicy:NSURLRequestReloadIgnoringCacheData];
	AFHTTPRequestOperation *operation = [self HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id JSON) {
		@try {
			NSDictionary *operationError = [JSON objectForKey:@"error"];
			if(operationError)
			{
				DDLogWarn(@"%@ Error: %@", [[self class] description], operationError);
				//means that there was an error
				NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
				[numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
				NSString *errorCode;
				if ([[operationError objectForKey:@"code"] isKindOfClass:[NSString class]]) {
					errorCode = [operationError objectForKey:@"code"]; //[numberFormatter numberFromString:[operationError objectForKey:@"code"]];
				}
				else{
					errorCode = [numberFormatter stringFromNumber:[operationError objectForKey:@"code"]];
				}
				NSString *errorMessage = [operationError objectForKey:@"message"];
				NSDictionary *errorInfo = [NSDictionary dictionaryWithObjectsAndKeys:errorCode, @"code", errorMessage, @"message", nil];
				if ([errorCode isEqualToString:[numberFormatter stringFromNumber:@(kErrorCodeLoginRequired)]] && [errorMessage isEqualToString:@"Login required"]) {
					//means that the error is "Login Required" (which means the session variable was null or outdated. We would try to re-execute the same operation
					[self loginAndExecuteSelector:_cmd withObject:parameters withObject:notificationName];
				}
				else{
					[[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:self userInfo:[NSDictionary dictionaryWithObjectsAndKeys:errorInfo, kClientNotificationErrorKey, nil]];
				}
			}
			else{
				NSDictionary *result;
				if([NSJSONSerialization isValidJSONObject:JSON]){
					result = JSON;
				}
				[[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:self userInfo:[NSDictionary dictionaryWithObjectsAndKeys:result, kClientNotificationResponseBodyKey, parameters, kClientNotificationParametersKey, nil]];
			}
		}
		@catch (NSException *exception) {
			[[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:self userInfo:[NSDictionary dictionaryWithObjectsAndKeys:[exception description], kClientNotificationErrorKey, nil]];
		}
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		DDLogDebug(@"%@ %@ Request failed: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [error description]);
		[[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:self userInfo:[NSDictionary dictionaryWithObjectsAndKeys:[error description], kClientNotificationErrorKey, nil]];
		
	}];
	operation.responseSerializer = [AFJSONResponseSerializer serializer];
#if TARGET_IPHONE_SIMULATOR
	operation.securityPolicy.allowInvalidCertificates = YES;    //Only when debugging locally
#endif
	[operation setWillSendRequestForAuthenticationChallengeBlock:_clientCertificateBlock];
	[self.operationQueue addOperation:operation];
}

/*
 This method will execute a AFJSONRequestOperation with the parameters specified. Will post a NSNotification at the end with the name specified by notificationName. It won't access the Credentials Store.
 @param parameters The parameters specified as a NSDictionary
 @param notificationName The name of the notification to post at the end
 
 */
- (void)executeOperationWithoutLoginWithParameters:(NSDictionary*)parameters notificationName:(NSString*)notificationName
{
#if DEBUG
	NSLog(@"%@ %@ Parameters: %@ NotificationName %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), parameters, notificationName);
#endif
	
	NSString *urlString = [[self.baseURL absoluteString] stringByAppendingString:@"api.php"];
	NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:@"POST" URLString:urlString parameters:parameters error:nil];
	[request setCachePolicy:NSURLRequestReloadIgnoringCacheData];
	AFHTTPRequestOperation *operation = [self HTTPRequestOperationWithRequest:request success:^(AFHTTPRequestOperation *operation, id JSON) {
		@try {
			NSDictionary *operationError = [JSON objectForKey:@"error"];
			if(operationError)
			{
				NSLog(@"%@ Error: %@", [[self class] description], operationError);
				//means that there was an error
				NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
				[numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
				NSNumber *errorNumber;
				if ([[operationError objectForKey:@"code"] isKindOfClass:[NSString class]]) {
					errorNumber = [numberFormatter numberFromString:[operationError objectForKey:@"code"]];
				}
				else{
					errorNumber = [operationError objectForKey:@"code"];
				}
				NSString *errorMessage = [operationError objectForKey:@"message"];
				NSDictionary *errorInfo = [NSDictionary dictionaryWithObjectsAndKeys:errorNumber, @"code", errorMessage, @"message", nil];
				if ([errorNumber isEqualToNumber:[NSNumber numberWithInt:kErrorCodeLoginRequired]]) {
					//means that the error is "Login Required" (which means the session variable was null or outdated. We would try to re-execute the same operation
					[self loginAndExecuteSelector:_cmd withObject:parameters withObject:notificationName];
				}
				else{
					[[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:self userInfo:[NSDictionary dictionaryWithObjectsAndKeys:errorInfo, kClientNotificationErrorKey, nil]];
				}
			}
			else{
				NSDictionary *result;
				if([NSJSONSerialization isValidJSONObject:JSON]){
					result = JSON;
				}
				[[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:self userInfo:[NSDictionary dictionaryWithObjectsAndKeys:result, kClientNotificationResponseBodyKey, parameters, kClientNotificationParametersKey, nil]];
			}
		}
		@catch (NSException *exception) {
			[[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:self userInfo:[NSDictionary dictionaryWithObjectsAndKeys:[exception description], kClientNotificationErrorKey, nil]];
		}
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		DDLogError(@"%@ %@ Request failed: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [error description]);
		[[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:self userInfo:[NSDictionary dictionaryWithObjectsAndKeys:[error description], kClientNotificationErrorKey, nil]];
		
	}];
	operation.responseSerializer = [AFJSONResponseSerializer serializer];
#if TARGET_IPHONE_SIMULATOR
	operation.securityPolicy.allowInvalidCertificates = YES;    //Only when debugging locally
#endif
	[operation setWillSendRequestForAuthenticationChallengeBlock:_clientCertificateBlock];
	[self.operationQueue addOperation:operation];
}

@end
