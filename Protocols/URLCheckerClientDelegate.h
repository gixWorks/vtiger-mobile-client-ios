//
//  URLCheckerClientDelegate.h
//  ContactiCalVtiger
//
//  Created by Giovanni on 04/02/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol URLCheckerClientDelegate <NSObject>

- (void)urlCheckerDidFinishWithError:(NSString*)error url:(NSURL*)testedUrl invalid_certificate:(BOOL)invalid_certificate;

@end
