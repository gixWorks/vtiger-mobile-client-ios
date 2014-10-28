//
//  UsersHelper.h
//  ContactiCalVtiger
//
//  Created by Giovanni on 16/04/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UsersHelper : NSObject

/**
 *  Returns the full user ID (19x1) for the user Id 1
 *
 *  @param userId the user ID without module
 *
 *  @return Full User ID <module_id>x<user_id>
 */
+ (NSString*)fullUserIdForUserId:(NSString*)userId;

/**
 *  Returns the label of the name of the user if available. Otherwise the login name
 *
 *  @param userId User id in the form 19x1
 *
 *  @return The display label for the user
 */
+ (NSString*)gw_userNameForUserId:(NSString*)userId;

/**
 *  Returns the full User id (<module_id>x<user_id>) for the current user ID
 *
 *  @return Full User ID <module_id>x<user_id>
 */
+ (NSString *)fullUserIdForCurrentUser;

@end
