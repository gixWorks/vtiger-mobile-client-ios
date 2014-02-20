//
//  URLCheckerClient.m
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 1/16/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import "URLCheckerClient.h"

static BOOL user_wants_to_trust_invalid_certificates = YES;

@implementation URLCheckerClient

- (void)startTestingReachability
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.url cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:5];
    [request setHTTPMethod: @"HEAD"];
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    [connection start];
}

- (id)init
{
    [self doesNotRecognizeSelector:_cmd];
    //Init method should not be called
    return self;
}

- (id)initWithDelegate:(id<URLCheckerClientDelegate>)delegate url:(NSURL *)urlToTest
{
    self = [super init];
    if (self) {
        self.URLCheckerClientDelegate = delegate;
        self.url = urlToTest;
    }
    return self;
}

#pragma mark - NSURLconnection delegate

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse *)cachedResponse {
    return nil;
}

- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace {
    return [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust];
}

- (void)connection:(NSURLConnection *)connection willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
        
        // Verify certificate:
        SecTrustResultType trustResult;
        OSStatus status = SecTrustEvaluate(challenge.protectionSpace.serverTrust, &trustResult);
        BOOL trusted = (status == errSecSuccess) && ((trustResult == kSecTrustResultProceed) || (trustResult == kSecTrustResultUnspecified));
        
        if (trusted) {
            [challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust]
                 forAuthenticationChallenge:challenge];
        } else {
            if (user_wants_to_trust_invalid_certificates) {
                [challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust]
                     forAuthenticationChallenge:challenge];
            } else {
                [challenge.sender cancelAuthenticationChallenge:challenge];
            }
        }
    } else {
        [challenge.sender performDefaultHandlingForAuthenticationChallenge:challenge];
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    connection = nil;
    NSLog(@"%@ %@ connection failed with error: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [error description]);
    [self.URLCheckerClientDelegate urlCheckerDidFinishWithError:[error localizedDescription] url:self.url];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
    
    if (httpResponse.statusCode != 200) {
        //Something is wrong with the url provided by the server
        NSLog(@"%@ %@ The server is not available (Response code %d)", NSStringFromClass([self class]), NSStringFromSelector(_cmd), httpResponse.statusCode);
        NSString *err = [NSString stringWithFormat:@"The server is not available (Response code %d)", httpResponse.statusCode];
        [self.URLCheckerClientDelegate urlCheckerDidFinishWithError:err url:_url];
    }
    else
    {
        [self.URLCheckerClientDelegate urlCheckerDidFinishWithError:nil url:_url];
    }
}


@end
