//
//  CRMPicklistHelper.m
//  ContactiCalVtiger
//
//  Created by Giovanni on 12/04/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import "CRMPicklistHelper.h"
#import "CRMConstants.h"
#import "CRMFieldConstants.h"
#import "GWActivitySelectItem.h"
#import "CRMFieldPicklistValue.h"
#import "Module.h"
#import "CoreData+MagicalRecord.h"
#import "CRMField.h"
#import "Service.h"

@implementation CRMPicklistHelper

+ (NSArray*)picklistValuesForActivityStatus:(NSString*)activityType
{
    NSPredicate *p = [NSPredicate predicateWithFormat:@"service = %@ AND crm_name = %@", [Service getActive], kVTModuleCalendar];
    Module *crmmodule = [Module MR_findFirstWithPredicate:p];
    
    if ([activityType isEqualToString:kCRMActivityTypeTask]) {
        //We need to load the picklist values for the field "taskstatus"

        CRMField *field = [CRMField MR_findFirstWithPredicate:[NSPredicate predicateWithFormat:@"module = %@ AND crm_name = %@", crmmodule, kCalendarFieldtaskstatus]];
        if (field != nil) {
            NSMutableArray *values = [[NSMutableArray alloc] init];
            for (CRMFieldPicklistValue *picklistValue in field.picklist_values) {
                [values addObject:[GWActivitySelectItem itemWithLabel:picklistValue.crm_label value:picklistValue.crm_value]];
            }
            return values;
        }
    }
    else if([activityType isEqualToString:kCRMActivityTypeMeeting] || [activityType isEqualToString:kCRMActivityTypeCall]){
        //We need to load the picklist values for the "eventstatus" field
        CRMField *field = [CRMField MR_findFirstWithPredicate:[NSPredicate predicateWithFormat:@"module = %@ AND crm_name = %@", crmmodule, kCalendarFieldeventstatus]];
        if (field != nil) {
            NSMutableArray *values = [[NSMutableArray alloc] init];
            for (CRMFieldPicklistValue *picklistValue in field.picklist_values) {
                [values addObject:[GWActivitySelectItem itemWithLabel:picklistValue.crm_label value:picklistValue.crm_value]];
            }
            return values;
        }
    }
    
    
    //This is now just a "fallback" and we expect it should be called only in the unlucky event that CRMField is nil
    if ([activityType isEqualToString:kCRMActivityTypeTask]) {
        return @[[GWActivitySelectItem itemWithLabel:NSLocalizedString(kCRMActivityTaskStatusCompleted, @"Taks Status Completed") value:kCRMActivityTaskStatusCompleted],
                 [GWActivitySelectItem itemWithLabel:NSLocalizedString(kCRMActivityTaskStatusDeferred, @"Task Status Deferred") value:kCRMActivityTaskStatusDeferred],
                 [GWActivitySelectItem itemWithLabel:NSLocalizedString(kCRMActivityTaskStatusInProgress, @"Task Status In Progress") value:kCRMActivityTaskStatusInProgress],
                 [GWActivitySelectItem itemWithLabel:NSLocalizedString(kCRMActivityTaskStatusNotStarted, @"Task Status Not Started") value:kCRMActivityTaskStatusNotStarted],
                 [GWActivitySelectItem itemWithLabel:NSLocalizedString(kCRMActivityTaskStatusPendingInput, @"Task Status Pending Input") value:kCRMActivityTaskStatusPendingInput],
                 [GWActivitySelectItem itemWithLabel:NSLocalizedString(kCRMActivityTaskStatusPlanned, @"Task Status Planned") value:kCRMActivityTaskStatusPlanned]
                 ];
    }
    else if ([activityType isEqualToString:kCRMActivityTypeMeeting] || [activityType isEqualToString:kCRMActivityTypeCall]) {
        return
        @[[GWActivitySelectItem itemWithLabel:NSLocalizedString(([NSString stringWithFormat:@"%@",kCRMActivityCallMeetingStatusHeld]), @"Call Meeting Status Held")
                                        value:kCRMActivityCallMeetingStatusHeld],
          [GWActivitySelectItem itemWithLabel:NSLocalizedString(kCRMActivityCallMeetingStatusNotHeld, @"Call Meeting Status Not Held")
                                        value:kCRMActivityCallMeetingStatusNotHeld],
          [GWActivitySelectItem itemWithLabel:NSLocalizedString(kCRMActivityCallMeetingStatusPlanned, @"Call Meeting Status Planned")
                                        value:kCRMActivityCallMeetingStatusPlanned]
          ];
    }
    else return @[];
}

+ (NSArray *)picklistValuesForActivityVisibility
{
    return
    @[[GWActivitySelectItem itemWithLabel:NSLocalizedString(@"Private", @"Private Activity Type Label") value:@"Private"],
      [GWActivitySelectItem itemWithLabel:NSLocalizedString(@"Public", @"Public Activity Type Label") value:@"Public"]];
}

+ (NSString*)localizedValueForActivityStatus:(NSString*)value activityType:(NSString*)activityType
{
    NSPredicate *p = [NSPredicate predicateWithFormat:@"service = %@ AND crm_name = %@", [Service getActive], kVTModuleCalendar];
    Module *crmmodule = [Module MR_findFirstWithPredicate:p];
    CRMField *field;
    //Get the correct field depending on the calendar type Task or Meeting/Call
    if ([activityType isEqualToString:kCRMActivityTypeTask]) {
        field = [CRMField MR_findFirstWithPredicate:[NSPredicate predicateWithFormat:@"module = %@ AND crm_name = %@", crmmodule, kCalendarFieldtaskstatus]];
    }
    else{
        field = [CRMField MR_findFirstWithPredicate:[NSPredicate predicateWithFormat:@"module = %@ AND crm_name = %@", crmmodule, kCalendarFieldeventstatus]];
    }
    for (CRMFieldPicklistValue *picklistValue in field.picklist_values) {
        if([picklistValue.crm_value isEqualToString:value])
        {
            return picklistValue.crm_label;
        }
    }
    //Otherwise return the default value
    return value;
}

+ (NSString*)localizedValueForActivityVisibility:(NSString*)value
{
    NSPredicate *p = [NSPredicate predicateWithFormat:@"service = %@ AND crm_name = %@", [Service getActive], kVTModuleCalendar];
    Module *crmmodule = [Module MR_findFirstWithPredicate:p];
    CRMField *field = [CRMField MR_findFirstWithPredicate:[NSPredicate predicateWithFormat:@"module = %@ AND crm_name = %@", crmmodule, kCalendarFieldvisibility]];
    for (CRMFieldPicklistValue *picklistValue in field.picklist_values) {
        if([picklistValue.crm_value isEqualToString:value])
        {
            return picklistValue.crm_label;
        }
    }
    //Otherwise return the default value
    return value;
}

@end
