//
//  ModulesHelper.m
//  ContactiCalVtiger
//
//  Created by Giovanni on 04/02/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import "ModulesHelper.h"

//Module names constants
NSString* const kVTModuleCalendar = @"Calendar";
NSString* const kVTModuleAccounts = @"Accounts";
NSString* const kVTModuleContacts = @"Contacts";
NSString* const kVTModuleLeads = @"Leads";
NSString* const kVTModulePotentials = @"Potentials";
NSString* const kVTModuleHelpDesk = @"HelpDesk";
NSString* const kVTModuleProducts = @"Products";

@implementation ModulesHelper

+ (NSString*)decodeModuleForRecordId:(NSString*)record
{
    NSString *m = [[record componentsSeparatedByString:@"x"] objectAtIndex:0];
    Module *module = [Module MR_findFirstByAttribute:@"crm_id" withValue:m];
    if (module != nil) {
        return module.crm_name;
    }
    return nil;
}

+ (NSString*)localizedModuleNameForRecord:(NSString*)record
{
    NSString *m = [[record componentsSeparatedByString:@"x"] objectAtIndex:0];
    Module *module = [Module MR_findFirstByAttribute:@"crm_id" withValue:m];
    if (module != nil) {
        return module.crm_label;
    }
    return nil;
}

+ (NSString*)localizedSingularModuleNameForRecord:(NSString*)record
{
    NSString *m = [[record componentsSeparatedByString:@"x"] objectAtIndex:0];
    Module *module = [Module MR_findFirstByAttribute:@"crm_id" withValue:m];
    if (module != nil) {
        return module.crm_singular;
    }
    return nil;
}


@end
