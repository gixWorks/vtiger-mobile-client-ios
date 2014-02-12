//
//  ModulesHelper.h
//  ContactiCalVtiger
//
//  Created by Giovanni on 04/02/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

//Module constants
extern NSString* const kVTModuleCalendar;
extern NSString* const kVTModuleLeads;
extern NSString* const kVTModuleAccounts;
extern NSString* const kVTModuleContacts;
extern NSString* const kVTModulePotentials;
extern NSString* const kVTModuleHelpDesk;
extern NSString* const kVTModuleProducts;

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
 
@end
