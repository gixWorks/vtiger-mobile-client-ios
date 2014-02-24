//
//  Service.h
//  TapkuLibrary
//
//  Created by Giovanni on 24/02/14.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Account, Activity, Contact, Group, Lead, Module, Potential, Product, Sync, SyncToken, Ticket, User;

@interface Service : NSManagedObject

@property (nonatomic, retain) NSNumber * crm_active;
@property (nonatomic, retain) NSNumber * crm_crmondemand;
@property (nonatomic, retain) NSString * crm_servicename;
@property (nonatomic, retain) NSString * crm_timezone_server;
@property (nonatomic, retain) NSString * crm_timezone_user;
@property (nonatomic, retain) NSString * crm_url;
@property (nonatomic, retain) NSString * crm_userid;
@property (nonatomic, retain) NSString * crm_username;
@property (nonatomic, retain) NSSet *accounts;
@property (nonatomic, retain) NSSet *activities;
@property (nonatomic, retain) NSSet *contacts;
@property (nonatomic, retain) Lead *leads;
@property (nonatomic, retain) NSSet *modules;
@property (nonatomic, retain) Potential *potentials;
@property (nonatomic, retain) Product *products;
@property (nonatomic, retain) NSSet *syncs;
@property (nonatomic, retain) SyncToken *synctokens;
@property (nonatomic, retain) Ticket *tickets;
@property (nonatomic, retain) NSSet *users;
@property (nonatomic, retain) NSSet *groups;
@property (nonatomic, retain) NSSet *documents;
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

- (void)addModulesObject:(Module *)value;
- (void)removeModulesObject:(Module *)value;
- (void)addModules:(NSSet *)values;
- (void)removeModules:(NSSet *)values;

- (void)addSyncsObject:(Sync *)value;
- (void)removeSyncsObject:(Sync *)value;
- (void)addSyncs:(NSSet *)values;
- (void)removeSyncs:(NSSet *)values;

- (void)addUsersObject:(User *)value;
- (void)removeUsersObject:(User *)value;
- (void)addUsers:(NSSet *)values;
- (void)removeUsers:(NSSet *)values;

- (void)addGroupsObject:(Group *)value;
- (void)removeGroupsObject:(Group *)value;
- (void)addGroups:(NSSet *)values;
- (void)removeGroups:(NSSet *)values;

- (void)addDocumentsObject:(NSManagedObject *)value;
- (void)removeDocumentsObject:(NSManagedObject *)value;
- (void)addDocuments:(NSSet *)values;
- (void)removeDocuments:(NSSet *)values;

@end
