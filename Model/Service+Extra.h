//
//  Service+Extra.h
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 1/9/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import "Service.h"

@interface Service (Extra)

- (void)setActive;
+ (Service*)getActive;
+ (NSString*)getActiveServiceUsername;
+ (NSString*)getActiveServiceUrl;
+ (Service*)createAndSetActiveWithUsername:(NSString*)username url:(NSString*)url crmOnDemand:(BOOL)onDemand;

@end
