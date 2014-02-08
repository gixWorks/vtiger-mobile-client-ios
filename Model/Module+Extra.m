//
//  Module+Extra.m
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 11/30/13.
//  Copyright (c) 2013 gixWorks. All rights reserved.
//

#import "Module+Extra.h"
#import "Field+Extra.h"
#import "CRMFieldConstants.h"

NSString* const kModule_id = @"id";
NSString* const kModule_name = @"name";
NSString* const kModule_isEntity = @"isEntity";
NSString* const kModule_label = @"label";
NSString* const kModule_singular = @"singular";

@implementation Module (Extra)

+ (Module *)modelObjectWithDictionary:(NSDictionary *)dict
{
    NSString *record_id = [dict objectForKey:kModule_id];
    Module *instance;
    //I first try to count the entities (should take less time) and load the entity only if strictly necessary (if count > 0). The Count operation should be less intensive than the Fetch, so I use it for checking the existence
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"crm_id = %@", record_id];
    NSUInteger count = [self MR_countOfEntitiesWithPredicate:predicate];
    
    if (count > 0) {
        instance = [self MR_findFirstByAttribute:@"crm_id" withValue:record_id];
    }
    else{
        instance = [self MR_createEntity];
    }

    
    if([dict isKindOfClass:[NSDictionary class]]) {
        
        instance.crm_name = [dict objectForKey:kModule_name];
        instance.crm_id = [dict objectForKey:kModule_id];
        instance.crm_isEntity = [[dict objectForKey:kModule_label] boolValue];
        instance.crm_label = [dict objectForKey:kModule_label];
        instance.crm_singular = [dict objectForKey:kModule_singular];
        instance.service = [Service getActive];
    }
    return instance;
}

+ (Module *)modelObjectWithFieldsWithDictionary:(NSDictionary *)dict
{
    Module *instance = [Module modelObjectWithDictionary:dict];
    if (instance != nil && [dict isKindOfClass:[NSDictionary class]]) {
        for (NSDictionary *f in [dict objectForKey:@"fields"]) {
            Field *field = [Field modelObjectWithDictionary:f];
            field.module = instance;
        }
    }
    return instance;
}

- (NSDictionary *)crmRepresentation
{
    //TODO: represent as dictionary rebuilding the CRM fields from the Core Data entities
    return nil;
}

@end
