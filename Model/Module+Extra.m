//
//  Module+Extra.m
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 11/30/13.
//  Copyright (c) 2013 gixWorks. All rights reserved.
//

#import "Module+Extra.h"

NSString* const kModuleFieldid = @"id";
NSString* const kModuleFieldname = @"name";
NSString* const kModuleFieldisEntity = @"isEntity";
NSString* const kModuleFieldlabel = @"label";
NSString* const kModuleFieldsingular = @"singular";

@implementation Module (Extra)

+ (Module *)modelObjectWithDictionary:(NSDictionary *)dict
{
    NSString *record_id = [dict objectForKey:kModuleFieldid];
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
        
        instance.crm_name = [dict objectForKey:kModuleFieldname];
        instance.crm_id = [dict objectForKey:kModuleFieldid];
        instance.crm_isEntity = [[dict objectForKey:kModuleFieldlabel] boolValue];
        instance.crm_label = [dict objectForKey:kModuleFieldlabel];
        instance.crm_singular = [dict objectForKey:kModuleFieldsingular];
        instance.service = [Service getActive];
    }
    return instance;
}

- (NSDictionary *)crmRepresentation
{
    //TODO: represent as dictionary rebuilding the CRM fields from the Core Data entities
    return nil;
}

@end
