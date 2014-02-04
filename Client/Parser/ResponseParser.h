//
//  Parser.h
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 11/30/13.
//  Copyright (c) 2013 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

//Module constants
extern NSString* const kVTModuleCalendar;
extern NSString* const kVTModuleLeads;
extern NSString* const kVTModuleAccounts;
extern NSString* const kVTModuleContacts;
extern NSString* const kVTModulePotentials;
extern NSString* const kVTModuleHelpDesk;

@interface ResponseParser : NSObject

+ (NSDictionary*)parseLogin:(NSDictionary*)JSON;
+ (NSDictionary*)parseCalendarSync:(NSDictionary*)JSON;
+ (NSDictionary*)parseFetchRecord:(NSDictionary*)JSON;
+ (NSDictionary*)parseFetchRecordsWithGrouping:(NSDictionary*)JSON forModule:(NSString*)module;


@end
