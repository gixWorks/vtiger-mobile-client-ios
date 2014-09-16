// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LeadAddress.h instead.

#import <CoreData/CoreData.h>

extern const struct LeadAddressAttributes {
	__unsafe_unretained NSString *crm_city;
	__unsafe_unretained NSString *crm_code;
	__unsafe_unretained NSString *crm_country;
	__unsafe_unretained NSString *crm_pobox;
	__unsafe_unretained NSString *crm_state;
	__unsafe_unretained NSString *crm_street;
} LeadAddressAttributes;

extern const struct LeadAddressRelationships {
	__unsafe_unretained NSString *lead;
} LeadAddressRelationships;

@class Lead;

@interface LeadAddressID : NSManagedObjectID {}
@end

@interface _LeadAddress : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) LeadAddressID* objectID;

@property (nonatomic, strong) NSString* crm_city;

//- (BOOL)validateCrm_city:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_code;

//- (BOOL)validateCrm_code:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_country;

//- (BOOL)validateCrm_country:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_pobox;

//- (BOOL)validateCrm_pobox:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_state;

//- (BOOL)validateCrm_state:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_street;

//- (BOOL)validateCrm_street:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Lead *lead;

//- (BOOL)validateLead:(id*)value_ error:(NSError**)error_;

@end

@interface _LeadAddress (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveCrm_city;
- (void)setPrimitiveCrm_city:(NSString*)value;

- (NSString*)primitiveCrm_code;
- (void)setPrimitiveCrm_code:(NSString*)value;

- (NSString*)primitiveCrm_country;
- (void)setPrimitiveCrm_country:(NSString*)value;

- (NSString*)primitiveCrm_pobox;
- (void)setPrimitiveCrm_pobox:(NSString*)value;

- (NSString*)primitiveCrm_state;
- (void)setPrimitiveCrm_state:(NSString*)value;

- (NSString*)primitiveCrm_street;
- (void)setPrimitiveCrm_street:(NSString*)value;

- (Lead*)primitiveLead;
- (void)setPrimitiveLead:(Lead*)value;

@end
