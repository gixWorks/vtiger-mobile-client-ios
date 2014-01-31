//
//  AccountAddress+Extra.h
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 12/2/13.
//  Copyright (c) 2013 gixWorks. All rights reserved.
//

#import "AccountAddress.h"

@interface AccountAddress (Extra)

+ (AccountAddress *)modelObjectWithDictionary:(NSDictionary *)dict;
- (void)assignFieldsFromDictionary:(NSDictionary *)dict;

@end
