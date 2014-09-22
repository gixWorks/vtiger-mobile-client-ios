#import "_Project.h"

@interface Project : _Project {}

/*
 Initializes and returns a Project. This method calls modelObjectWithDictionary:customFields: after having parsed the custom fields
 
 @param dict The dictionary of key : value fields already parsed
 @return The new Activity object
 */
+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;

/*
 Initializes and returns a Project. This is the preferred method to call. The custom fields are expected containing the entire custom field (name, value, uitype, label) for building the custom fields later.
 
 @param dict The dictionary of key : value fields already parsed
 @return The new Activity object
 */

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict customFields:(NSDictionary*)cfields;

- (BOOL)updateModelObjectWithDictionary:(NSDictionary*)dict customFields:(NSDictionary*)cfields;

@end
