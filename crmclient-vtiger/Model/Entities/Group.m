#import "Group.h"
#import "CRMFieldConstants.h"
#import "CoreData+MagicalRecord.h"
#import "Service.h"

@interface Group ()

// Private interface goes here.

@end


@implementation Group

+ (Group *)modelObjectWithDictionary:(NSDictionary *)dict
{
    NSString *record_id = [dict objectForKey:kFieldId];
    Group *instance;
    
    //I first try to count the entities (should take less time) and load the entity only if strictly necessary (if count > 0). The Count operation should be less intensive than the Fetch, so I use it for checking the existence
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"crm_id = %@", record_id];
    NSUInteger count = [[self class] MR_countOfEntitiesWithPredicate:predicate];
    
    if (count > 0) {
        instance = [Group MR_findFirstByAttribute:@"crm_id" withValue:record_id];
        //It's the same instance
        return instance;
    }
    else{
        instance = [Group MR_createEntity];
    }
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if([dict isKindOfClass:[NSDictionary class]]) {
        
        //Properties defined by CRM
        instance.crm_id = [dict objectForKey:kGroupFieldId];
        instance.crm_label = [dict objectForKey:kGroupFieldGroupName];
        
        
        //Add the relationship with the current service
        instance.service = [Service getActive];
    }
    
    return instance;
}

@end
