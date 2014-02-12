//
//  Parser.m
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 11/30/13.
//  Copyright (c) 2013 gixWorks. All rights reserved.
//

#import "ResponseParser.h"
#import "Model.h"
#import "NetworkOperationManager.h"
#import "ModulesHelper.h"
#import "GWLocalNotificationsHelper.h"
#import "CredentialsHelper.h"

//Error Key
NSString* const kErrorKey = @"error";

//Other
NSString* const kMinimumRequiredVersion = @"5.2.0";

@implementation ResponseParser

+ (NSDictionary*)parseLogin:(NSDictionary *)JSON saveToDB:(BOOL)save
{
    NSMutableDictionary *parseResult = [[NSMutableDictionary alloc] init];
    /*
     Structure of returned result is: @ { "@error" : @{@"message" : ... the message ...} }
     */
    __block NSString *version;
    __block NSString *mobile_version;
    __block NSString *userid;
    
    version = [[[JSON valueForKeyPath:@"result"] valueForKeyPath:@"login"] valueForKeyPath:@"vtiger_version"] ;
    mobile_version = [[[JSON valueForKeyPath:@"result"] valueForKeyPath:@"login"] valueForKeyPath:@"mobile_module_version"] ;
    userid = [[[JSON valueForKeyPath:@"result"] valueForKeyPath:@"login"] valueForKeyPath:@"userid"] ;
    @try {
        if ([kMinimumRequiredVersion compare:version options:NSNumericSearch] == NSOrderedDescending) {
            // actualVersion is lower than the requiredVersion
            NSString *message = [NSString stringWithFormat:NSLocalizedString(@"vTiger Version (%@) lower than minimum required (%@)", @"vTiger Version (%@) lower than minimum required (%@) "), version, kMinimumRequiredVersion];
            NSDictionary *errorInfo = [NSDictionary dictionaryWithObjectsAndKeys:message, @"message", nil];
            [parseResult setObject:errorInfo forKey:kErrorKey];
            return parseResult;
        }
        else if(!mobile_version)
        {
            // actualVersion is lower than the requiredVersion
            NSDictionary *errorInfo = [NSDictionary dictionaryWithObjectsAndKeys:NSLocalizedString(@"Mobile Module Not Installed", @"Mobile Module Not Installed "), @"message", nil];
            [parseResult setObject:errorInfo forKey:kErrorKey];
            return  parseResult;
        }
        else {
            //Everything is OK
            
            if ([userid length] < 1) {
                @throw [NSException exceptionWithName:@"userid cannot be nil!" reason:@"userid cannot be nil!" userInfo:nil];
            }
            [parseResult setObject:userid forKey:@"userid"];
            
            
            //Get info about timezones for server and user
            NSString *timezoneServer = [JSON valueForKeyPath:@"result.crm_tz"];
            if (timezoneServer == nil) {
                timezoneServer = [[NSTimeZone defaultTimeZone] name];
            }
            else{
                NSTimeZone *tz = [NSTimeZone timeZoneWithAbbreviation:timezoneServer];
                timezoneServer = [tz name];
            }
            [parseResult setObject:timezoneServer forKey:@"crm_tz"];
            
            NSString *timezoneUser = [JSON valueForKeyPath:@"result.user_tz"];
            if (timezoneUser == nil) {
                timezoneUser = [[NSTimeZone defaultTimeZone] name];
            }
            else{
                NSTimeZone *tz = [NSTimeZone timeZoneWithAbbreviation:timezoneUser];
                timezoneUser = [tz name];
            }
            [parseResult setObject:timezoneUser forKey:@"user_tz"];
            
            NSString* session = [JSON valueForKeyPath:@"result.session"];
            if (session != nil && save == YES){
                [CredentialsHelper saveSession:session];
            }
            
            //Check if we have some modules
            //Loop through the modules in the returned JSON
            NSArray *modules = [JSON valueForKeyPath:@"result.modules"];
            if (modules != nil) {
                for (NSDictionary *module in modules) {
                    [Module modelObjectWithDictionary:module]; //it's already added to context
                }
//                [modules enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
//                    NSDictionary *field = (NSDictionary*)obj;
//                    [Module modelObjectWithDictionary:field]; //Should already add to Context
//                }];                
            }
            
            if(save == YES){
                //Finally I save
                //Save the record in the datasource
#if DEBUG
            NSLog(@"%@ saving to persistent storage", NSStringFromSelector(_cmd));
#endif
                [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
            }
        }
    }
    @catch (NSException *exception) {
        NSLog(@"%@ %@ Exception: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [exception description]);
        [parseResult setObject:[exception description] forKey:kErrorKey];
    }
    return parseResult;
}

+ (NSDictionary*)parseCalendarSync:(NSDictionary *)JSON
{
    @try {
        BOOL success = [[JSON objectForKey:@"success"] boolValue];
        NSDictionary *sync = [JSON valueForKeyPath:@"result.sync"];
        NSString *nextSyncToken;
        if ([[sync objectForKey:@"nextSyncToken"] isKindOfClass:[NSString class]]) {
            nextSyncToken = [sync objectForKey:@"nextSyncToken"];
        }
        else{
            nextSyncToken = [[sync objectForKey:@"nextSyncToken"] stringValue];
        }
        NSArray *deletedRecords = [sync objectForKey:@"deleted"];
        NSArray *updatedRecords = [sync objectForKey:@"updated"];
        NSInteger nextPage = [[sync objectForKey:@"nextPage"] integerValue];
#if DEBUG
        NSLog(@"%@ Deleted Records: %ld Updated Records: %ld", NSStringFromSelector(_cmd), (unsigned long)[deletedRecords count], (unsigned long)[updatedRecords count]);
#endif
        if (success != YES) {
            NSDictionary *error = [JSON objectForKey:kErrorKey];
            return [NSDictionary dictionaryWithObjectsAndKeys:error, kErrorKey, nil];
        }
        
        //1- Do something with the synctoken, save it in AppData
        //...
        //2- Go through the deleted records, get the IDs and remove them from database
        //...
        //3- Go through the updated records, create entities and save them
        
        for (NSDictionary* entity in updatedRecords) { //Main loop, we are going through each entitiy
            //A- Prepare the main elements of each record: the identifier and the blocks
            NSString *identifier = [entity objectForKey:@"id"];
            NSArray *blocks = [entity objectForKey:@"blocks"];
            NSMutableDictionary *entityFields = [[NSMutableDictionary alloc] init];
            NSMutableDictionary *entityCustomFields = [[NSMutableDictionary alloc] init];
            [entityFields setObject:identifier forKey:@"id"];
            for (NSDictionary* block in blocks) {
                //This is the loop for each block of fields
                NSArray *fields = [block objectForKey:@"fields"];
                for (NSDictionary* field in fields) {
                    //C- Extract all the fields from the returned JSON
                    NSString* fieldName = [field objectForKey:@"name"];
                    [entityFields setObject:[field objectForKey:@"value"] forKey:fieldName];
                    //C1- Parse Custom Fields
                    if ([fieldName hasPrefix:@"cf_"]) { //means it's a custom field
                        [entityCustomFields setObject:field forKey:fieldName];
                    }
                }
            }
            //D - create the item, using the fields from the Dictionary. The item is already added to persistent storage.
            Activity *a = [Activity modelObjectWithDictionary:entityFields customFields:entityCustomFields];
            
            //D1 - Remove existing notification and schedule a new one (we don't know if the event time has changed or if it's a new item)
                [GWLocalNotificationsHelper unscheduleNotificationForRecordId:a.crm_id];
                [GWLocalNotificationsHelper scheduleNotificationWithItem:a interval:15];
            
        }   //end main loop
        
        //E- Parse through Deleted Records, which is just an Array of record IDs
        for (NSString* identifier in deletedRecords) {
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"crm_id = %@",identifier];
            [Activity MR_deleteAllMatchingPredicate:predicate];
            [GWLocalNotificationsHelper unscheduleNotificationForRecordId:identifier];
        }
        
        //F- Save to Core Data (or whatever) the array of items
#if DEBUG
        NSLog(@"%@ saving to persistent storage", NSStringFromSelector(_cmd));
#endif
        __block NSError *saveError;
//        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
//            saveError = error;
//        }];
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        
        //G- if nextPage != 0 means that we have another page of records to sync
        if (nextPage != 0) {
            [[NetworkOperationManager sharedInstance] syncCalendarFromPage:[NSNumber numberWithInteger:nextPage]];
        }
        
        //H- If Save went OK, set the next synctoken
        if (saveError == nil) {
            SyncToken *token = [SyncToken MR_createEntity];
            token.token = nextSyncToken;
            token.module = kVTModuleCalendar;
            token.datetime = [NSDate date];
            [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        }
        
        return [NSDictionary dictionaryWithObjectsAndKeys:saveError,kErrorKey, nil];
    }
    @catch (NSException *exception) {
        return [NSDictionary dictionaryWithObject:[exception description] forKey:kErrorKey];
    }
}

+ (NSDictionary*)parseFetchRecord:(NSDictionary*)JSON
{
    @try {
        NSManagedObject *returnedRecord = nil;
        BOOL success = [[JSON objectForKey:@"success"] boolValue];
        if (success != YES) {
            NSDictionary *error = [JSON objectForKey:kErrorKey];
            return [NSDictionary dictionaryWithObjectsAndKeys:error, kErrorKey, nil];
        }
        
        NSDictionary *record = [JSON valueForKeyPath:@"result.record"];
        //Record already contains the field in Key-Value format
        
        //To create the new entity, we need to decode the type
        NSString *identifier = [record objectForKey:@"id"];
        NSString *module = [ModulesHelper decodeModuleForRecordId:identifier];
#if DEBUG
        NSLog(@"%@ parsing %@ record %@", NSStringFromSelector(_cmd), module, identifier);
#endif
        if ([module isEqualToString:kVTModuleCalendar]) {
            returnedRecord = [Activity modelObjectWithDictionary:record];
        }
        else if([module isEqualToString:kVTModuleAccounts]){
            returnedRecord = [Account modelObjectWithDictionary:record];
        }
        else if([module isEqualToString:kVTModuleContacts]){
            returnedRecord = [Contact modelObjectWithDictionary:record];
        }
        else if([module isEqualToString:kVTModuleLeads]){
            returnedRecord = [Lead modelObjectWithDictionary:record customFields:nil];
        }
        else if([module isEqualToString:kVTModulePotentials]){
            returnedRecord = [Potential modelObjectWithDictionary:record];
        }
        else if([module isEqualToString:kVTModuleHelpDesk]){
            returnedRecord = [Ticket modelObjectWithDictionary:record];
        }
        else if([module isEqualToString:kVTModuleProducts]){
            returnedRecord = [Product modelObjectWithDictionary:record];
        }
        else{
            NSDictionary* userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:[NSString stringWithFormat:@"%@ %@ No Module Handler found for record %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), identifier], kErrorKey, nil];
            return  userInfo;
        }
        
        //Save the record in the datasource
#if DEBUG
        NSLog(@"%@ saving to persistent storage", NSStringFromSelector(_cmd));
#endif
        __block NSError *saveError;
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
            saveError = error;
        }];
        
        NSDictionary* userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:identifier, @"record", saveError, kErrorKey, nil];
        return userInfo;
    }
    @catch (NSException *exception) {
        return [NSDictionary dictionaryWithObject:[exception description] forKey:kErrorKey];
    }
}

