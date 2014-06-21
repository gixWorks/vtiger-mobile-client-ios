//
//  Parser.m
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 11/30/13.
//  Copyright (c) 2013 gixWorks. All rights reserved.
//

#import "ResponseParser.h"
#import "Model.h"
#import "CRMClient.h"
#import "ModulesHelper.h"
#import "GWNotificationNames.h"
#import "CredentialsHelper.h"
#import "CRMFieldConstants.h"
#import "CRMConstants.h"
#import "ParserResult.h"

@interface ResponseParser ()

+ (NSDictionary*) parseFetchRecordWithGrouping:(NSDictionary*)JSON andUpdateRecord:(NSString*)tempRecordId;

@end

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
            NSString *timezoneServer = [JSON valueForKeyPath:@"result.login.crm_tz"];
            if ([timezoneServer isKindOfClass:[NSNull class]]) {
                timezoneServer = [[NSTimeZone defaultTimeZone] name];
            }
            else{
                NSTimeZone *tz = [NSTimeZone timeZoneWithName:timezoneServer];
                timezoneServer = [tz name];
            }
            [parseResult setObject:timezoneServer forKey:@"crm_tz"];
            
            NSString *timezoneUser = [JSON valueForKeyPath:@"result.login.user_tz"];
            if ([timezoneUser isKindOfClass:[NSNull class]]) {
                timezoneUser = [[NSTimeZone defaultTimeZone] name];
            }
            else{
                NSTimeZone *tz = [NSTimeZone timeZoneWithName:timezoneUser];
                timezoneUser = [tz name];
            }
            [parseResult setObject:timezoneUser forKey:@"user_tz"];
            
            NSString* session = [JSON valueForKeyPath:@"result.login.session"];
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
                __block NSError *saveError;
                [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
                    saveError = error;
                }];
            }
        }
    }
    @catch (NSException *exception) {
        DDLogError(@"%@ %@ Exception: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [exception description]);
        [parseResult setObject:[exception description] forKey:kErrorKey];
    }
    return parseResult;
}

+ (NSDictionary*)parseSync:(NSDictionary*)JSON moduleName:(NSString*)module
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
            NSManagedObject *returnedRecord;
            if ([module isEqualToString:kVTModuleCalendar]) {
                returnedRecord = [Activity modelObjectWithDictionary:entityFields];
                //D1 - Remove existing notification and schedule a new one (we don't know if the event time has changed or if it's a new item)
                [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationRescheduleNotification object:self userInfo:@{kNotificationUserInfoActivity: (Activity*)returnedRecord}];
            }
            else if([module isEqualToString:kVTModuleAccounts]){
                returnedRecord = [Account modelObjectWithDictionary:entityFields customFields:entityCustomFields];
            }
            else if([module isEqualToString:kVTModuleContacts]){
                returnedRecord = [Contact modelObjectWithDictionary:entityFields customFields:entityCustomFields];
            }
            else if([module isEqualToString:kVTModuleLeads]){
                returnedRecord = [Lead modelObjectWithDictionary:entityFields customFields:entityCustomFields];
            }
            else if([module isEqualToString:kVTModulePotentials]){
                returnedRecord = [Potential modelObjectWithDictionary:entityFields];
            }
            else if([module isEqualToString:kVTModuleHelpDesk]){
                returnedRecord = [Ticket modelObjectWithDictionary:entityFields customFields:entityCustomFields];
            }
            else if([module isEqualToString:kVTModuleProducts]){
                returnedRecord = [Product modelObjectWithDictionary:entityFields];
            }
            else if([module isEqualToString:kVTModuleCampaigns]){
                returnedRecord = [Campaign modelObjectWithDictionary:entityFields customFields:entityCustomFields];
            }
            else{
                NSDictionary* userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:[NSString stringWithFormat:@"%@ %@ No Module Handler found for record %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), identifier], kErrorKey, nil];
                return  userInfo;
            }
            
            
        }   //end main loop
        
        //E- Parse through Deleted Records, which is just an Array of record IDs
        for (NSString* identifier in deletedRecords) {
            if ([module isEqualToString:kVTModuleCalendar]) {
                NSPredicate *predicate = [NSPredicate predicateWithFormat:@"crm_id = %@",identifier];
                [Activity MR_deleteAllMatchingPredicate:predicate];
                [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationUnscheduleNotificationForRecord object:self userInfo:@{kNotificationUserInfoRecordId: identifier}];
            }
            else if([module isEqualToString:kVTModuleAccounts]){
                NSPredicate *predicate = [NSPredicate predicateWithFormat:@"crm_id = %@",identifier];
                [Account MR_deleteAllMatchingPredicate:predicate];
            }
            else if([module isEqualToString:kVTModuleContacts]){
                NSPredicate *predicate = [NSPredicate predicateWithFormat:@"crm_id = %@",identifier];
                [Account MR_deleteAllMatchingPredicate:predicate];
            }
            else if([module isEqualToString:kVTModuleLeads]){
                NSPredicate *predicate = [NSPredicate predicateWithFormat:@"lead_leadid = %@",identifier];
                [Lead MR_deleteAllMatchingPredicate:predicate];
            }
            else if([module isEqualToString:kVTModulePotentials]){
                NSPredicate *predicate = [NSPredicate predicateWithFormat:@"crm_id = %@",identifier];
                [Potential MR_deleteAllMatchingPredicate:predicate];
            }
            else if([module isEqualToString:kVTModuleHelpDesk]){
                NSPredicate *predicate = [NSPredicate predicateWithFormat:@"crm_id = %@",identifier];
                [Ticket MR_deleteAllMatchingPredicate:predicate];
            }
            else if([module isEqualToString:kVTModuleProducts]){
                NSPredicate *predicate = [NSPredicate predicateWithFormat:@"crm_id = %@",identifier];
                [Product MR_deleteAllMatchingPredicate:predicate];
            }
        }
        
        //F- Save to Core Data (or whatever) the array of items
