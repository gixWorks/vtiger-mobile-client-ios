//
//  Activity+Extra.h
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 11/30/13.
//  Copyright (c) 2013 gixWorks. All rights reserved.
//

#import "Activity.h"
#import <CoreData+MagicalRecord.h>
#import "ResponseParser.h"

@interface Activity (Extra)

/*** Init Methods ***/

/*
 Initializes and returns an Activity. This method calls modelObjectWithDictionary:customFields: after having parsed the custom fields

 @param dict The dictionary of key : value fields already parsed
 @return The new Activity object
*/
+ (Activity *)modelObjectWithDictionary:(NSDictionary *)dict;

/*
 Initializes and returns an Activity. This is the preferred method to call. The custom fields are expected containing the entire custom field (name, value, uitype, label) for building the custom fields later.
 
 @param dict The dictionary of key : value fields already parsed
 @return The new Activity object
 */

+ (Activity *)modelObjectWithDictionary:(NSDictionary *)dict customFields:(NSDictionary*)cfields;

/*** Representation Methods ***/

- (NSDictionary*)crmRepresentation;

- (NSDictionary*)proxyForJson;

@end
