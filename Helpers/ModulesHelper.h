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
+ (NSString*)decodeRecordType:(NSString*)record;

/**
 Returns the name of the module localized in the current language
 
 @param record The record id to decode, in the format MODULExRECORD_ID e.g. 1x1223
 @return the localized name of the module
*/
+ (NSString*)localizedModuleNameForRecord:(NSString*)record;

@end
