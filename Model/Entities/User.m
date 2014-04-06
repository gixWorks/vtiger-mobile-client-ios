#import "User.h"
#import "CRMFieldConstants.h"


@interface User ()

// Private interface goes here.

@end


@implementation User

+ (User *)modelObjectWithDictionary:(NSDictionary *)dict
{
    NSString *record_id = [dict objectForKey:kFieldId];
    User *instance;
        
    //I first try to count the entities (should take less time) and load the entity only if strictly necessary (if count > 0). The Count operation should be less intensive than the Fetch, so I use it for checking the existence
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"crm_id = %@", record_id];
    NSUInteger count = [User MR_countOfEntitiesWithPredicate:predicate];
    
    if (count > 0) {
        instance = [User MR_findFirstByAttribute:@"crm_id" withValue:record_id];
            //It's the same instance
            return instance;
    }
    else{
        instance = [User MR_createEntity];
    }
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if([dict isKindOfClass:[NSDictionary class]]) {
        
        //Properties defined by CRM
        instance.crm_id = [dict objectForKey:kFieldId];
        instance.crm_label = [dict objectForKey:kFieldLabel];


        //Add the relationship with the current service
        instance.service = [Service getActive];
    }
    
    return instance;
}
@end
