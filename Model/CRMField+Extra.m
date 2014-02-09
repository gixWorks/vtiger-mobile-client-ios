//
//  CRMField+Extra.m
//  ContactiCalVtiger
//
//  Created by Giovanni on 09/02/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import "CRMField+Extra.h"
#import "CRMFieldConstants.h"

@implementation CRMField (Extra)

+ (CRMField *)modelObjectWithDictionary:(NSDictionary*)dict
{
    NSString *fieldName = [dict objectForKey:@"name"];
    NSPredicate *p = [NSPredicate predicateWithFormat:@"name = %@",fieldName];
    
    
    CRMField *instance = [CRMField MR_findFirstWithPredicate:p];
    if (instance == nil) {
        instance = [CRMField MR_createEntity];
    }
    
    instance.crm_name = [dict objectForKey:kCRMFieldName];
    instance.crm_label = [dict objectForKey:kCRMFieldlabel];
    instance.crm_mandatory = [dict objectForKey:kCRMFieldmandatory];
    if ([[dict objectForKey:kCRMFieldtype] isEqualToString:@"picklistValues"]) {
        NSError *jsonError;
        instance.crm_options = [NSJSONSerialization dataWithJSONObject:[dict objectForKey:kCRMFieldtype] options:0 error:&jsonError];
        if (jsonError!=nil) {
            NSLog(@"%@ %@ error parsing picklist values for field %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), fieldName);
        }
    }
    else{
        instance.crm_type = [[dict objectForKey:kCRMFieldtype] objectForKey:@"name"];
    }
    return instance;
}

@end
