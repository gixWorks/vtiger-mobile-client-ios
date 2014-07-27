//
//  URLCheckerClient.h
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 1/16/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URLCheckerClientDelegate.h"

@interface URLCheckerClient : NSObject <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

@property (nonatomic, weak) id<URLCheckerClientDelegate> URLCheckerClientDelegate;

/**
 *  Instantiates the client
 *
 *  @param delegate  the delegate of the URL Checker Client
 *  @param urlToTest CRM url to test
 *  @param data      data containing certificate keychain reference
 *
 *  @return the URLCheckerClient
 */
- (id)initWithDelegate:(id<URLCheckerClientDelegate>)delegate url:(NSURL *)urlToTest certificateData:(NSData*)data;

/**
 *  Instantiates the NSURLRequest and starts the NSURLConnection
 */
- (void)startTestingReachability;

@end
