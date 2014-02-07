//
//  Service+Extra.m
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 1/9/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import "Service+Extra.h"

@implementation Service (Extra)

- (void)setActive
{
    for (Service* service in [Service MR_findAll]) {
        service.crm_active = [NSNumber numberWithBool:NO];
    }
    self.crm_active = [NSNumber numberWithBool:YES];
}

+ (Service*)getActive
{
    return [Service MR_findFirstByAttribute:@"crm_active" withValue:[NSNumber numberWithBool:YES]];
}

+ (NSString*)getActiveServiceUsername
{
    return [[Service getActive] crm_username];
}

+ (NSString*)getActiveServiceUrl
{
    return [[Service getActive] crm_url];
}

+ (Service*)createAndSetActiveWithUsername:(NSString*)username userid:(NSString*)userid url:(NSString*)url crmOnDemand:(BOOL)onDemand
{
    Service *service = [Service MR_createEntity];
    service.crm_url = url;
    service.crm_userid = userid;
    service.crm_username = username;
    service.crm_crmondemand = [NSNumber numberWithBool:onDemand];
    [service setActive];
    return service;
    
}


@end
