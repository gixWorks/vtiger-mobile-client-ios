//
//  ModulesHelper.h
//  ContactiCalVtiger
//
//  Created by Giovanni on 04/02/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModulesHelper : NSObject

/**
 Returns the name of the Module based on the record passed
 
 @param record The record id to decode, in the format MODULExRECORD_ID e.g. 1x1223
 @return the name of the module
 */
+ (NSString*)decodeModuleForRecordId:(NSString*)record;

/**
 Returns the name of the module localized in the current language
 
 @param record The record id to decode, in the format MODULExRECORD_ID e.g. 1x1223
 @return the localized name of the module
*/
+ (NSString*)localizedModuleNameForRecord:(NSString*)record;

/**
 Returns the singular name of the module localized in the current language (e.g. for Leads will return Lead)
 
 @param record The record id to decode, in the format MODULExRECORD_ID e.g. 1x1223
 @return the localized name of the module
 */
+ (NSString*)localizedSingularModuleNameForRecord:(NSString*)record;

/**
 *  Returns a list of the enabled modules in the CRM
 *
 *  @return an array of strings with the module names
 */
+ (NSArray*)enabledModules;

/**
 *  Returns the label for the module `key`
 *
 *  @param moduleName the name of the module using the constant such as kModuleLeads
 *
 *  @return the localized label from the Database
 */
+ (NSString*)localizedLabelForModuleName:(NSString*)moduleName;

/**
 *  Returns the ID of the module given the name, as specified when syncing the modules with CRM
 *
 *  @param moduleName the name of the module
 *
 *  @return the crm_id of the module from the DB
 */
+ (NSString*)moduleIdForModuleName:(NSString*)moduleName;

/**
 *  Returns the correct module id depending on the activity record type (Call, Task, Meeting)
 *
 *  @param calendarRecordType the Calendar record type (Call,Task,Meeting)
 *
 *  @return the ID of the corresponding module
 */
+ (NSString*)moduleIdForCalendarRecordType:(NSString*)calendarRecordType;
 
@end
