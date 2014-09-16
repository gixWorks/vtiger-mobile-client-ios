#import "_Ticket.h"

@interface Ticket : _Ticket {}

+ (Ticket *)modelObjectWithDictionary:(NSDictionary *)dict customFields:(NSDictionary*)cfields;

@end
