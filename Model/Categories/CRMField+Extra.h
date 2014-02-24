//
//  CRMField+Extra.h
//  ContactiCalVtiger
//
//  Created by Giovanni on 09/02/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import "CRMField.h"

@interface CRMField (Extra)

+ (CRMField *)modelObjectWithDictionary:(NSDictionary*)dict module:(Module*)module;

@end
