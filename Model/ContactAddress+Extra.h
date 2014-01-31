//
//  ContactAddress+Extra.h
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 1/9/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import "ContactAddress.h"

@interface ContactAddress (Extra)

+ (ContactAddress *)modelObjectWithDictionary:(NSDictionary *)dict;
- (void)assignFieldsFromDictionary:(NSDictionary *)dict;

@end
