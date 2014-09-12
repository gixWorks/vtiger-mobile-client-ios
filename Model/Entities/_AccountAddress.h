// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AccountAddress.h instead.

#import <CoreData/CoreData.h>

extern const struct AccountAddressAttributes {
	__unsafe_unretained NSString *crm_bill_city;
	__unsafe_unretained NSString *crm_bill_code;
	__unsafe_unretained NSString *crm_bill_country;
	__unsafe_unretained NSString *crm_bill_pobox;
	__unsafe_unretained NSString *crm_bill_state;
	__unsafe_unretained NSString *crm_bill_street;
	__unsafe_unretained NSString *crm_ship_city;
	__unsafe_unretained NSString *crm_ship_code;
	__unsafe_unretained NSString *crm_ship_country;
	__unsafe_unretained NSString *crm_ship_pobox;
	__unsafe_unretained NSString *crm_ship_state;
	__unsafe_unretained NSString *crm_ship_street;
} AccountAddressAttributes;

extern const struct AccountAddressRelationships {
	__unsafe_unretained NSString *account;
} AccountAddressRelationships;

@class Account;

@interface AccountAddressID : NSManagedObjectID {}
@end

@interface _AccountAddress : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) AccountAddressID* objectID;

@property (nonatomic, strong) NSString* crm_bill_city;

//- (BOOL)validateCrm_bill_city:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_bill_code;

//- (BOOL)validateCrm_bill_code:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_bill_country;

//- (BOOL)validateCrm_bill_country:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_bill_pobox;

//- (BOOL)validateCrm_bill_pobox:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_bill_state;

//- (BOOL)validateCrm_bill_state:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_bill_street;

//- (BOOL)validateCrm_bill_street:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_ship_city;

//- (BOOL)validateCrm_ship_city:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_ship_code;

//- (BOOL)validateCrm_ship_code:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_ship_country;

//- (BOOL)validateCrm_ship_country:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_ship_pobox;

//- (BOOL)validateCrm_ship_pobox:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_ship_state;

//- (BOOL)validateCrm_ship_state:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_ship_street;

//- (BOOL)validateCrm_ship_street:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Account *account;

//- (BOOL)validateAccount:(id*)value_ error:(NSError**)error_;

@end

@interface _AccountAddress (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveCrm_bill_city;
- (void)setPrimitiveCrm_bill_city:(NSString*)value;

- (NSString*)primitiveCrm_bill_code;
- (void)setPrimitiveCrm_bill_code:(NSString*)value;

- (NSString*)primitiveCrm_bill_country;
- (void)setPrimitiveCrm_bill_country:(NSString*)value;

- (NSString*)primitiveCrm_bill_pobox;
- (void)setPrimitiveCrm_bill_pobox:(NSString*)value;

- (NSString*)primitiveCrm_bill_state;
- (void)setPrimitiveCrm_bill_state:(NSString*)value;

- (NSString*)primitiveCrm_bill_street;
- (void)setPrimitiveCrm_bill_street:(NSString*)value;

- (NSString*)primitiveCrm_ship_city;
- (void)setPrimitiveCrm_ship_city:(NSString*)value;

- (NSString*)primitiveCrm_ship_code;
- (void)setPrimitiveCrm_ship_code:(NSString*)value;

- (NSString*)primitiveCrm_ship_country;
- (void)setPrimitiveCrm_ship_country:(NSString*)value;

- (NSString*)primitiveCrm_ship_pobox;
- (void)setPrimitiveCrm_ship_pobox:(NSString*)value;

- (NSString*)primitiveCrm_ship_state;
- (void)setPrimitiveCrm_ship_state:(NSString*)value;

- (NSString*)primitiveCrm_ship_street;
- (void)setPrimitiveCrm_ship_street:(NSString*)value;

- (Account*)primitiveAccount;
- (void)setPrimitiveAccount:(Account*)value;

@end
