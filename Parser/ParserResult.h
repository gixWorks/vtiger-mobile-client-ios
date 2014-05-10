//
//  ParserResult.h
//  ContactiCalVtiger
//
//  Created by Giovanni on 10/05/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParserResult : NSObject

@property (nonatomic, strong) NSString* resultModule;
@property (nonatomic, strong) NSString* resultErrorMessage;
@property (nonatomic, strong) NSArray* resultRecordIds;

- (id)initWithModule:(NSString*)module errorMessage:(NSString*)errorMessage recordIds:(NSArray*)recordIds;

@end