#if DEBUG
        NSLog(@"%@ saving to persistent storage", NSStringFromSelector(_cmd));
#endif
        __block NSError *saveError;
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
            saveError = error;
        }];
        
        //G- if nextPage != 0 means that we have another page of records to sync
        if (nextPage != 0) {
            [[CRMClient sharedInstance] syncModule:module fromPage:[NSNumber numberWithInteger:nextPage]];
        }
        else{
            //I save the synctoken only if we don't have the next page (it's the last page of the sync)
            //H- If Save went OK, set the next synctoken
            if (saveError == nil) {
                SyncToken *token = [SyncToken MR_createEntity];
                token.token = nextSyncToken;
                token.module = module;
                token.datetime = [NSDate date];
                token.service = [Service getActive];
                [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
            }
        }
        
        return [NSDictionary dictionaryWithObjectsAndKeys:saveError,kErrorKey, nil];
    }
    @catch (NSException *exception) {
        return [NSDictionary dictionaryWithObject:[exception description] forKey:kErrorKey];
    }
}

+ (NSDictionary*)parseCalendarSync:(NSDictionary *)JSON requestParameters:(NSDictionary*)parameters
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
            return [NSDictionary dictionaryWithObjectsAndKeys:@(YES), @"syncHasFinished",error, kErrorKey, nil];
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
            if (a != nil) {
                [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationRescheduleNotification object:self userInfo:@{kNotificationUserInfoActivity: a}];
            }

        }   //end main loop
        
        //E- Parse through Deleted Records, which is just an Array of record IDs
        for (NSString* identifier in deletedRecords) {
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"crm_id = %@",identifier];
            [Activity MR_deleteAllMatchingPredicate:predicate];
            [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationUnscheduleNotificationForRecord object:self userInfo:@{kNotificationUserInfoRecordId: identifier}];
        }
        
        //F- Save to Core Data (or whatever) the array of items
#if DEBUG
        NSLog(@"%@ saving to persistent storage", NSStringFromSelector(_cmd));
