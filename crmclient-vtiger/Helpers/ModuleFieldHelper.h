//
//  ModuleFieldHelper.h
//  ContactiCalVtiger
//
//  Created by Giovanni on 12/02/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModuleFieldHelper : NSObject

/**
 *  Returns the localized label for the field based on the data synchronized from the server with Describe
 *
 *  @param fieldName  the name of the field, passed with a constant (e.g. kCRMContactFieldName_noofemployees)
 *  @param moduleName the name of the module (e.g. Accounts)
 *
 *  @return the label field of the CRMField
 */
+ (NSString*)localizedLabelForField:(NSString*)fieldName module:(NSString*)moduleName;


/**
 *  Returns the default value for a field
 *
 *  @param fieldName  the field name (use constants)
 *  @param moduleName the module name (use constants)
 *
 *  @return the default value
 */
+ (id)defaultValueForField:(NSString*)fieldName module:(NSString*)moduleName;

/**
 *  Returns an array of CRMFields for the requested module
 *
 *  @param moduleName the module name
 *
 *  @return an array of `CRMField` objects
 */
+ (NSArray*)fieldsForModule:(NSString*)moduleName;

+ (NSString*)fieldTypeForKey:(NSString*)fieldKey module:(NSString*)moduleName;

+ (CRMField*)fieldForKey:(NSString*)fieldKey module:(NSString*)moduleName;

@end
