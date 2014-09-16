#import "_LeadAddress.h"

@interface LeadAddress : _LeadAddress {}

+ (LeadAddress *)modelObjectWithDictionary:(NSDictionary *)dict;
- (void)assignFieldsFromDictionary:(NSDictionary *)dict;

@end
