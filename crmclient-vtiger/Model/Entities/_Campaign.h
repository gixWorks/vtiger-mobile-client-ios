// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Campaign.h instead.

@import CoreData;

extern const struct CampaignAttributes {
	__unsafe_unretained NSString *crm_assigned_user_id;
	__unsafe_unretained NSString *crm_assigned_user_name;
	__unsafe_unretained NSString *crm_campaign_no;
	__unsafe_unretained NSString *crm_campaignname;
	__unsafe_unretained NSString *crm_campaignstatus;
	__unsafe_unretained NSString *crm_campaigntype;
	__unsafe_unretained NSString *crm_closingdate;
	__unsafe_unretained NSString *crm_description;
	__unsafe_unretained NSString *crm_id;
	__unsafe_unretained NSString *crm_numsent;
	__unsafe_unretained NSString *crm_product_id;
	__unsafe_unretained NSString *crm_product_name;
	__unsafe_unretained NSString *crm_sponsor;
	__unsafe_unretained NSString *crm_targetaudience;
	__unsafe_unretained NSString *crm_targetsize;
	__unsafe_unretained NSString *crm_time_created;
	__unsafe_unretained NSString *crm_time_modified;
	__unsafe_unretained NSString *my_custom_fields;
} CampaignAttributes;

extern const struct CampaignRelationships {
	__unsafe_unretained NSString *service;
} CampaignRelationships;

@class Service;

@interface CampaignID : NSManagedObjectID {}
@end

@interface _Campaign : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) CampaignID* objectID;

@property (nonatomic, strong) NSString* crm_assigned_user_id;

//- (BOOL)validateCrm_assigned_user_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_assigned_user_name;

//- (BOOL)validateCrm_assigned_user_name:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_campaign_no;

//- (BOOL)validateCrm_campaign_no:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_campaignname;

//- (BOOL)validateCrm_campaignname:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_campaignstatus;

//- (BOOL)validateCrm_campaignstatus:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_campaigntype;

//- (BOOL)validateCrm_campaigntype:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* crm_closingdate;

//- (BOOL)validateCrm_closingdate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_description;

//- (BOOL)validateCrm_description:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_id;

//- (BOOL)validateCrm_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* crm_numsent;

@property (atomic) int16_t crm_numsentValue;
- (int16_t)crm_numsentValue;
- (void)setCrm_numsentValue:(int16_t)value_;

//- (BOOL)validateCrm_numsent:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_product_id;

//- (BOOL)validateCrm_product_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_product_name;

//- (BOOL)validateCrm_product_name:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_sponsor;

//- (BOOL)validateCrm_sponsor:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_targetaudience;

//- (BOOL)validateCrm_targetaudience:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* crm_targetsize;

@property (atomic) int16_t crm_targetsizeValue;
- (int16_t)crm_targetsizeValue;
- (void)setCrm_targetsizeValue:(int16_t)value_;

//- (BOOL)validateCrm_targetsize:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* crm_time_created;

//- (BOOL)validateCrm_time_created:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* crm_time_modified;

//- (BOOL)validateCrm_time_modified:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSData* my_custom_fields;

//- (BOOL)validateMy_custom_fields:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Service *service;

//- (BOOL)validateService:(id*)value_ error:(NSError**)error_;

@end

@interface _Campaign (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveCrm_assigned_user_id;
- (void)setPrimitiveCrm_assigned_user_id:(NSString*)value;

- (NSString*)primitiveCrm_assigned_user_name;
- (void)setPrimitiveCrm_assigned_user_name:(NSString*)value;

- (NSString*)primitiveCrm_campaign_no;
- (void)setPrimitiveCrm_campaign_no:(NSString*)value;

- (NSString*)primitiveCrm_campaignname;
- (void)setPrimitiveCrm_campaignname:(NSString*)value;

- (NSString*)primitiveCrm_campaignstatus;
- (void)setPrimitiveCrm_campaignstatus:(NSString*)value;

- (NSString*)primitiveCrm_campaigntype;
- (void)setPrimitiveCrm_campaigntype:(NSString*)value;

- (NSDate*)primitiveCrm_closingdate;
- (void)setPrimitiveCrm_closingdate:(NSDate*)value;

- (NSString*)primitiveCrm_description;
- (void)setPrimitiveCrm_description:(NSString*)value;

- (NSString*)primitiveCrm_id;
- (void)setPrimitiveCrm_id:(NSString*)value;

- (NSNumber*)primitiveCrm_numsent;
- (void)setPrimitiveCrm_numsent:(NSNumber*)value;

- (int16_t)primitiveCrm_numsentValue;
- (void)setPrimitiveCrm_numsentValue:(int16_t)value_;

- (NSString*)primitiveCrm_product_id;
- (void)setPrimitiveCrm_product_id:(NSString*)value;

- (NSString*)primitiveCrm_product_name;
- (void)setPrimitiveCrm_product_name:(NSString*)value;

- (NSString*)primitiveCrm_sponsor;
- (void)setPrimitiveCrm_sponsor:(NSString*)value;

- (NSString*)primitiveCrm_targetaudience;
- (void)setPrimitiveCrm_targetaudience:(NSString*)value;

- (NSNumber*)primitiveCrm_targetsize;
- (void)setPrimitiveCrm_targetsize:(NSNumber*)value;

- (int16_t)primitiveCrm_targetsizeValue;
- (void)setPrimitiveCrm_targetsizeValue:(int16_t)value_;

- (NSDate*)primitiveCrm_time_created;
- (void)setPrimitiveCrm_time_created:(NSDate*)value;

- (NSDate*)primitiveCrm_time_modified;
- (void)setPrimitiveCrm_time_modified:(NSDate*)value;

- (NSData*)primitiveMy_custom_fields;
- (void)setPrimitiveMy_custom_fields:(NSData*)value;

- (Service*)primitiveService;
- (void)setPrimitiveService:(Service*)value;

@end
