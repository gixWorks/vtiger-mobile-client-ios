//
//  ServiceHelper.h
//  ContactiCal
//
//  Created by Giovanni on 1/31/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceHelper : NSObject

/**
 Creates a new Service with the specified parameters
 */
+ (void)createNewServiceWithServerURL:(NSURL*)url Username:(NSString*)username userid:(NSString*)userid password:(NSString*)password serverTimeZone:(NSString*)serverTimeZone userTimeZone:(NSString*)userTimeZone onDemand:(BOOL)onDemand;

/**
 Creates a new Service without saving it. Used during the setup process
 */
+ (void)createNewServiceWithoutSavingWithServerURL:(NSURL *)url username:(NSString*)username onDemand:(BOOL)onDemand;

@end
