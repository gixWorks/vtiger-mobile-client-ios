//
//  EnabledModulesHelper.m
//  ContactiCalVtiger
//
//  Created by Giovanni on 10/05/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import "EnabledModulesHelper.h"
#import "CRMConstants.h"
#import "CoreData+MagicalRecord.h"
#import "EnabledModules.h"
#import "Service.h"

@implementation EnabledModulesHelper

+ (void)initializeEnabledModulesTable
{
    NSPredicate *p = [NSPredicate predicateWithFormat:@"service = %@", [Service getActive]];
    //If the table is already populated, skip
    if ([[EnabledModules MR_findAllWithPredicate:p] count] > 0)
        return;
    
    //Otherwise fill with all modules as enabled
    NSArray *modules = [CRMConstants allModules];
    for (NSString* module in modules) {
        EnabledModules *em = [EnabledModules MR_createEntity];
        em.crm_name = module;
        em.enabled = @YES;
        em.service = [Service getActive];
    }
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

+ (BOOL)isModuleEnabled:(NSString*)moduleName
{
	NSPredicate *p = [NSPredicate predicateWithFormat:@"service = %@ && crm_name = %@", [Service getActive], moduleName];
	EnabledModules *module = [EnabledModules MR_findFirstWithPredicate:p];
	if (module == nil) {
		return NO;
	}
	return [module.enabled boolValue];
}

@end
