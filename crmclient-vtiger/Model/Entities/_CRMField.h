// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CRMField.h instead.

@import CoreData;

extern const struct CRMFieldAttributes {
	__unsafe_unretained NSString *crm_default_value;
	__unsafe_unretained NSString *crm_label;
	__unsafe_unretained NSString *crm_mandatory;
	__unsafe_unretained NSString *crm_name;
	__unsafe_unretained NSString *crm_options;
	__unsafe_unretained NSString *crm_type;
	__unsafe_unretained NSString *crm_uitype;
} CRMFieldAttributes;

extern const struct CRMFieldRelationships {
	__unsafe_unretained NSString *module;
	__unsafe_unretained NSString *picklist_values;
} CRMFieldRelationships;

@class Module;
@class CRMFieldPicklistValue;

@interface CRMFieldID : NSManagedObjectID {}
@end

@interface _CRMField : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) CRMFieldID* objectID;

@property (nonatomic, strong) NSString* crm_default_value;

//- (BOOL)validateCrm_default_value:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_label;

//- (BOOL)validateCrm_label:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* crm_mandatory;

@property (atomic) BOOL crm_mandatoryValue;
- (BOOL)crm_mandatoryValue;
- (void)setCrm_mandatoryValue:(BOOL)value_;

//- (BOOL)validateCrm_mandatory:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_name;

//- (BOOL)validateCrm_name:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSData* crm_options;

//- (BOOL)validateCrm_options:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_type;

//- (BOOL)validateCrm_type:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_uitype;

//- (BOOL)validateCrm_uitype:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Module *module;

//- (BOOL)validateModule:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *picklist_values;

- (NSMutableSet*)picklist_valuesSet;

@end

@interface _CRMField (Picklist_valuesCoreDataGeneratedAccessors)
- (void)addPicklist_values:(NSSet*)value_;
- (void)removePicklist_values:(NSSet*)value_;
- (void)addPicklist_valuesObject:(CRMFieldPicklistValue*)value_;
- (void)removePicklist_valuesObject:(CRMFieldPicklistValue*)value_;

@end

@interface _CRMField (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveCrm_default_value;
- (void)setPrimitiveCrm_default_value:(NSString*)value;

- (NSString*)primitiveCrm_label;
- (void)setPrimitiveCrm_label:(NSString*)value;

- (NSNumber*)primitiveCrm_mandatory;
- (void)setPrimitiveCrm_mandatory:(NSNumber*)value;

- (BOOL)primitiveCrm_mandatoryValue;
- (void)setPrimitiveCrm_mandatoryValue:(BOOL)value_;

- (NSString*)primitiveCrm_name;
- (void)setPrimitiveCrm_name:(NSString*)value;

- (NSData*)primitiveCrm_options;
- (void)setPrimitiveCrm_options:(NSData*)value;

- (NSString*)primitiveCrm_type;
- (void)setPrimitiveCrm_type:(NSString*)value;

- (NSString*)primitiveCrm_uitype;
- (void)setPrimitiveCrm_uitype:(NSString*)value;

- (Module*)primitiveModule;
- (void)setPrimitiveModule:(Module*)value;

- (NSMutableSet*)primitivePicklist_values;
- (void)setPrimitivePicklist_values:(NSMutableSet*)value;

@end
