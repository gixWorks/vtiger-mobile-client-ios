//
//  Parser.h
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 11/30/13.
//  Copyright (c) 2013 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResponseParser : NSObject

+ (NSDictionary*)parseLogin:(NSDictionary*)JSON;
+ (NSDictionary*)parseCalendarSync:(NSDictionary*)JSON;
+ (NSDictionary*)parseFetchRecord:(NSDictionary*)JSON;
+ (NSDictionary*)parseFetchRecordsWithGrouping:(NSDictionary*)JSON forModule:(NSString*)module;


@end
