//
//  CRMConstants.m
//  ContactiCalVtiger
//
//  Created by Giovanni on 12/04/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import "CRMConstants.h"
#import "CRMFieldConstants.h"

//Error Key
NSString* const kErrorKey = @"error";

//Other
NSString* const kMinimumRequiredVersion = @"5.2.0";

//These are to replace all string usages
NSString* const kCRMActivityTypeTask = @"Task";
NSString* const kCRMActivityTypeCall = @"Call";
NSString* const kCRMActivityTypeMeeting = @"Meeting";

NSString* const kCRMActivityTaskStatusNotStarted = @"Not Started";
NSString* const kCRMActivityTaskStatusInProgress = @"In Progress";
NSString* const kCRMActivityTaskStatusCompleted = @"Completed";
NSString* const kCRMActivityTaskStatusPendingInput = @"Pending Input";
NSString* const kCRMActivityTaskStatusDeferred = @"Deferred";
NSString* const kCRMActivityTaskStatusPlanned = @"Planned";

NSString *const kCRMActivityVisibilityPublic = @"Public";
NSString *const kCRMActivityVisibilityPrivate = @"Private";

NSString* const kCRMActivityCallMeetingStatusPlanned = @"Planned";
NSString* const kCRMActivityCallMeetingStatusHeld = @"Held";
NSString* const kCRMActivityCallMeetingStatusNotHeld = @"Not Held";

NSString* const kModifiedRecordActionDELETE = @"DELETE";
NSString* const kModifiedRecordActionUPDATE = @"UPDATE";

NSString *const kCalendarPrivate = @"PRIVATE";
NSString *const kCalendarPublic = @"PUBLIC";

@implementation CRMConstants

+ (NSArray*)allModules
{
    return @[kVTModuleCalendar, kVTModuleAccounts, kVTModuleContacts, kVTModuleLeads, kVTModuleHelpDesk, kVTModuleGroups, kVTModuleProducts, kVTModulePotentials, kVTModuleDocuments, kVTModuleCampaigns];
}

@end
