//
//  Lead+Extra.h
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 12/1/13.
//  Copyright (c) 2013 gixWorks. All rights reserved.
//

#import "Lead.h"

@interface Lead (Extra)

/*** Init Methods ***/

+ (Lead *)modelObjectWithDictionary:(NSDictionary *)dict customFields:(NSDictionary *)cfields;

/*** Representation Methods ***/

/**
 *  Represents the entity in a format that is easy to display in a table
 *
 *  @return the entity structured for a table, with labels and fields
 */
- (NSDictionary*)tableRepresentation;

/**
 *  Returns the entity in a dictionary representation
 *
 *  @return a NSDicrionary with constants as keys and entity values as values
 */
- (NSDictionary*)dictionaryRepresentation;

/*** JSON Methods ***/
/**
 *  Proxy for JSON
 *
 *  @return a NSDictionary to be encodable in JSON format
 */
- (NSDictionary*)proxyForJson;

@end
