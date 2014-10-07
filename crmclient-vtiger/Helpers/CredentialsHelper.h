//
//  CredentialsHelper.h
//  CalendarAppThatSyncs
//
//  Created by Giovanni on 11/18/13.
//
//

#import <Foundation/Foundation.h>
#import "SSKeychain.h"

@interface CredentialsHelper : NSObject

+ (NSString*)getDeviceID;

+ (NSString*)getPassword;
+ (NSString*)getSession;
+ (void)clearCredentials;
+ (void)clearSession;

+ (void)savePassword:(NSString*)password;
+ (void)saveSession:(NSString*)session;

+(NSString*)getBasicHTTPAuthUsernameForService:(NSString*)url;
+(NSString*)getBasicHTTPAuthPasswordForService:(NSString*)url;
+ (void)setBasicHTTPAuthUsername:(NSString*)username forService:(NSString*)url;
+ (void)setBasicHTTPAuthPassword:(NSString*)password forService:(NSString*)url;

@end
