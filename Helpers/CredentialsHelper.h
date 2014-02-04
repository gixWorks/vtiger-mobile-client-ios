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
+ (void)deleteAllCredentials;

+ (void)savePassword:(NSString*)password;
+ (void)saveSession:(NSString*)session;

@end
