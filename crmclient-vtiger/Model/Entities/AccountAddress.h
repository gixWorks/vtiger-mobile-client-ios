#import "_AccountAddress.h"

@interface AccountAddress : _AccountAddress {}

+ (AccountAddress *)modelObjectWithDictionary:(NSDictionary *)dict;
- (void)assignFieldsFromDictionary:(NSDictionary *)dict;

@end
