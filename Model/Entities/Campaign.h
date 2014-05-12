#import "_Campaign.h"

@interface Campaign : _Campaign {}

+ (Campaign *)modelObjectWithDictionary:(NSDictionary *)dict customFields:(NSDictionary *)cfields;

@end
