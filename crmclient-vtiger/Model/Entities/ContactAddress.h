#import "_ContactAddress.h"

@interface ContactAddress : _ContactAddress {}

+ (ContactAddress *)modelObjectWithDictionary:(NSDictionary *)dict;
- (void)assignFieldsFromDictionary:(NSDictionary *)dict;

@end
