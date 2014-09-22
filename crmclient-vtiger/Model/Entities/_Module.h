// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Module.h instead.

@import CoreData;

extern const struct ModuleAttributes {
	__unsafe_unretained NSString *crm_id;
	__unsafe_unretained NSString *crm_isEntity;
	__unsafe_unretained NSString *crm_label;
	__unsafe_unretained NSString *crm_name;
	__unsafe_unretained NSString *crm_singular;
} ModuleAttributes;

extern const struct ModuleRelationships {
	__unsafe_unretained NSString *fields;
	__unsafe_unretained NSString *service;
} ModuleRelationships;

@class CRMField;
@class Service;

@interface ModuleID : NSManagedObjectID {}
@end

@interface _Module : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ModuleID* objectID;

@property (nonatomic, strong) NSString* crm_id;

//- (BOOL)validateCrm_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* crm_isEntity;

@property (atomic) BOOL crm_isEntityValue;
- (BOOL)crm_isEntityValue;
- (void)setCrm_isEntityValue:(BOOL)value_;

//- (BOOL)validateCrm_isEntity:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_label;

//- (BOOL)validateCrm_label:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_name;

//- (BOOL)validateCrm_name:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_singular;

//- (BOOL)validateCrm_singular:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *fields;

- (NSMutableSet*)fieldsSet;

@property (nonatomic, strong) Service *service;

//- (BOOL)validateService:(id*)value_ error:(NSError**)error_;

@end

@interface _Module (FieldsCoreDataGeneratedAccessors)
- (void)addFields:(NSSet*)value_;
- (void)removeFields:(NSSet*)value_;
- (void)addFieldsObject:(CRMField*)value_;
- (void)removeFieldsObject:(CRMField*)value_;

@end

@interface _Module (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveCrm_id;
- (void)setPrimitiveCrm_id:(NSString*)value;

- (NSNumber*)primitiveCrm_isEntity;
- (void)setPrimitiveCrm_isEntity:(NSNumber*)value;

- (BOOL)primitiveCrm_isEntityValue;
- (void)setPrimitiveCrm_isEntityValue:(BOOL)value_;

- (NSString*)primitiveCrm_label;
- (void)setPrimitiveCrm_label:(NSString*)value;

- (NSString*)primitiveCrm_name;
- (void)setPrimitiveCrm_name:(NSString*)value;

- (NSString*)primitiveCrm_singular;
- (void)setPrimitiveCrm_singular:(NSString*)value;

- (NSMutableSet*)primitiveFields;
- (void)setPrimitiveFields:(NSMutableSet*)value;

- (Service*)primitiveService;
- (void)setPrimitiveService:(Service*)value;

@end
