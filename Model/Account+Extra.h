//
//  Account+Extra.h
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 12/1/13.
//  Copyright (c) 2013 gixWorks. All rights reserved.
//

#import "Account.h"

@interface Account (Extra)

+ (Account *)modelObjectWithDictionary:(NSDictionary *)dict customFields:(NSDictionary *)cfields;

@end
