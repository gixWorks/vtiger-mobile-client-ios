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

+ (CRMField *)modelObjectWithDictionary:(NSDictionary*)dict module:(Module*)module
{
    NSString *fieldName = [dict objectForKey:@"name"];
#if DEBUG
    NSLog(@"%@ %@ field: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), fieldName);
#endif
    NSPredicate *p = [NSPredicate predicateWithFormat:@"crm_name = %@ AND module = %@",fieldName, module];
    
    CRMField *instance = [CRMField MR_findFirstWithPredicate:p];
    if (instance == nil) {
        instance = [CRMField MR_createEntity];
    }
    
    instance.crm_name = [dict objectForKey:kCRMFieldName];
    instance.crm_label = [dict objectForKey:kCRMFieldlabel];
    instance.crm_mandatory = [NSNumber numberWithBool:[[dict objectForKey:kCRMFieldmandatory] boolValue]];
//    if ([[dict objectForKey:kCRMFielduitype] isEqualToString:@"<null>"]) {
//        instance.crm_uitype = nil;
//    }else{
//        instance.crm_uitype =  [dict objectForKey:kCRMFielduitype] == nil? nil : [[dict objectForKey:kCRMFielduitype] stringValue];
//    }
    if ([[[dict objectForKey:kCRMFieldtype] objectForKey:@"name" ] isEqualToString:@"picklistValues"]) {
        NSError *jsonError;
        instance.crm_type = @"picklistValues";
        instance.crm_options = [NSJSONSerialization dataWithJSONObject:[dict objectForKey:kCRMFieldtype] options:0 error:&jsonError];
        if (jsonError!=nil) {
            DDLogError(@"%@ %@ error parsing picklist values for field %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), fieldName);
        }
    }
    else{
        instance.crm_type = [[dict objectForKey:kCRMFieldtype] objectForKey:@"name"];
    }
    return instance;
}

@end
