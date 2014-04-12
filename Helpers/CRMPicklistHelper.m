//
//  CRMPicklistHelper.m
//  ContactiCalVtiger
//
//  Created by Giovanni on 12/04/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import "CRMPicklistHelper.h"
#import "CRMConstants.h"
#import "GWActivitySelectItem.h"

@implementation CRMPicklistHelper

+ (NSArray*)picklistValuesForActivityStatus:(NSString*)activityType
{
    if ([activityType isEqualToString:kCRMActivityTypeTask]) {
        return @[[GWActivitySelectItem itemWithLabel:NSLocalizedString(kCRMActivityTaskStatusCompleted, @"Taks Status Completed") value:kCRMActivityTaskStatusCompleted],
                 [GWActivitySelectItem itemWithLabel:NSLocalizedString(kCRMActivityTaskStatusDeferred, @"Task Status Deferred") value:kCRMActivityTaskStatusDeferred],
                 [GWActivitySelectItem itemWithLabel:NSLocalizedString(kCRMActivityTaskStatusInProgress, @"Task Status In Progress") value:kCRMActivityTaskStatusInProgress],
                 [GWActivitySelectItem itemWithLabel:NSLocalizedString(kCRMActivityTaskStatusNotStarted, @"Task Status Not Started") value:kCRMActivityTaskStatusNotStarted],
                 [GWActivitySelectItem itemWithLabel:NSLocalizedString(kCRMActivityTaskStatusPendingInput, @"Task Status Pending Input") value:kCRMActivityTaskStatusPendingInput],
                 [GWActivitySelectItem itemWithLabel:NSLocalizedString(kCRMActivityTaskStatusPlanned, @"Task Status Planned") value:kCRMActivityTaskStatusPlanned]
                 ];
    }
    if ([activityType isEqualToString:kCRMActivityTypeMeeting] || [activityType isEqualToString:kCRMActivityTypeCall]) {
        return
        @[[GWActivitySelectItem itemWithLabel:NSLocalizedString(kCRMActivityCallMeetingStatusHeld, @"Call Meeting Status Held") value:kCRMActivityCallMeetingStatusHeld],
          [GWActivitySelectItem itemWithLabel:NSLocalizedString(kCRMActivityCallMeetingStatusNotHeld, @"Call Meeting Status Not Held") value:kCRMActivityCallMeetingStatusNotHeld],
          [GWActivitySelectItem itemWithLabel:NSLocalizedString(kCRMActivityCallMeetingStatusPlanned, @"Call Meeting Status Planned") value:kCRMActivityCallMeetingStatusPlanned]
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

@end
