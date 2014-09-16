//
//  ServiceHelper.h
//  ContactiCal
//
//  Created by Giovanni on 1/31/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceHelper : NSObject

/*
 Creates a new Service with the specified parameters
 
 @param url The URL
 @param username The Username
 @param password The user Password
 @param serverTimeZone the time zone of server
 @param userTimeZone time zone specified by user
 @param onDemand indicates if it's a "Cloud installation" (if YES) or a "on premise installation" (if NO)
 */
+ (void)createNewServiceWithServerURL:(NSURL*)url Username:(NSString*)username userid:(NSString*)userid password:(NSString*)password serverTimeZone:(NSString*)serverTimeZone userTimeZone:(NSString*)userTimeZone onDemand:(BOOL)onDemand;

/**
 *  Creates a new Service with the specified parameters
 *
 *  @param url            the URL
 *  @param username       the username
 *  @param userid         the user id
 *  @param password       the user password
 *  @param serverTimeZone the time zone for the server
 *  @param userTimeZone   the time zone for the user
 *  @param onDemand       indicates if it's onDemand (cloud) or on premise
 *  @param certificateRef NSData containing the reference to client certificate in keychain
 */
+ (void)createNewServiceWithServerURL:(NSURL*)url Username:(NSString*)username userid:(NSString*)userid password:(NSString*)password serverTimeZone:(NSString*)serverTimeZone userTimeZone:(NSString*)userTimeZone onDemand:(BOOL)onDemand certificateRef:(NSData*)certificateRef;

/*
 Creates a new Service with the specified parameters without saving to persistent store
 
 @param url The URL
 @param username The Username
 @param onDemand indicates if it's a "Cloud installation" (if YES) or a "on premise installation" (if NO)
 */
+ (void)createNewServiceWithoutSavingWithServerURL:(NSURL *)url username:(NSString*)username onDemand:(BOOL)onDemand;

/**
 *  Returns the current user Time Zone as specified in the active service
 *
 *  @return the current user Time Zone
 */
+ (NSTimeZone*)currentUserTimeZone;

@end
