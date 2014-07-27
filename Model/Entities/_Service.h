// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Service.h instead.

#import <CoreData/CoreData.h>


extern const struct ServiceAttributes {
	__unsafe_unretained NSString *crm_active;
	__unsafe_unretained NSString *crm_client_certificate_data;
	__unsafe_unretained NSString *crm_crmondemand;
	__unsafe_unretained NSString *crm_servicename;
	__unsafe_unretained NSString *crm_timezone_server;
	__unsafe_unretained NSString *crm_timezone_user;
	__unsafe_unretained NSString *crm_url;
	__unsafe_unretained NSString *crm_userid;
	__unsafe_unretained NSString *crm_username;
} ServiceAttributes;

extern const struct ServiceRelationships {
	__unsafe_unretained NSString *accounts;
	__unsafe_unretained NSString *activities;
	__unsafe_unretained NSString *campaigns;
	__unsafe_unretained NSString *comments;
	__unsafe_unretained NSString *contacts;
	__unsafe_unretained NSString *documents;
	__unsafe_unretained NSString *enabledModules;
	__unsafe_unretained NSString *errorMessages;
	__unsafe_unretained NSString *groups;
	__unsafe_unretained NSString *history_locations;
	__unsafe_unretained NSString *leads;
	__unsafe_unretained NSString *modules;
	__unsafe_unretained NSString *potentials;
	__unsafe_unretained NSString *products;
	__unsafe_unretained NSString *syncs;
	__unsafe_unretained NSString *synctokens;
	__unsafe_unretained NSString *tickets;
	__unsafe_unretained NSString *users;
} ServiceRelationships;

extern const struct ServiceFetchedProperties {
} ServiceFetchedProperties;

@class Account;
@class Activity;
@class Campaign;
@class NSManagedObject;
@class Contact;
@class Document;
@class EnabledModules;
@class CRMErrorMessage;
@class Group;
@class GWLocation;
@class Lead;
@class Module;
@class Potential;
@class Product;
@class Sync;
@class SyncToken;
@class Ticket;
@class User;











@interface ServiceID : NSManagedObjectID {}
@end

@interface _Service : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ServiceID*)objectID;





@property (nonatomic, strong) NSNumber* crm_active;



@property BOOL crm_activeValue;
- (BOOL)crm_activeValue;
- (void)setCrm_activeValue:(BOOL)value_;

//- (BOOL)validateCrm_active:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSData* crm_client_certificate_data;



//- (BOOL)validateCrm_client_certificate_data:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* crm_crmondemand;



@property BOOL crm_crmondemandValue;
- (BOOL)crm_crmondemandValue;
- (void)setCrm_crmondemandValue:(BOOL)value_;

//- (BOOL)validateCrm_crmondemand:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_servicename;



//- (BOOL)validateCrm_servicename:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_timezone_server;



//- (BOOL)validateCrm_timezone_server:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_timezone_user;



//- (BOOL)validateCrm_timezone_user:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_url;



//- (BOOL)validateCrm_url:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_userid;



//- (BOOL)validateCrm_userid:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_username;



//- (BOOL)validateCrm_username:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *accounts;

- (NSMutableSet*)accountsSet;




@property (nonatomic, strong) NSSet *activities;

- (NSMutableSet*)activitiesSet;




@property (nonatomic, strong) NSSet *campaigns;

- (NSMutableSet*)campaignsSet;




@property (nonatomic, strong) NSSet *comments;

- (NSMutableSet*)commentsSet;




@property (nonatomic, strong) NSSet *contacts;

- (NSMutableSet*)contactsSet;




@property (nonatomic, strong) NSSet *documents;

- (NSMutableSet*)documentsSet;




@property (nonatomic, strong) NSSet *enabledModules;

- (NSMutableSet*)enabledModulesSet;




@property (nonatomic, strong) NSSet *errorMessages;

- (NSMutableSet*)errorMessagesSet;




@property (nonatomic, strong) NSSet *groups;

- (NSMutableSet*)groupsSet;




@property (nonatomic, strong) NSSet *history_locations;

- (NSMutableSet*)history_locationsSet;




@property (nonatomic, strong) NSSet *leads;

- (NSMutableSet*)leadsSet;




