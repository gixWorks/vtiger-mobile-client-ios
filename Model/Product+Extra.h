//
//  Product+Extra.h
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 1/9/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import "Product.h"

@interface Product (Extra)

+ (Product *)modelObjectWithDictionary:(NSDictionary *)dict;

@end
