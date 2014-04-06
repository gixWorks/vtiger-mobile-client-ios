#import "_Contact.h"

@interface Contact : _Contact {}

+ (Contact *)modelObjectWithDictionary:(NSDictionary *)dict customFields:(NSDictionary *)cfields;

@end