@property (nonatomic, strong) NSSet *modules;

- (NSMutableSet*)modulesSet;




@property (nonatomic, strong) NSSet *potentials;

- (NSMutableSet*)potentialsSet;




@property (nonatomic, strong) NSSet *products;

- (NSMutableSet*)productsSet;




@property (nonatomic, strong) NSSet *syncs;

- (NSMutableSet*)syncsSet;




@property (nonatomic, strong) NSSet *synctokens;

- (NSMutableSet*)synctokensSet;




@property (nonatomic, strong) NSSet *tickets;

- (NSMutableSet*)ticketsSet;




@property (nonatomic, strong) NSSet *users;

- (NSMutableSet*)usersSet;





@end

@interface _Service (CoreDataGeneratedAccessors)

- (void)addAccounts:(NSSet*)value_;
- (void)removeAccounts:(NSSet*)value_;
- (void)addAccountsObject:(Account*)value_;
- (void)removeAccountsObject:(Account*)value_;

- (void)addActivities:(NSSet*)value_;
- (void)removeActivities:(NSSet*)value_;
- (void)addActivitiesObject:(Activity*)value_;
- (void)removeActivitiesObject:(Activity*)value_;

- (void)addCampaigns:(NSSet*)value_;
- (void)removeCampaigns:(NSSet*)value_;
- (void)addCampaignsObject:(Campaign*)value_;
- (void)removeCampaignsObject:(Campaign*)value_;

- (void)addComments:(NSSet*)value_;
- (void)removeComments:(NSSet*)value_;
- (void)addCommentsObject:(NSManagedObject*)value_;
- (void)removeCommentsObject:(NSManagedObject*)value_;

- (void)addContacts:(NSSet*)value_;
- (void)removeContacts:(NSSet*)value_;
- (void)addContactsObject:(Contact*)value_;
- (void)removeContactsObject:(Contact*)value_;

- (void)addDocuments:(NSSet*)value_;
- (void)removeDocuments:(NSSet*)value_;
- (void)addDocumentsObject:(Document*)value_;
- (void)removeDocumentsObject:(Document*)value_;

- (void)addEnabledModules:(NSSet*)value_;
- (void)removeEnabledModules:(NSSet*)value_;
- (void)addEnabledModulesObject:(EnabledModules*)value_;
- (void)removeEnabledModulesObject:(EnabledModules*)value_;

- (void)addErrorMessages:(NSSet*)value_;
- (void)removeErrorMessages:(NSSet*)value_;
- (void)addErrorMessagesObject:(CRMErrorMessage*)value_;
- (void)removeErrorMessagesObject:(CRMErrorMessage*)value_;

- (void)addGroups:(NSSet*)value_;
- (void)removeGroups:(NSSet*)value_;
- (void)addGroupsObject:(Group*)value_;
- (void)removeGroupsObject:(Group*)value_;

- (void)addHistory_locations:(NSSet*)value_;
- (void)removeHistory_locations:(NSSet*)value_;
- (void)addHistory_locationsObject:(GWLocation*)value_;
- (void)removeHistory_locationsObject:(GWLocation*)value_;

- (void)addLeads:(NSSet*)value_;
- (void)removeLeads:(NSSet*)value_;
- (void)addLeadsObject:(Lead*)value_;
- (void)removeLeadsObject:(Lead*)value_;

- (void)addModules:(NSSet*)value_;
- (void)removeModules:(NSSet*)value_;
- (void)addModulesObject:(Module*)value_;
- (void)removeModulesObject:(Module*)value_;

- (void)addPotentials:(NSSet*)value_;
- (void)removePotentials:(NSSet*)value_;
- (void)addPotentialsObject:(Potential*)value_;
- (void)removePotentialsObject:(Potential*)value_;

- (void)addProducts:(NSSet*)value_;
- (void)removeProducts:(NSSet*)value_;
- (void)addProductsObject:(Product*)value_;
- (void)removeProductsObject:(Product*)value_;

- (void)addSyncs:(NSSet*)value_;
- (void)removeSyncs:(NSSet*)value_;
- (void)addSyncsObject:(Sync*)value_;
- (void)removeSyncsObject:(Sync*)value_;

