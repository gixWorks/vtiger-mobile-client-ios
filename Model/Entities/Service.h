#import "_Service.h"

@interface Service : _Service {}

- (void)setActive;
+ (Service*)getActive;
+ (NSString*)getActiveServiceUsername;
+ (NSString*)getActiveServiceUrl;
+ (Service*)createAndSetActiveWithUsername:(NSString*)username userid:(NSString*)userid url:(NSString*)url crmOnDemand:(BOOL)onDemand;

@end
