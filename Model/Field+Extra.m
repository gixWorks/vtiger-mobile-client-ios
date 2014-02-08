//
//  Field+Extra.m
//  
//
//  Created by Giovanni on 08/02/14.
//
//

#import "Field+Extra.h"

@implementation Field (Extra)

+ (Field *)modelObjectWithDictionary:(NSDictionary *)dict
{
    Field *instance = [Field MR_createEntity];
    
    
    return instance;
}

@end
