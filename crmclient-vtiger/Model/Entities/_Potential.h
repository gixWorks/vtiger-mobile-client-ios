// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Potential.h instead.

@import CoreData;

extern const struct PotentialAttributes {
	__unsafe_unretained NSString *crm_amount;
	__unsafe_unretained NSString *crm_assigned_user_id;
	__unsafe_unretained NSString *crm_assigned_user_name;
	__unsafe_unretained NSString *crm_campaign_id;
	__unsafe_unretained NSString *crm_campaign_name;
	__unsafe_unretained NSString *crm_closingdate;
	__unsafe_unretained NSString *crm_description;
	__unsafe_unretained NSString *crm_id;
	__unsafe_unretained NSString *crm_leadsource;
	__unsafe_unretained NSString *crm_nextstep;
	__unsafe_unretained NSString *crm_opportunity_type;
	__unsafe_unretained NSString *crm_potential_no;
	__unsafe_unretained NSString *crm_potentialname;
	__unsafe_unretained NSString *crm_probability;
	__unsafe_unretained NSString *crm_related_to_id;
	__unsafe_unretained NSString *crm_related_to_name;
	__unsafe_unretained NSString *crm_related_to_type;
	__unsafe_unretained NSString *crm_sales_stage;
	__unsafe_unretained NSString *crm_time_created;
	__unsafe_unretained NSString *crm_time_modified;
	__unsafe_unretained NSString *my_custom_fields;
} PotentialAttributes;

extern const struct PotentialRelationships {
	__unsafe_unretained NSString *service;
} PotentialRelationships;

@class Service;

@interface PotentialID : NSManagedObjectID {}
@end

@interface _Potential : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) PotentialID* objectID;

@property (nonatomic, strong) NSDecimalNumber* crm_amount;

//- (BOOL)validateCrm_amount:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_assigned_user_id;

//- (BOOL)validateCrm_assigned_user_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_assigned_user_name;

//- (BOOL)validateCrm_assigned_user_name:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_campaign_id;

//- (BOOL)validateCrm_campaign_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_campaign_name;

//- (BOOL)validateCrm_campaign_name:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* crm_closingdate;

//- (BOOL)validateCrm_closingdate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_description;

//- (BOOL)validateCrm_description:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_id;

//- (BOOL)validateCrm_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_leadsource;

//- (BOOL)validateCrm_leadsource:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_nextstep;

//- (BOOL)validateCrm_nextstep:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_opportunity_type;

//- (BOOL)validateCrm_opportunity_type:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_potential_no;

//- (BOOL)validateCrm_potential_no:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_potentialname;

//- (BOOL)validateCrm_potentialname:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* crm_probability;

@property (atomic) float crm_probabilityValue;
- (float)crm_probabilityValue;
- (void)setCrm_probabilityValue:(float)value_;

//- (BOOL)validateCrm_probability:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_related_to_id;

//- (BOOL)validateCrm_related_to_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_related_to_name;

//- (BOOL)validateCrm_related_to_name:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_related_to_type;

//- (BOOL)validateCrm_related_to_type:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_sales_stage;

//- (BOOL)validateCrm_sales_stage:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* crm_time_created;

//- (BOOL)validateCrm_time_created:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* crm_time_modified;

//- (BOOL)validateCrm_time_modified:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSData* my_custom_fields;

//- (BOOL)validateMy_custom_fields:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Service *service;

//- (BOOL)validateService:(id*)value_ error:(NSError**)error_;

@end

@interface _Potential (CoreDataGeneratedPrimitiveAccessors)

- (NSDecimalNumber*)primitiveCrm_amount;
- (void)setPrimitiveCrm_amount:(NSDecimalNumber*)value;

- (NSString*)primitiveCrm_assigned_user_id;
- (void)setPrimitiveCrm_assigned_user_id:(NSString*)value;

- (NSString*)primitiveCrm_assigned_user_name;
- (void)setPrimitiveCrm_assigned_user_name:(NSString*)value;

- (NSString*)primitiveCrm_campaign_id;
- (void)setPrimitiveCrm_campaign_id:(NSString*)value;

- (NSString*)primitiveCrm_campaign_name;
- (void)setPrimitiveCrm_campaign_name:(NSString*)value;

- (NSDate*)primitiveCrm_closingdate;
- (void)setPrimitiveCrm_closingdate:(NSDate*)value;

- (NSString*)primitiveCrm_description;
- (void)setPrimitiveCrm_description:(NSString*)value;

- (NSString*)primitiveCrm_id;
- (void)setPrimitiveCrm_id:(NSString*)value;

- (NSString*)primitiveCrm_leadsource;
- (void)setPrimitiveCrm_leadsource:(NSString*)value;

- (NSString*)primitiveCrm_nextstep;
- (void)setPrimitiveCrm_nextstep:(NSString*)value;

- (NSString*)primitiveCrm_opportunity_type;
- (void)setPrimitiveCrm_opportunity_type:(NSString*)value;

- (NSString*)primitiveCrm_potential_no;
- (void)setPrimitiveCrm_potential_no:(NSString*)value;

- (NSString*)primitiveCrm_potentialname;
- (void)setPrimitiveCrm_potentialname:(NSString*)value;

- (NSNumber*)primitiveCrm_probability;
- (void)setPrimitiveCrm_probability:(NSNumber*)value;

- (float)primitiveCrm_probabilityValue;
- (void)setPrimitiveCrm_probabilityValue:(float)value_;

- (NSString*)primitiveCrm_related_to_id;
- (void)setPrimitiveCrm_related_to_id:(NSString*)value;

- (NSString*)primitiveCrm_related_to_name;
- (void)setPrimitiveCrm_related_to_name:(NSString*)value;

- (NSString*)primitiveCrm_related_to_type;
- (void)setPrimitiveCrm_related_to_type:(NSString*)value;

- (NSString*)primitiveCrm_sales_stage;
- (void)setPrimitiveCrm_sales_stage:(NSString*)value;

- (NSDate*)primitiveCrm_time_created;
- (void)setPrimitiveCrm_time_created:(NSDate*)value;

- (NSDate*)primitiveCrm_time_modified;
- (void)setPrimitiveCrm_time_modified:(NSDate*)value;

- (NSData*)primitiveMy_custom_fields;
- (void)setPrimitiveMy_custom_fields:(NSData*)value;

- (Service*)primitiveService;
- (void)setPrimitiveService:(Service*)value;

@end
