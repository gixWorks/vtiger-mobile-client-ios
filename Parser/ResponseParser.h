//
//  Parser.h
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 11/30/13.
//  Copyright (c) 2013 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResponseParser : NSObject

+ (NSDictionary*)parseLogin:(NSDictionary *)JSON saveToDB:(BOOL)save;
+ (NSDictionary*)parseCalendarSync:(NSDictionary*)JSON;
+ (NSDictionary*)parseFetchRecord:(NSDictionary*)JSON;
+ (NSDictionary*)parseFetchRecordWithGrouping:(NSDictionary*)JSON;
+ (NSDictionary*)parseFetchRecordsWithGrouping:(NSDictionary*)JSON forModule:(NSString*)module;
+ (NSDictionary*)parseDescribe:(NSDictionary*)JSON;
+ (NSDictionary*)parseDelete:(NSDictionary*)JSON;
+ (NSDictionary*)parseSaveRecord:(NSDictionary*)JSON tempRecordId:(NSString*)tempRecordId;

@end
