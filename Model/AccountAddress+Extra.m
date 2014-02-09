//
//  AccountAddress+Extra.m
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 12/2/13.
//  Copyright (c) 2013 gixWorks. All rights reserved.
//

#import "AccountAddress+Extra.h"
#import "CRMFieldConstants.h"

@implementation AccountAddress (Extra)

+ (AccountAddress *)modelObjectWithDictionary:(NSDictionary *)dict
{
    AccountAddress *instance = [AccountAddress MR_createEntity];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if([dict isKindOfClass:[NSDictionary class]]) {
        
        [instance assignFieldsFromDictionary:dict];
        
//        //Setup the number formatter
//        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
//        [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
//        
//        //Setup the date formatters
//        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
//        [dateFormat setDateFormat:@"yyyy-MM-dd"];
//        NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
//        [timeFormat setDateFormat:@"HH:mm:ss"];
//        
//        
//        instance.crm_ship_city = [dict objectForKey:kAccountFieldship_city];
//        instance.crm_ship_code = [dict objectForKey:kAccountFieldship_code];
//        instance.crm_ship_country = [dict objectForKey:kAccountFieldship_country];
//        instance.crm_ship_pobox = [dict objectForKey:kAccountFieldship_pobox];
//        instance.crm_ship_state = [dict objectForKey:kAccountFieldship_state];
//        instance.crm_ship_street = [dict objectForKey:kAccountFieldship_street];
//        
//        instance.crm_bill_city = [dict objectForKey:kAccountFieldbill_city];
//        instance.crm_bill_code = [dict objectForKey:kAccountFieldbill_code];
//        instance.crm_bill_country = [dict objectForKey:kAccountFieldbill_country];
//        instance.crm_bill_pobox = [dict objectForKey:kAccountFieldbill_pobox];
//        instance.crm_bill_state = [dict objectForKey:kAccountFieldbill_state];
//        instance.crm_bill_street = [dict objectForKey:kAccountFieldbill_street];
//        
//        
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
        
        
        self.crm_ship_city = [dict objectForKey:kAccountFieldship_city];
        self.crm_ship_code = [dict objectForKey:kAccountFieldship_code];
        self.crm_ship_country = [dict objectForKey:kAccountFieldship_country];
        self.crm_ship_pobox = [dict objectForKey:kAccountFieldship_pobox];
        self.crm_ship_state = [dict objectForKey:kAccountFieldship_state];
        self.crm_ship_street = [dict objectForKey:kAccountFieldship_street];
        
        self.crm_bill_city = [dict objectForKey:kAccountFieldbill_city];
        self.crm_bill_code = [dict objectForKey:kAccountFieldbill_code];
        self.crm_bill_country = [dict objectForKey:kAccountFieldbill_country];
        self.crm_bill_pobox = [dict objectForKey:kAccountFieldbill_pobox];
        self.crm_bill_state = [dict objectForKey:kAccountFieldbill_state];
        self.crm_bill_street = [dict objectForKey:kAccountFieldbill_street];
        
        
    }
    
}

@end
