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
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSData *certificateData;

- (id)initWithDelegate:(id<URLCheckerClientDelegate>)delegate url:(NSURL*)urlToTest;
- (void)startTestingReachability;

@end