#endif
        __block NSError *saveError;
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
            saveError = error;
        }];
        
        BOOL syncHasFinished = YES;
        //G- if nextPage != 0 means that we have another page of records to sync
        if (nextPage != 0) {
            [[CRMClient sharedInstance] syncCalendarFromPage:[NSNumber numberWithInteger:nextPage]];
            syncHasFinished = NO;
        }
        else{
            //H- If Save went OK, set the next synctoken
            if (saveError == nil) {
                NSString *lastUsedToken = [parameters objectForKey:@"syncToken"];
                
                if (![nextSyncToken isEqualToString:lastUsedToken] && ([deletedRecords count] != 0 || [updatedRecords count] != 0)) {
                    //If nextSyncToken != "" then it means that there were some records in the current result. In case there were no record updated, Vtiger returns the same syncToken that was sent previously
                    //Since Vtiger does not return the right nextPage number, we need to address this issue and try to increase the nextPage number and sync again
                    SyncToken *token = [SyncToken MR_createEntity];
                    token.token = nextSyncToken;
                    token.module = kVTModuleCalendar;
                    token.datetime = [NSDate date];
                    token.service = [Service getActive];
                    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
                    
                    //We increase the page from the previous request and try to sync more records
                    [[CRMClient sharedInstance] syncCalendarFromPage:@([[parameters objectForKey:@"page"] integerValue]+1) token:lastUsedToken];
                    syncHasFinished = NO;
                }
                else if ([nextSyncToken isEqualToString:lastUsedToken] && [deletedRecords count] == 0 && [updatedRecords count] == 0)
                {
                    //Sync is over
                    //TODO: have a look again with clear mind
                    if (![nextSyncToken isEqualToString:@""]) {
                        SyncToken *token = [SyncToken MR_createEntity];
                        token.token = nextSyncToken;
                        token.module = kVTModuleCalendar;
                        token.datetime = [NSDate date];
                        token.service = [Service getActive];
                        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
                    }
                }
                //We should not get here
            }
        }
        
        return [NSDictionary dictionaryWithObjectsAndKeys: @(syncHasFinished), @"syncHasFinished", saveError,kErrorKey,nil];
    }
    @catch (NSException *exception) {
        return [NSDictionary dictionaryWithObjectsAndKeys: @(YES), @"syncHasFinished",[exception description], kErrorKey, nil];
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
            returnedRecord = [Account modelObjectWithDictionary:record customFields:nil];
        }
        else if([module isEqualToString:kVTModuleContacts]){
            returnedRecord = [Contact modelObjectWithDictionary:record customFields:nil];
        }
        else if([module isEqualToString:kVTModuleLeads]){
            returnedRecord = [Lead modelObjectWithDictionary:record customFields:nil];
        }
        else if([module isEqualToString:kVTModulePotentials]){
            returnedRecord = [Potential modelObjectWithDictionary:record];
        }
        else if([module isEqualToString:kVTModuleHelpDesk]){
            returnedRecord = [Ticket modelObjectWithDictionary:record customFields:nil];
        }
        else if([module isEqualToString:kVTModuleProducts]){
            returnedRecord = [Product modelObjectWithDictionary:record];
        }
        else if([module isEqualToString:kVTModuleCampaigns]){
            returnedRecord = [Campaign modelObjectWithDictionary:record customFields:nil];
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

+ (NSDictionary*) parseFetchRecordWithGrouping:(NSDictionary*)JSON andUpdateRecord:(NSString*)tempRecordId
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
            if(tempRecordId != nil){
                Activity *a = [Activity MR_findFirstByAttribute:@"crm_id" withValue:tempRecordId];
                [a updateModelObjectWithDictionary:entityFields customFields:entityCustomFields];
                returnedRecord = a;
            }
            else{
            returnedRecord = [Activity modelObjectWithDictionary:entityFields customFields:entityCustomFields];
            }
        }
        else if([module isEqualToString:kVTModuleAccounts]){
            returnedRecord = [Account modelObjectWithDictionary:entityFields customFields:entityCustomFields];
        }
        else if([module isEqualToString:kVTModuleContacts]){
            returnedRecord = [Contact modelObjectWithDictionary:entityFields customFields:entityCustomFields];
        }
        else if([module isEqualToString:kVTModuleLeads]){
            returnedRecord = [Lead modelObjectWithDictionary:entityFields customFields:entityCustomFields];
        }
        else if([module isEqualToString:kVTModulePotentials]){
            returnedRecord = [Potential modelObjectWithDictionary:entityFields];
        }
        else if([module isEqualToString:kVTModuleHelpDesk]){
            returnedRecord = [Ticket modelObjectWithDictionary:entityFields customFields:entityCustomFields];
        }
        else if([module isEqualToString:kVTModuleProducts]){
            returnedRecord = [Product modelObjectWithDictionary:entityFields];
        }
        else if([module isEqualToString:kVTModuleCampaigns]){
            returnedRecord = [Campaign modelObjectWithDictionary:entityFields customFields:entityCustomFields];
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
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
            saveError = error;
        }];
        
        NSDictionary* userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:identifier, @"record", module, @"module", saveError, kErrorKey, nil];
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
        NSLog(@"%@ parsing %lu records for module %@", NSStringFromSelector(_cmd), (unsigned long)[records count], module);
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
                [Account modelObjectWithDictionary:entityFields customFields:entityCustomFields];
            }
            else if ([module isEqualToString:kVTModuleContacts]) {
                [Contact modelObjectWithDictionary:entityFields customFields:entityCustomFields];
            }
            else if ([module isEqualToString:kVTModuleLeads]) {
                [Lead modelObjectWithDictionary:entityFields customFields:entityCustomFields];
            }
            else if ([module isEqualToString:kVTModulePotentials]) {
                [Potential modelObjectWithDictionary:entityFields];
            }
            else if ([module isEqualToString:kVTModuleHelpDesk]) {
                [Ticket modelObjectWithDictionary:entityFields customFields:entityCustomFields];
            }
            else if ([module isEqualToString:kVTModuleProducts]) {
                [Product modelObjectWithDictionary:entityFields];
            }
            else if([module isEqualToString:kVTModuleCampaigns]){
                [Campaign modelObjectWithDictionary:entityFields customFields:entityCustomFields];
            }
            else if ([module isEqualToString:kVTModuleDocuments]) {
                //TODO: DOCUMENT MODEL!!!!
                //                [Document modelObjectWithDictionary:entityFields];
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

+ (NSDictionary*)parseFetchRecordWithGrouping:(NSDictionary*)JSON
{
    return [self parseFetchRecordWithGrouping:JSON andUpdateRecord:nil];
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
        NSPredicate *p = [NSPredicate predicateWithFormat:@"crm_name = %@ AND service = %@", moduleName, [Service getActive]];
        
        Module *m = [Module MR_findFirstWithPredicate:p];
        BOOL result = [m setDescriptionWithDictionary:moduleDescription];
        if (result == NO) {
            DDLogError(@"%@ %@ failed to create fields for module %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), moduleName);
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

+ (NSDictionary*)parseDelete:(NSDictionary*)JSON
{
    DDLogDebug(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    BOOL success = [[JSON valueForKey:@"success"] boolValue];
    if (NO == success) {
        return @{@"error" : [JSON valueForKeyPath:@"error.message"]};
    }
    id deletedRecords = [JSON valueForKeyPath:@"result.deleted"];
    if ([deletedRecords isKindOfClass:[NSArray class]]) {
        //it's an Array. This usually happens when the deleted records are empty
        //We can afford removing the records to be deleted from ModifiedRecords
        NSPredicate *p = [NSPredicate predicateWithFormat:@"crm_action = %@", kModifiedRecordActionDELETE];
        [ModifiedRecord MR_deleteAllMatchingPredicate:p];
    }
    else if([deletedRecords isKindOfClass:[NSDictionary class]]){
        NSArray *deletedIds = [deletedRecords allKeys];
        for (NSString *i in deletedIds) {
            BOOL suc = [[deletedRecords objectForKey:i] boolValue];
            if (suc == YES) { //that record has been deleted remotely
                //Delete the Record locally on the database
                [[ModifiedRecord MR_findFirstByAttribute:@"crm_id" withValue:i] MR_deleteEntity];
                //And delete it from the ModifiedRecords
                ModifiedRecord *mr = [ModifiedRecord MR_findFirstByAttribute:@"crm_id" withValue:i];
                [mr MR_deleteEntity];
            }
        }
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    }
    else{
        DDLogWarn(@"%@ %@ - DeleteRecords returned an unknown value", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    }
    return @{};
}

+ (NSDictionary*)parseSaveRecord:(NSDictionary*)JSON tempRecordId:(NSString*)tempRecordId
{
    BOOL success = [[JSON valueForKey:@"success"] boolValue];
    if (NO == success) {
        return @{@"error" : [JSON valueForKeyPath:@"error.message"]};
    }
    BOOL isNewRecord = NO;
    if ([tempRecordId rangeOfString:@"-"].location != NSNotFound) {
        //if the record id is in the structure 1x4345-5445-54554-445 it's been created with CFUUID which means it's a new record
        isNewRecord = YES;
    }
    
    NSDictionary *resultRecordParse = [self parseFetchRecordWithGrouping:JSON andUpdateRecord:tempRecordId];
    if ([resultRecordParse objectForKey:kErrorKey] == nil) {
        //means the record was correctly parsed
        if (isNewRecord == YES) {
            //if it's a new record, we delete the temporary one from DB as a new one would be created by parseFetchRecordWithGrouping
            Activity *a = [Activity MR_findFirstByAttribute:@"crm_id" withValue:tempRecordId];
            [a MR_deleteEntity];
            //We also unschedule the previous notification that was associated with the other record!
            [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationUnscheduleNotificationForRecord object:self userInfo:@{kNotificationUserInfoRecordId: tempRecordId}];
        }
        //we now delete the record from the queue of records to be updated
        ModifiedRecord *mr = [ModifiedRecord MR_findFirstByAttribute:@"crm_id" withValue:tempRecordId];
        [mr MR_deleteEntity];
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    }
    else{
        //TODO: we should not get here!
        return @{@"error" : @"Unknown error when saving new record!"};
    }
    return  @{};
}

+ (NSDictionary*)parseListRecords:(NSDictionary*)JSON module:(NSString*)module
{
    BOOL success = [[JSON valueForKey:@"success"] boolValue];
    if (NO == success) {
        return @{@"error" : [JSON valueForKeyPath:@"error.message"]};
    }
    NSArray *records = [JSON valueForKeyPath:@"result.records"];
    NSMutableArray *identifiers = [[NSMutableArray alloc] init];
    
    if ([module isEqualToString:kVTModuleUsers]) {
        //delete all users because we dont' want old users around
        NSPredicate *p = [NSPredicate predicateWithFormat:@"service = %@", [Service getActive]];
        [User MR_deleteAllMatchingPredicate:p];
        for (NSDictionary* record in records) {
            [User modelObjectWithDictionary:record];
            [identifiers addObject:[record objectForKey:@"id"]];
        }
    }
    @try{
    //Save to Core Data (or whatever) the array of items
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

+ (NSDictionary*)parseQuery:(NSDictionary*)JSON module:(NSString*)module
{
    BOOL success = [[JSON valueForKey:@"success"] boolValue];
    if (NO == success) {
        return @{@"error" : [JSON valueForKeyPath:@"error.message"]};
    }
    NSArray *records = [JSON valueForKeyPath:@"result.records"];
    NSMutableArray *identifiers = [[NSMutableArray alloc] init];
    
    if ([module isEqualToString:kVTModuleGroups]) {
        //delete all users because we dont' want old users around
        NSPredicate *p = [NSPredicate predicateWithFormat:@"service = %@", [Service getActive]];
        [Group MR_deleteAllMatchingPredicate:p];
        for (NSDictionary* record in records) {
            [Group modelObjectWithDictionary:record];
            [identifiers addObject:[record objectForKey:@"id"]];
        }
    }
    @try{
        //Save to Core Data (or whatever) the array of items
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


@end
