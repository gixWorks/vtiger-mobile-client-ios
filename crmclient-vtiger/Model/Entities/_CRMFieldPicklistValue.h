// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CRMFieldPicklistValue.h instead.

@import CoreData;

extern const struct CRMFieldPicklistValueAttributes {
	__unsafe_unretained NSString *crm_label;
	__unsafe_unretained NSString *crm_value;
} CRMFieldPicklistValueAttributes;

extern const struct CRMFieldPicklistValueRelationships {
	__unsafe_unretained NSString *field;
} CRMFieldPicklistValueRelationships;

@class CRMField;

@interface CRMFieldPicklistValueID : NSManagedObjectID {}
@end

@interface _CRMFieldPicklistValue : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) CRMFieldPicklistValueID* objectID;

@property (nonatomic, strong) NSString* crm_label;

//- (BOOL)validateCrm_label:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_value;

//- (BOOL)validateCrm_value:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) CRMField *field;

//- (BOOL)validateField:(id*)value_ error:(NSError**)error_;

@end

@interface _CRMFieldPicklistValue (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveCrm_label;
- (void)setPrimitiveCrm_label:(NSString*)value;

- (NSString*)primitiveCrm_value;
- (void)setPrimitiveCrm_value:(NSString*)value;

- (CRMField*)primitiveField;
- (void)setPrimitiveField:(CRMField*)value;

@end
