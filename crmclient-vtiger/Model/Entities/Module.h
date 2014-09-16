#import "_Module.h"

@interface Module : _Module {}

/*** Init methods ***/

+ (Module *)modelObjectWithDictionary:(NSDictionary *)dict;
//+ (Module *)modelObjectWithFieldsWithDictionary:(NSDictionary *)dict;

/*** Related properties methods ***/

- (BOOL)setDescriptionWithDictionary:(NSDictionary*)dict;

/*** Representation methods ***/
- (NSDictionary*)dictionaryRepresentation;

@end