+ (NSDictionary*)parseFetchRecordWithGrouping:(NSDictionary*)JSON
{
    @try {
        NSManagedObject *returnedRecord = nil;
        BOOL success = [[JSON objectForKey:@"success"] boolValue];
        if (success != YES) {
            NSDictionary *error = [JSON objectForKey:kErrorKey];
            return [NSDictionary dictionaryWithObjectsAndKeys:error, kErrorKey, nil];
        }
        
        NSDictionary *record = [JSON valueForKeyPath:@"result.record"];
        //Record contains the fields in Blocks
        //A- Prepare the main elements of each record: the identifier and the blocks
        NSString *identifier = [record objectForKey:@"id"];
        NSArray *blocks = [record objectForKey:@"blocks"];
#if DEBUG
        NSLog(@"%@ parsing record %@", NSStringFromSelector(_cmd), identifier);
#endif
        //B- prepare a dictionary to contain the values that will be stored in the Entity properties
        NSMutableDictionary *entityFields = [[NSMutableDictionary alloc] init];
        NSMutableDictionary *entityCustomFields = [[NSMutableDictionary alloc] init];
        [entityFields setObject:identifier forKey:@"id"];
        for (NSDictionary *block in blocks) {
            NSArray *fields = [block objectForKey:@"fields"];
            for (NSDictionary *field in fields) {
                //C- Extract all the fields from the returned JSON
                NSString* fieldName = [field objectForKey:@"name"];
                [entityFields setObject:[field objectForKey:@"value"] forKey:fieldName];
                //C1- Parse Custom Fields
                if ([fieldName hasPrefix:@"cf_"]) { //means it's a custom field
                    [entityCustomFields setObject:field forKey:fieldName];
                }
            }
        }
        
        //To create the new entity, we need to decode the type
        NSString *module = [ModulesHelper decodeModuleForRecordId:identifier];
        if ([module isEqualToString:kVTModuleCalendar]) {
            returnedRecord = [Activity modelObjectWithDictionary:entityFields customFields:entityCustomFields];
        }
        else if([module isEqualToString:kVTModuleAccounts]){
            returnedRecord = [Account modelObjectWithDictionary:entityFields];
        }
        else if([module isEqualToString:kVTModuleContacts]){
            returnedRecord = [Contact modelObjectWithDictionary:entityFields];
        }
        else if([module isEqualToString:kVTModuleLeads]){
            returnedRecord = [Lead modelObjectWithDictionary:entityFields customFields:entityCustomFields];
        }
        else if([module isEqualToString:kVTModulePotentials]){
            returnedRecord = [Potential modelObjectWithDictionary:entityFields];
        }
        else if([module isEqualToString:kVTModuleHelpDesk]){
            returnedRecord = [Ticket modelObjectWithDictionary:entityFields];
        }
        else if([module isEqualToString:kVTModuleProducts]){
            returnedRecord = [Product modelObjectWithDictionary:entityFields];
        }
        else{
            NSDictionary* userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:[NSString stringWithFormat:@"%@ %@ No Module Handler found for record %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), identifier], kErrorKey, nil];
            return  userInfo;
        }
        
        //Save the record in the datasource
        __block NSError *saveError;
#if DEBUG
        NSLog(@"%@ saving to persistent storage", NSStringFromSelector(_cmd));
#endif
//        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
//            saveError = error;
//        }];
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        
        NSDictionary* userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:identifier, @"record", saveError, kErrorKey, nil];
        return userInfo;
    }
    @catch (NSException *exception) {
        return [NSDictionary dictionaryWithObject:[exception description] forKey:kErrorKey];
    }
}

