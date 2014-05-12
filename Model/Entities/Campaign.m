#import "Campaign.h"
#import "CRMFieldConstants.h"
#import "ModulesHelper.h"
#import "CRMClient.h"

@interface Campaign ()

// Private interface goes here.

@end


@implementation Campaign

+ (Campaign *)modelObjectWithDictionary:(NSDictionary *)dict customFields:(NSDictionary *)cfields
{
    NSString *record_id = [dict objectForKey:kTicketFieldId];
    Campaign *instance;
    
    
    //I first try to count the entities (should take less time) and load the entity only if strictly necessary (if count > 0). The Count operation should be less intensive than the Fetch, so I use it for checking the existence
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"crm_id = %@", record_id];
    NSUInteger count = [Campaign MR_countOfEntitiesWithPredicate:predicate];
    
    if (count > 0) {
        instance = [Campaign MR_findFirstByAttribute:@"crm_id" withValue:record_id];
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
        instance = [Campaign MR_createEntity];
    }
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if([dict isKindOfClass:[NSDictionary class]]) {
        
        //Setup the number formatter
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        
        NSDateFormatter *dateTimeFormat = [[NSDateFormatter alloc] init];
        [dateTimeFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSDate *time_modified = [dateTimeFormat dateFromString:[dict objectForKey:kFieldModifiedTime]];
        NSDate *time_created = [dateTimeFormat dateFromString:[dict objectForKey:kFieldCreatedTime]];
        instance.crm_time_modified = time_modified;
        instance.crm_time_created = time_created;
        
        //Properties defined by CRM
        instance.crm_id = [dict objectForKey:kCampaignFieldId];
        instance.crm_assigned_user_id = [[dict objectForKey:kCampaignFieldAssignedto] objectForKey:@"value"];
        instance.crm_assigned_user_name = [[dict objectForKey:kCampaignFieldAssignedto] objectForKey:@"label"];
        instance.crm_campaign_no = [dict objectForKey:kCampaignCampaignNo];
        instance.crm_campaignname = [dict objectForKey:kCampaignName];
        instance.crm_campaignstatus = [dict objectForKey:kCampaignStatus];
        instance.crm_campaigntype = [dict objectForKey:kCampaignType];
        instance.crm_closingdate = [dateFormat dateFromString:[dict objectForKey:kCampaignClosingdate]];
        instance.crm_description = [dict objectForKey:kCampaignDescription];
        instance.crm_numsent = [numberFormatter numberFromString:[dict objectForKey:kCampaignNumsent]];
        instance.crm_sponsor = [dict objectForKey:kCampaignSponsor];
        instance.crm_targetaudience = [dict objectForKey:kCampaignTargetaudience];
        instance.crm_targetsize = [numberFormatter numberFromString:[dict objectForKey:kCampaignTargetSize]];
        
        //Decode and load product
        NSDictionary *product = [dict objectForKey:kCampaignProductId];
        if ([[product objectForKey:@"value"] length] > 0) {
            instance.crm_product_id = [product objectForKey:@"value"];
            instance.crm_product_name = [product objectForKey:@"label"];
            [[CRMClient sharedInstance] addRecordToFetchQueue:instance.crm_product_id];
            //            [[CRMClient sharedInstance] fetchRecord:instance.my_relatedrecordid andAssociateToRecord:instance];
        }
        
        //Custom fields
        NSError *cfieldsError;
        if(cfields != nil) {
            instance.my_custom_fields = [NSJSONSerialization dataWithJSONObject:cfields options:NSJSONWritingPrettyPrinted error:&cfieldsError];
            if (cfieldsError != nil) {
                NSLog(@"Entity: %@ Error in custom fields: %@", instance.crm_id, [cfieldsError description]);
            }
        }
        
        //Add the relationship with the current service
        instance.service = [Service getActive];
    }
    
    return instance;
}

@end
