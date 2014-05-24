//
//  CRMPicklistHelper.h
//  ContactiCalVtiger
//
//  Created by Giovanni on 12/04/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CRMPicklistHelper : NSObject
/**
 *  Returns a NSArray of GWActivitySelectItems with the picklist values for the Activity Status depending on the activity
 *
 *  @param activityType Type of Activity (Call, Task, Meeting)
 *
 *  @return NSArray of GWActivitySelectItems
 */
+ (NSArray*)picklistValuesForActivityStatus:(NSString*)activityType;

/**
 *  Returns values of visibiltiy for activity
 *
 *  @return NSArray of GWActivitySelectItems
 */
+ (NSArray*)picklistValuesForActivityVisibility;

/**
 *  Translates the status of the activity to the localized label
 *
 *  @param value        the English value of the Status
 *  @param activityType the type of activity, either Task Call or Meeting
 *
 *  @return The localized value of the Status
 */
+ (NSString*)localizedValueForActivityStatus:(NSString*)value activityType:(NSString*)activityType;

/**
 *  Translates the visibility to the localized label
 *
 *  @param value the visibility constant kPrivate or kPublic
 *
 *  @return The localized value of the Visibility
 */
+ (NSString*)localizedValueForActivityVisibility:(NSString*)value;

@end
