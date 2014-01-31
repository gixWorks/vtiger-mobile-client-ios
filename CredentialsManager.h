//
//  CredentialsManager.h
//  CalendarAppThatSyncs
//
//  Created by Giovanni on 11/18/13.
//
//

#import <Foundation/Foundation.h>
#import "SSKeychain.h"

@interface CredentialsManager : NSObject

+ (NSString*)getDeviceID;

+ (NSString*)getPassword;
+ (NSString*)getSession;

+ (void)savePassword:(NSString*)password;
+ (void)saveSession:(NSString*)session;

@end
