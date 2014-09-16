//
//  ParserResult.m
//  ContactiCalVtiger
//
//  Created by Giovanni on 10/05/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import "ParserResult.h"

@implementation ParserResult

- (id)initWithModule:(NSString*)module errorMessage:(NSString*)errorMessage recordIds:(NSArray*)recordIds
{
    self = [super init];
    if (self) {
        self.resultErrorMessage = errorMessage;
        self.resultModule = module;
        self.resultRecordIds = recordIds;
    }
    return self;
}

@end
