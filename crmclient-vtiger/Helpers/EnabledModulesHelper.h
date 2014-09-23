//
//  EnabledModulesHelper.h
//  ContactiCalVtiger
//
//  Created by Giovanni on 10/05/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EnabledModulesHelper : NSObject

/**
 *  Initializes the Enabled Modules table in the Core Data database
 */
+ (void)initializeEnabledModulesTable;

+ (BOOL)isModuleEnabled:(NSString*)moduleName;

@end
