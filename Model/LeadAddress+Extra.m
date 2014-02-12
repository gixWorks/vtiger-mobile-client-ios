//
//  LeadAddress+Extra.m
//  ContactiCalVtiger
//
//  Created by Giovanni on 12/02/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import "LeadAddress+Extra.h"
#import "CRMFieldConstants.h"

@implementation LeadAddress (Extra)
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
//        self.crm_mailingcity = [dict objectForKey:kContactAddressFieldMailingCity];
//        self.crm_mailingcountry = [dict objectForKey:kContactAddressFieldMailingCountry];
//        self.crm_mailingpobox = [dict objectForKey:kContactAddressFieldMailingPobox];
//        self.crm_mailingstate = [dict objectForKey:kContactAddressFieldMailingState];
//        self.crm_mailingstreet = [dict objectForKey:kContactAddressFieldMailingStreet];
//        self.crm_mailingzip = [dict objectForKey:kContactAddressFieldMailingZip];
//        
//        self.crm_othercity = [dict objectForKey:kContactAddressFieldOtherCity];
//        self.crm_othercountry = [dict objectForKey:kContactAddressFieldOtherCountry];
//        self.crm_otherpobox = [dict objectForKey:kContactAddressFieldOtherPobox];
//        self.crm_otherstate = [dict objectForKey:kContactAddressFieldOtherState];
//        self.crm_otherstreet = [dict objectForKey:kContactAddressFieldOtherStreet];
//        self.crm_otherzip = [dict objectForKey:kContactAddressFieldOtherZip];
        
        
    }
    
}

@end
