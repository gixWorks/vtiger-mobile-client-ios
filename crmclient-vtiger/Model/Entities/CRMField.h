#import "_CRMField.h"

@interface CRMField : _CRMField {}

+ (CRMField *)modelObjectWithDictionary:(NSDictionary*)dict module:(Module*)module;
- (BOOL)isCustomField;

@end
