//
//  ModulesHelper.m
//  ContactiCalVtiger
//
//  Created by Giovanni on 04/02/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import "ModulesHelper.h"
#import "CRMConstants.h"
#import "CRMFieldConstants.h"
#import "CoreData+MagicalRecord.h"
#import "Module.h"
#import "Activity.h"
#import "Service.h"

@implementation ModulesHelper

+ (NSString*)decodeModuleForRecordId:(NSString*)record
{
    NSString *m = [[record componentsSeparatedByString:@"x"] objectAtIndex:0];
    Module *module = [Module MR_findFirstByAttribute:@"crm_id" withValue:m];
    if (module != nil) {
        return module.crm_name;
    }
    else if([m isEqualToString:@"18"]){ //18 is still Calendar module but Vtiger does not list it when fetching modules
        return  kVTModuleCalendar;
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
    else{
        if ([m isEqualToString:@"18"]) {  //Ugly because ID of some modules are not synced through vTiger
            Activity *a = [Activity MR_findFirstByAttribute:@"crm_id" withValue:record];
            return NSLocalizedString(([NSString stringWithFormat:@"%@",a.crm_activitytype]), @"This contains the crm_activitytype field"); //Task, Call or Meeting
        }
    }
    return nil;
}

//+ (NSArray*)enabledModules
//{
//    //In the BETA we support only these modules
//    return @[kVTModuleAccounts, kVTModuleContacts, kVTModuleLeads];
//}

+ (NSString*)localizedLabelForModuleName:(NSString*)moduleName
{
    NSPredicate *p = [NSPredicate predicateWithFormat:@"service = %@ AND crm_name = %@", [Service getActive], moduleName];
    Module *module = [Module MR_findFirstWithPredicate:p];
    if(module != nil){
        return module.crm_label;
    }
    else{
        return moduleName;
    }
}

+ (NSString*)moduleIdForModuleName:(NSString*)moduleName
{
    NSPredicate *p = [NSPredicate predicateWithFormat:@"service = %@ AND crm_name = %@", [Service getActive], moduleName];
    Module *module = [Module MR_findFirstWithPredicate:p];
    return module.crm_id;
}

+ (NSString *)moduleIdForCalendarRecordType:(NSString *)calendarRecordType
{
    if ([calendarRecordType isEqualToString:kCRMActivityTypeCall] || [calendarRecordType isEqualToString:kCRMActivityTypeMeeting]) {
        return @"18";
    }
    else if ([calendarRecordType isEqualToString:kCRMActivityTypeTask]){
        return @"1";
    }
    return nil;
}

@end