- (void)addSynctokens:(NSSet*)value_;
- (void)removeSynctokens:(NSSet*)value_;
- (void)addSynctokensObject:(SyncToken*)value_;
- (void)removeSynctokensObject:(SyncToken*)value_;

- (void)addTickets:(NSSet*)value_;
- (void)removeTickets:(NSSet*)value_;
- (void)addTicketsObject:(Ticket*)value_;
- (void)removeTicketsObject:(Ticket*)value_;

- (void)addUsers:(NSSet*)value_;
- (void)removeUsers:(NSSet*)value_;
- (void)addUsersObject:(User*)value_;
- (void)removeUsersObject:(User*)value_;

@end

@interface _Service (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveCrm_active;
- (void)setPrimitiveCrm_active:(NSNumber*)value;

- (BOOL)primitiveCrm_activeValue;
- (void)setPrimitiveCrm_activeValue:(BOOL)value_;




- (NSData*)primitiveCrm_client_certificate_data;
- (void)setPrimitiveCrm_client_certificate_data:(NSData*)value;




- (NSNumber*)primitiveCrm_crmondemand;
- (void)setPrimitiveCrm_crmondemand:(NSNumber*)value;

- (BOOL)primitiveCrm_crmondemandValue;
- (void)setPrimitiveCrm_crmondemandValue:(BOOL)value_;




- (NSString*)primitiveCrm_servicename;
- (void)setPrimitiveCrm_servicename:(NSString*)value;




- (NSString*)primitiveCrm_timezone_server;
- (void)setPrimitiveCrm_timezone_server:(NSString*)value;




- (NSString*)primitiveCrm_timezone_user;
- (void)setPrimitiveCrm_timezone_user:(NSString*)value;




- (NSString*)primitiveCrm_url;
- (void)setPrimitiveCrm_url:(NSString*)value;




- (NSString*)primitiveCrm_userid;
- (void)setPrimitiveCrm_userid:(NSString*)value;




- (NSString*)primitiveCrm_username;
- (void)setPrimitiveCrm_username:(NSString*)value;





- (NSMutableSet*)primitiveAccounts;
- (void)setPrimitiveAccounts:(NSMutableSet*)value;



- (NSMutableSet*)primitiveActivities;
- (void)setPrimitiveActivities:(NSMutableSet*)value;



- (NSMutableSet*)primitiveCampaigns;
- (void)setPrimitiveCampaigns:(NSMutableSet*)value;



- (NSMutableSet*)primitiveComments;
- (void)setPrimitiveComments:(NSMutableSet*)value;



- (NSMutableSet*)primitiveContacts;
- (void)setPrimitiveContacts:(NSMutableSet*)value;



- (NSMutableSet*)primitiveDocuments;
- (void)setPrimitiveDocuments:(NSMutableSet*)value;



- (NSMutableSet*)primitiveEnabledModules;
- (void)setPrimitiveEnabledModules:(NSMutableSet*)value;



- (NSMutableSet*)primitiveErrorMessages;
- (void)setPrimitiveErrorMessages:(NSMutableSet*)value;



- (NSMutableSet*)primitiveGroups;
- (void)setPrimitiveGroups:(NSMutableSet*)value;



- (NSMutableSet*)primitiveHistory_locations;
- (void)setPrimitiveHistory_locations:(NSMutableSet*)value;



- (NSMutableSet*)primitiveLeads;
- (void)setPrimitiveLeads:(NSMutableSet*)value;



- (NSMutableSet*)primitiveModules;
- (void)setPrimitiveModules:(NSMutableSet*)value;



- (NSMutableSet*)primitivePotentials;
- (void)setPrimitivePotentials:(NSMutableSet*)value;



- (NSMutableSet*)primitiveProducts;
- (void)setPrimitiveProducts:(NSMutableSet*)value;



- (NSMutableSet*)primitiveSyncs;
- (void)setPrimitiveSyncs:(NSMutableSet*)value;



- (NSMutableSet*)primitiveSynctokens;
- (void)setPrimitiveSynctokens:(NSMutableSet*)value;



- (NSMutableSet*)primitiveTickets;
- (void)setPrimitiveTickets:(NSMutableSet*)value;



- (NSMutableSet*)primitiveUsers;
- (void)setPrimitiveUsers:(NSMutableSet*)value;


@end
