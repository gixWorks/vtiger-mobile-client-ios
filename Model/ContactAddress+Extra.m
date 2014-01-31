//
//  ContactAddress+Extra.m
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 1/9/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import "ContactAddress+Extra.h"

NSString* const kContactAddressFieldMailingCity = @"mailingcity";
NSString* const kContactAddressFieldMailingCountry = @"mailingcountry";
NSString* const kContactAddressFieldMailingPobox = @"mailingpobox";
NSString* const kContactAddressFieldMailingState = @"mailingstate";
NSString* const kContactAddressFieldMailingStreet = @"mailingstreet";
NSString* const kContactAddressFieldMailingZip = @"mailingzip";
NSString* const kContactAddressFieldOtherCity = @"othercity";
NSString* const kContactAddressFieldOtherCountry = @"othercountry";
NSString* const kContactAddressFieldOtherPobox = @"otherpobox";
NSString* const kContactAddressFieldOtherState = @"otherstate";
NSString* const kContactAddressFieldOtherStreet = @"otherstreet";
NSString* const kContactAddressFieldOtherZip = @"otherzip";


@implementation ContactAddress (Extra)

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
        
        //Setup the number formatter
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
        
        //Setup the date formatters
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
        [timeFormat setDateFormat:@"HH:mm:ss"];
        
        
        self.crm_mailingcity = [dict objectForKey:kContactAddressFieldMailingCity];
        self.crm_mailingcountry = [dict objectForKey:kContactAddressFieldMailingCountry];
        self.crm_mailingpobox = [dict objectForKey:kContactAddressFieldMailingPobox];
        self.crm_mailingstate = [dict objectForKey:kContactAddressFieldMailingState];
        self.crm_mailingstreet = [dict objectForKey:kContactAddressFieldMailingStreet];
        self.crm_mailingzip = [dict objectForKey:kContactAddressFieldMailingZip];
        
        self.crm_othercity = [dict objectForKey:kContactAddressFieldOtherCity];
        self.crm_othercountry = [dict objectForKey:kContactAddressFieldOtherCountry];
        self.crm_otherpobox = [dict objectForKey:kContactAddressFieldOtherPobox];
        self.crm_otherstate = [dict objectForKey:kContactAddressFieldOtherState];
        self.crm_otherstreet = [dict objectForKey:kContactAddressFieldOtherStreet];
        self.crm_otherzip = [dict objectForKey:kContactAddressFieldOtherZip];
        
        
    }
    
}


@end
