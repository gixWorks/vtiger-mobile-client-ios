//
//  Module+Extra.h
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 11/30/13.
//  Copyright (c) 2013 gixWorks. All rights reserved.
//

#import "Module.h"

@interface Module (Extra)

+ (Module *)modelObjectWithDictionary:(NSDictionary *)dict;
+ (Module *)modelObjectWithFieldsWithDictionary:(NSDictionary *)dict;

- (NSDictionary*)crmRepresentation;

@end
