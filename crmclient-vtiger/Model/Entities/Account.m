#import "Account.h"
#import "CRMFieldConstants.h"
#import "CoreData+MagicalRecord.h"
#import "Service.h"
#import "AccountAddress.h"


@interface Account ()

// Private interface goes here.

@end


@implementation Account

+ (Account *)modelObjectWithDictionary:(NSDictionary *)dict customFields:(NSDictionary *)cfields
{
    NSString *record_id = [dict objectForKey:kAccountFieldid];
    Account *instance;
    
    
    //I first try to count the entities (should take less time) and load the entity only if strictly necessary (if count > 0). The Count operation should be less intensive than the Fetch, so I use it for checking the existence
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"crm_id = %@", record_id];
    NSUInteger count = [Account MR_countOfEntitiesWithPredicate:predicate];
    
    if (count > 0) {
        instance = [Account MR_findFirstByAttribute:@"crm_id" withValue:record_id];
        NSDateFormatter *dateTimeFormat = [[NSDateFormatter alloc] init];
        [dateTimeFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate *time_modified = [dateTimeFormat dateFromString:[dict objectForKey:kFieldModifiedTime]];
        if ([time_modified compare:instance.crm_time_created] == NSOrderedSame) {
#if DEBUG
            NSLog(@"%@ %@ skipping %@ as modified_time is the same", NSStringFromClass([self class]), NSStringFromSelector(_cmd), record_id);
#endif
            //It's the same instance
            return instance;
        }
    }
    else{
        instance = [Account MR_createEntity];
    }
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if([dict isKindOfClass:[NSDictionary class]]) {
        
        //Setup the number formatter
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setNumberStyle:NSNumberFormatterNoStyle];
        
        
        //Setup the date formatters
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
        [timeFormat setDateFormat:@"HH:mm:ss"];
        NSDateFormatter *dateTimeFormat = [[NSDateFormatter alloc] init];
        [dateTimeFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate *time_modified = [dateTimeFormat dateFromString:[dict objectForKey:kFieldModifiedTime]];
        NSDate *time_created = [dateTimeFormat dateFromString:[dict objectForKey:kFieldCreatedTime]];
        instance.crm_time_modified = time_modified;
        instance.crm_time_created = time_created;
        
        instance.crm_memberof_id = [[dict objectForKey:kAccountFieldaccount_id] objectForKey:@"value"];
        instance.crm_memberof_name = [[dict objectForKey:kAccountFieldaccount_id] objectForKey:@"name"];
        instance.crm_account_no = [dict objectForKey:kAccountFieldaccount_no];
        instance.crm_accountname = [dict objectForKey:kAccountFieldaccountname];
        instance.crm_accounttype = [dict objectForKey:kAccountFieldaccounttype];
        instance.crm_annual_revenue = numberFromString([dict objectForKey:kAccountFieldannual_revenue]);
        instance.crm_assigned_user_id = [[dict objectForKey:kAccountFieldassigned_user_id] objectForKey:@"value"];
        instance.crm_assigned_user_name = [[dict objectForKey:kAccountFieldassigned_user_id] objectForKey:@"name"];
        instance.crm_description = [dict objectForKey:kAccountFielddescription];
        instance.crm_email1 = [dict objectForKey:kAccountFieldemail1];
        instance.crm_email2 = [dict objectForKey:kAccountFieldemail2];
        instance.crm_emailoptout = [numberFormatter numberFromString:[dict objectForKey:kAccountFieldemailoptout]];
        instance.crm_employees = [numberFormatter numberFromString:[dict objectForKey:kAccountFieldemployees]];
        instance.crm_fax = [dict objectForKey:kAccountFieldfax];
        instance.crm_id = [dict objectForKey:kAccountFieldid];
        instance.crm_industry = [dict objectForKey:kAccountFieldindustry];
        instance.crm_notify_owner = [numberFormatter numberFromString:[dict objectForKey:kAccountFieldnotify_owner]];
        instance.crm_otherphone = [dict objectForKey:kAccountFieldotherphone];
        instance.crm_ownership = [dict objectForKey:kAccountFieldownership];
        instance.crm_phone = [dict objectForKey:kAccountFieldphone];
        instance.crm_rating = [dict objectForKey:kAccountFieldratingrating];
        instance.crm_siccode = [dict objectForKey:kAccountFieldsiccode];
        instance.crm_tickersymbol = [dict objectForKey:kAccountFieldticketsymbol];
        instance.crm_website = [dict objectForKey:kAccountFieldwebsite];
        
        //Custom fields
        NSError *cfieldsError;
        if(cfields != nil) {
            instance.my_custom_fields = [NSJSONSerialization dataWithJSONObject:cfields options:NSJSONWritingPrettyPrinted error:&cfieldsError];
            if (cfieldsError != nil) {
                NSLog(@"Entity: %@ Error in custom fields: %@", instance.crm_id, [cfieldsError description]);
            }
        }
        
        //Address
        if (instance.address == nil) {
            instance.address = [AccountAddress MR_createEntity];
        }
        [instance.address assignFieldsFromDictionary:dict];
        
        //Add the relationship with the current service
        instance.service = [Service getActive];
        
    }
    
    return instance;
}

@end
