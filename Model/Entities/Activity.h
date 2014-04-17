#import "_Activity.h"

@interface Activity : _Activity {}

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

- (BOOL)updateModelObjectWithDictionary:(NSDictionary*)dict customFields:(NSDictionary*)cfields;

@end
