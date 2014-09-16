//
//  UsersHelper.m
//  ContactiCalVtiger
//
//  Created by Giovanni on 16/04/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import "UsersHelper.h"
#import "CRMConstants.h"
#import "CRMFieldConstants.h"
#import "ModulesHelper.h"

@implementation UsersHelper

+ (NSString *)fullUserIdForUserId:(NSString *)userId
{
    NSString *moduleId = [ModulesHelper moduleIdForModuleName:kVTModuleUsers];
    if (moduleId == nil) {
        moduleId = @"19"; //Ugly hack. Thanks to vTiger that does not allow access to Users module when the user is not an Administrator
    }
    return [NSString stringWithFormat:@"%@x%@", moduleId, userId];
}

+ (NSString *)gw_userNameForUserId:(NSString *)userId
{
    Service *s = [Service getActive];
    NSString *label = [[User MR_findFirstByAttribute:@"crm_id" withValue:s.crm_userid] crm_label];
    if (label == nil) {
        label = s.crm_username;
    }
    return label;
}

@end
