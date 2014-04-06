#import "_Account.h"

@interface Account : _Account {}

+ (Account *)modelObjectWithDictionary:(NSDictionary *)dict customFields:(NSDictionary *)cfields;

@end
