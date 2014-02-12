//
//  ModuleFieldHelper.m
//  ContactiCalVtiger
//
//  Created by Giovanni on 12/02/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import "ModuleFieldHelper.h"

@implementation ModuleFieldHelper

+ (NSString*)localizedLabelForField:(NSString*)fieldName module:(NSString*)moduleName
{
    NSPredicate *mp = [NSPredicate predicateWithFormat:@"service = %@ and crm_name = %@", moduleName];
    Module *m = [Module MR_findFirstWithPredicate:mp];
    NSPredicate *p = [NSPredicate predicateWithFormat:@"crm_name = %@ AND module = %@", fieldName, m];
    CRMField *f = [CRMField MR_findFirstWithPredicate:p];
    return f.crm_label;
}

@end
