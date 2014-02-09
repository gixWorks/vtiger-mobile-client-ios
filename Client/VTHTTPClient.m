//
//  VTHTTPClient.m
//  FunctionalitiesApp
//
//  Created by Giovanni on 11/18/13.
//  Copyright (c) 2013 gixWorks. All rights reserved.
//

#import "VTHTTPClient.h"
#import "CredentialsHelper.h"

//Notification constants
NSString* const kClientHasFinishedLogin = @"kClientHasFinishedLogin";
NSString* const kClientHasFinishedLoginAndFetchModules = @"kClientHasFinishedLoginAndFetchModules";
NSString* const kClientHasFinishedSyncCalendar = @"kClientHasFinishedSyncCalendar";
NSString* const kClientHasFinishedDescribe = @"kClientHasFinishedDescribe";
NSString* const kClientHasFinishedFetchRecord = @"kClientHasFinishedFetchRecord";
NSString* const kClientHasFinishedFetchRecordWithGrouping = @"kClientHasFinishedFetchRecordWithGrouping";
NSString* const kClientHasFinishedFetchRecordsWithGrouping =  @"kClientHasFinishedFetchRecordsWithGrouping";

//Notification keys constants
NSString* const kClientNotificationResponseBodyKey = @"responseBody";
NSString* const kClientNotificationErrorKey = @"error";
NSString* const kClientNotificationParametersKey = @"parameters";

NSInteger const kErrorCodeAuthenticationFailed = 1210;
NSInteger const kErrorCodeLoginRequired = 1501;

static NSInteger kRefreshIntervalMinutes = 30;

@implementation VTHTTPClient

+(VTHTTPClient *)sharedInstance {
    static dispatch_once_t pred;
    static VTHTTPClient *shared = nil;
    dispatch_once(&pred, ^{
        shared = [[VTHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:[Service getActiveServiceUrl]]];
    });
    return shared;
}

//- (id)initWithBaseURL:(NSURL *)url
//{
//    self = [super initWithBaseURL:url];
//    self.parameterEncoding = AFFormURLParameterEncoding;
//    return self;
//}

#pragma mark - Session

- (void)updateSession:(NSString *)session
{
    [CredentialsHelper saveSession:session];
    NSTimeInterval interval = kRefreshIntervalMinutes*60.0; //Minutes * seconds
    [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(loginAndExecuteSelector:withObject:withObject:) userInfo:nil repeats:NO];
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
    
    NSMutableURLRequest *request =  [self requestWithMethod:@"POST" path:@"" parameters:[NSDictionary dictionaryWithObjectsAndKeys:@"login",@"_operation", username, @"username", password, @"password", nil]];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        
        NSDictionary *loginError = [JSON objectForKey:@"error"];
        if(loginError)
        {
            NSLog(@"%@ %@ Login error: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), loginError);
            //means that there was an error
            NSString *errorCode = [loginError objectForKey:@"code"];
            NSString *errorMessage = [loginError objectForKey:@"message"];
            NSDictionary *errorInfo = [NSDictionary dictionaryWithObjectsAndKeys:errorCode, @"code", errorMessage, @"message", nil];
            [[NSNotificationCenter defaultCenter] postNotificationName:kClientHasFinishedLogin object:self userInfo:[NSDictionary dictionaryWithObjectsAndKeys:errorInfo, @"error", nil]];
        }
        else{
            
            session = [[[JSON valueForKeyPath:@"result"] valueForKeyPath:@"login"] valueForKeyPath:@"session"] ;
            //Writes the new session
            [self updateSession:session];
            
            NSDictionary *result;
            if([NSJSONSerialization isValidJSONObject:JSON]){
                result = JSON;
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
        
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"%@ %@ Request failed: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [error description]);
        [[NSNotificationCenter defaultCenter] postNotificationName:kClientHasFinishedLogin object:self userInfo:[NSDictionary dictionaryWithObjectsAndKeys:[error description], kClientNotificationErrorKey, nil]];
    }];
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
    if ([CredentialsHelper getSession] == nil) {
        [self loginAndExecuteSelector:_cmd withObject:parameters withObject:notificationName];
        return;
    }
    
    NSMutableURLRequest *request = [self requestWithMethod:@"POST" path:@"" parameters:parameters];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
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
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"%@ %@ Request failed: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [error description]);
        [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:self userInfo:[NSDictionary dictionaryWithObjectsAndKeys:[error description], kClientNotificationErrorKey, nil]];
    }];
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
    NSMutableURLRequest *request = [self requestWithMethod:@"POST" path:@"" parameters:parameters];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
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
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"%@ %@ Request failed: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [error description]);
        [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:self userInfo:[NSDictionary dictionaryWithObjectsAndKeys:[error description], kClientNotificationErrorKey, nil]];
    }];
    [self.operationQueue addOperation:operation];
}

@end