+ (NSDictionary*)parseFetchRecordsWithGrouping:(NSDictionary*)JSON forModule:(NSString*)module
{
    @try {
        BOOL success = [[JSON objectForKey:@"success"] boolValue];
        NSArray *records = [JSON valueForKeyPath:@"result.records"];
#if DEBUG
        NSLog(@"%@ parsing %d records for module %@", NSStringFromSelector(_cmd), [records count], module);
#endif
        
        if (success != YES) {
            NSDictionary *error = [JSON objectForKey:kErrorKey];
            return [NSDictionary dictionaryWithObjectsAndKeys:error, kErrorKey, nil];
        }
        NSMutableArray *identifiers = [[NSMutableArray alloc] init];
        //Go through the records
        for (NSDictionary *entity in records) { //Main loop, we are going through each entitiy
            //A- Prepare the main elements of each record: the identifier and the blocks
            NSString *identifier = [entity objectForKey:@"id"];
            [identifiers addObject:identifier];
#if DEBUG
            NSLog(@"%@ parsing %@ record: %@", NSStringFromSelector(_cmd), module, identifier);
#endif
            NSArray *blocks = [entity objectForKey:@"blocks"];
            //B- prepare a dictionary to contain the values that will be stored in the Entity properties
            NSMutableDictionary *entityFields = [[NSMutableDictionary alloc] init];
            NSMutableDictionary *entityCustomFields = [[NSMutableDictionary alloc] init];
            [entityFields setObject:identifier forKey:@"id"];
            for (NSDictionary *block in blocks) {
                NSArray *fields = [block objectForKey:@"fields"];
                for (NSDictionary *field in fields) {
                    //C- Extract all the fields from the returned JSON
                    NSString* fieldName = [field objectForKey:@"name"];
                    [entityFields setObject:[field objectForKey:@"value"] forKey:fieldName];
                    //C1- Parse Custom Fields
                    if ([fieldName hasPrefix:@"cf_"]) { //means it's a custom field
                        [entityCustomFields setObject:field forKey:fieldName];
                    }
                }
            }
            //D - create the items starting from the dictionary
            if ([module isEqualToString:kVTModuleCalendar]) {
                [Activity modelObjectWithDictionary:entityFields customFields:entityCustomFields];
            }
            else if ([module isEqualToString:kVTModuleAccounts]) {
                [Account modelObjectWithDictionary:entityFields];
            }
            else if ([module isEqualToString:kVTModuleContacts]) {
                [Contact modelObjectWithDictionary:entityFields];
            }
            else if ([module isEqualToString:kVTModuleLeads]) {
                [Lead modelObjectWithDictionary:entityFields customFields:entityCustomFields];
            }
            else if ([module isEqualToString:kVTModulePotentials]) {
                [Potential modelObjectWithDictionary:entityFields];
            }
            else if ([module isEqualToString:kVTModuleHelpDesk]) {
                [Ticket modelObjectWithDictionary:entityFields];
            }
            else if ([module isEqualToString:kVTModuleProducts]) {
                [Product modelObjectWithDictionary:entityFields];
            }
            else{
                NSDictionary* userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:[NSString stringWithFormat:@"%@ %@ No Module Handler found for record %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), identifier], kErrorKey, nil];
                return  userInfo;
            }
        }
        
        //E- Save to Core Data (or whatever) the array of items
#if DEBUG
        NSLog(@"%@ saving to persistent storage", NSStringFromSelector(_cmd));
#endif
        __block NSError *saveError;
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
            saveError = error;
        }];
        return [NSDictionary dictionaryWithObjectsAndKeys:identifiers,@"record",saveError,kErrorKey, nil];
    }
    @catch (NSException *exception) {
        return [NSDictionary dictionaryWithObject:[exception description] forKey:kErrorKey];
    }
}

+ (NSDictionary*)parseDescribe:(NSDictionary*)JSON
{
    @try {
        BOOL success = [[JSON objectForKey:@"success"] boolValue];
        if (success != YES) {
            return @{kErrorKey : [[JSON objectForKey:@"error"] objectForKey:@"message"]};
        }
        NSDictionary *moduleDescription = [JSON valueForKeyPath:@"result.describe"];
        NSString *moduleName = [moduleDescription objectForKey:@"name"];
        
        Module *m = [Module MR_findFirstByAttribute:@"service" withValue:[Service getActive]];
        BOOL result = [m setDescriptionWithDictionary:moduleDescription];
        if (result == NO) {
            NSLog(@"%@ %@ failed to create fields for module %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), moduleName);
        }
#if DEBUG
        NSLog(@"%@ saving to persistent storage", NSStringFromSelector(_cmd));
#endif
        __block NSError *saveError;
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
            saveError = error;
        }];
        return [NSDictionary dictionaryWithObjectsAndKeys:moduleName,@"record",saveError,kErrorKey, nil];
    }
    @catch (NSException *exception) {
        return [NSDictionary dictionaryWithObject:[exception description] forKey:kErrorKey];
    }
}

@end
