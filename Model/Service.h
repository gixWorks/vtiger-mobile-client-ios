//
//  Service.h
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 1/10/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MagicalRecord/CoreData+MagicalRecord.h>

@class Account, Activity, Contact, Lead, Module, Potential, Product, Sync, SyncToken, Ticket;

@interface Service : NSManagedObject

@property (nonatomic, retain) NSNumber * crm_crmondemand;
@property (nonatomic, retain) NSString * crm_url;
@property (nonatomic, retain) NSString * crm_username;
@property (nonatomic, retain) NSString * crm_userid;
@property (nonatomic, retain) NSNumber * crm_active;
@property (nonatomic, retain) NSString * crm_servicename;
@property (nonatomic, retain) NSString * crm_timezone_user;
@property (nonatomic, retain) NSString * crm_timezone_server;
@property (nonatomic, retain) NSSet *accounts;
@property (nonatomic, retain) NSSet *activities;
@property (nonatomic, retain) NSSet *contacts;
@property (nonatomic, retain) Lead *leads;
@property (nonatomic, retain) Module *modules;
@property (nonatomic, retain) Potential *potentials;
@property (nonatomic, retain) Product *products;
@property (nonatomic, retain) NSSet *syncs;
@property (nonatomic, retain) SyncToken *synctokens;
@property (nonatomic, retain) Ticket *tickets;
@end

@interface Service (CoreDataGeneratedAccessors)

- (void)addAccountsObject:(Account *)value;
- (void)removeAccountsObject:(Account *)value;
- (void)addAccounts:(NSSet *)values;
- (void)removeAccounts:(NSSet *)values;

- (void)addActivitiesObject:(Activity *)value;
- (void)removeActivitiesObject:(Activity *)value;
- (void)addActivities:(NSSet *)values;
- (void)removeActivities:(NSSet *)values;

- (void)addContactsObject:(Contact *)value;
- (void)removeContactsObject:(Contact *)value;
- (void)addContacts:(NSSet *)values;
- (void)removeContacts:(NSSet *)values;

- (void)addSyncsObject:(Sync *)value;
- (void)removeSyncsObject:(Sync *)value;
- (void)addSyncs:(NSSet *)values;
- (void)removeSyncs:(NSSet *)values;

@end
