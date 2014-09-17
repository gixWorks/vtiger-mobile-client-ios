#import "Module.h"
#import "CRMFieldConstants.h"
#import "CoreData+MagicalRecord.h"
#import "Service.h"
#import "CRMField.h"

@interface Module ()

// Private interface goes here.

@end


@implementation Module

+ (Module *)modelObjectWithDictionary:(NSDictionary *)dict
{
    NSString *record_id = [dict objectForKey:kModule_id];
    Module *instance;
    //I first try to count the entities (should take less time) and load the entity only if strictly necessary (if count > 0). The Count operation should be less intensive than the Fetch, so I use it for checking the existence
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"crm_id = %@ AND service = %@", record_id, [Service getActive]];
    NSUInteger count = [self MR_countOfEntitiesWithPredicate:predicate];
    
    if (count > 0) {
        instance = [self MR_findFirstByAttribute:@"crm_id" withValue:record_id inContext:[NSManagedObjectContext MR_defaultContext]];
    }
    else{
        instance = [self MR_createInContext:[NSManagedObjectContext MR_defaultContext]];
    }
    
    if([dict isKindOfClass:[NSDictionary class]]) {
        
        instance.crm_name = [dict objectForKey:kModule_name];
        instance.crm_id = [dict objectForKey:kModule_id];
        instance.crm_isEntity = [NSNumber numberWithBool:[[dict objectForKey:kModule_label] boolValue]];
        instance.crm_label = [dict objectForKey:kModule_label];
        instance.crm_singular = [dict objectForKey:kModule_singular];
        instance.service = [Service getActive];
    }
    return instance;
}

//+ (Module *)modelObjectWithFieldsWithDictionary:(NSDictionary *)dict
//{
//    Module *instance = [Module modelObjectWithDictionary:dict];
//    if (instance != nil && [dict isKindOfClass:[NSDictionary class]]) {
//        for (NSDictionary *f in [dict objectForKey:@"fields"]) {
//            CRMField *field = [CRMField modelObjectWithDictionary:f];
//            field.module = instance;
//        }
//    }
//    return instance;
//}

- (BOOL)setDescriptionWithDictionary:(NSDictionary*)dict
{
    BOOL success = YES;
    //First I remove all the fields, to avoid
    for (CRMField *oldField in self.fields) {
        [oldField MR_deleteEntity];
    }
    //And I really make sure they are out of the way
    NSSet* oldFields = self.fields;
    [self removeFields:oldFields];
    
    if ([dict isKindOfClass:[NSDictionary class]]) {
        for (NSDictionary *f in [dict objectForKey:@"fields"]) {
            CRMField *field = [CRMField modelObjectWithDictionary:f module:self];
            if (field !=nil) {
                [self addFieldsObject:field];
            }
            else{
                success = NO;
            }
        }
    }
    return success;
}

- (NSDictionary *)dictionaryRepresentation
{
    //TODO: represent as dictionary rebuilding the CRM fields from the Core Data entities
    return nil;
}

@end
