//
//  CRMQueryHelper.m
//  ContactiCalVtiger
//
//  Created by Giovanni on 04/02/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import "CRMQueryHelper.h"
#import "CRMFieldConstants.h"
#import "ModulesHelper.h"

@implementation CRMQueryHelper

+ (id)getRecord:(NSString*)recordId
{
    NSString *module = [ModulesHelper decodeModuleForRecordId:recordId];
    if ([module isEqualToString:kVTModuleCalendar]) {
        return [Activity MR_findFirstByAttribute:@"crm_id" withValue:recordId];
    }
    if ([module isEqualToString:kVTModuleAccounts]) {
        return [Account MR_findFirstByAttribute:@"crm_id" withValue:recordId];
    }
    if ([module isEqualToString:kVTModuleContacts]) {
        return [Contact MR_findFirstByAttribute:@"crm_id" withValue:recordId];
    }
    if ([module isEqualToString:kVTModuleLeads]) {
        return [Lead MR_findFirstByAttribute:@"lead_leadid" withValue:recordId];
    }
    if ([module isEqualToString:kVTModulePotentials]) {
        return [Potential MR_findFirstByAttribute:@"crm_id" withValue:recordId];
    }
    if ([module isEqualToString:kVTModuleHelpDesk]) {
        return [Ticket MR_findFirstByAttribute:@"crm_id" withValue:recordId];
    }
    if ([module isEqualToString:kVTModuleProducts]) {
        return [Product MR_findFirstByAttribute:@"crm_id" withValue:recordId];
    }
    
    return nil;
}

@end
