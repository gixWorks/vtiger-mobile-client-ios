// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ContactAddress.h instead.

#import <CoreData/CoreData.h>


extern const struct ContactAddressAttributes {
	__unsafe_unretained NSString *crm_mailingcity;
	__unsafe_unretained NSString *crm_mailingcountry;
	__unsafe_unretained NSString *crm_mailingpobox;
	__unsafe_unretained NSString *crm_mailingstate;
	__unsafe_unretained NSString *crm_mailingstreet;
	__unsafe_unretained NSString *crm_mailingzip;
	__unsafe_unretained NSString *crm_othercity;
	__unsafe_unretained NSString *crm_othercountry;
	__unsafe_unretained NSString *crm_otherpobox;
	__unsafe_unretained NSString *crm_otherstate;
	__unsafe_unretained NSString *crm_otherstreet;
	__unsafe_unretained NSString *crm_otherzip;
} ContactAddressAttributes;

extern const struct ContactAddressRelationships {
	__unsafe_unretained NSString *contact;
} ContactAddressRelationships;

extern const struct ContactAddressFetchedProperties {
} ContactAddressFetchedProperties;

@class Contact;














@interface ContactAddressID : NSManagedObjectID {}
@end

@interface _ContactAddress : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ContactAddressID*)objectID;





@property (nonatomic, strong) NSString* crm_mailingcity;



//- (BOOL)validateCrm_mailingcity:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_mailingcountry;



//- (BOOL)validateCrm_mailingcountry:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_mailingpobox;



//- (BOOL)validateCrm_mailingpobox:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_mailingstate;



//- (BOOL)validateCrm_mailingstate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_mailingstreet;



//- (BOOL)validateCrm_mailingstreet:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_mailingzip;



//- (BOOL)validateCrm_mailingzip:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_othercity;



//- (BOOL)validateCrm_othercity:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_othercountry;



//- (BOOL)validateCrm_othercountry:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_otherpobox;



//- (BOOL)validateCrm_otherpobox:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_otherstate;



//- (BOOL)validateCrm_otherstate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_otherstreet;



//- (BOOL)validateCrm_otherstreet:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_otherzip;



//- (BOOL)validateCrm_otherzip:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Contact *contact;

//- (BOOL)validateContact:(id*)value_ error:(NSError**)error_;





@end

@interface _ContactAddress (CoreDataGeneratedAccessors)

@end

@interface _ContactAddress (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveCrm_mailingcity;
- (void)setPrimitiveCrm_mailingcity:(NSString*)value;




- (NSString*)primitiveCrm_mailingcountry;
- (void)setPrimitiveCrm_mailingcountry:(NSString*)value;




- (NSString*)primitiveCrm_mailingpobox;
- (void)setPrimitiveCrm_mailingpobox:(NSString*)value;




- (NSString*)primitiveCrm_mailingstate;
- (void)setPrimitiveCrm_mailingstate:(NSString*)value;




- (NSString*)primitiveCrm_mailingstreet;
- (void)setPrimitiveCrm_mailingstreet:(NSString*)value;




- (NSString*)primitiveCrm_mailingzip;
- (void)setPrimitiveCrm_mailingzip:(NSString*)value;




- (NSString*)primitiveCrm_othercity;
- (void)setPrimitiveCrm_othercity:(NSString*)value;




- (NSString*)primitiveCrm_othercountry;
- (void)setPrimitiveCrm_othercountry:(NSString*)value;




- (NSString*)primitiveCrm_otherpobox;
- (void)setPrimitiveCrm_otherpobox:(NSString*)value;




- (NSString*)primitiveCrm_otherstate;
- (void)setPrimitiveCrm_otherstate:(NSString*)value;




- (NSString*)primitiveCrm_otherstreet;
- (void)setPrimitiveCrm_otherstreet:(NSString*)value;




- (NSString*)primitiveCrm_otherzip;
- (void)setPrimitiveCrm_otherzip:(NSString*)value;





- (Contact*)primitiveContact;
- (void)setPrimitiveContact:(Contact*)value;


@end
