#import "LeadAddress.h"
#import "CRMFieldConstants.h"

@interface LeadAddress ()

// Private interface goes here.

@end


@implementation LeadAddress

+ (ContactAddress *)modelObjectWithDictionary:(NSDictionary *)dict
{
    ContactAddress *instance = [ContactAddress MR_createEntity];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if([dict isKindOfClass:[NSDictionary class]]) {
        
        [instance assignFieldsFromDictionary:dict];
    }
    return instance;
}

- (void)assignFieldsFromDictionary:(NSDictionary *)dict
{
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if([dict isKindOfClass:[NSDictionary class]]) {
        
        self.crm_city = [dict objectForKey:kLeadAddressCity];
        self.crm_code = [dict objectForKey:kLeadAddressCode];
        self.crm_country = [dict objectForKey:kLeadAddressCountry];
        self.crm_pobox = [dict objectForKey:kLeadAddressPobox];
        self.crm_state = [dict objectForKey:kLeadAddressState];
        self.crm_street = [dict objectForKey:kLeadAddressStreet];
    }
}

@end
