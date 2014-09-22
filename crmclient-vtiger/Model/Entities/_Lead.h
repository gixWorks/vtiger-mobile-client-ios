// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Lead.h instead.

@import CoreData;

extern const struct LeadAttributes {
	__unsafe_unretained NSString *crm_time_created;
	__unsafe_unretained NSString *crm_time_modified;
	__unsafe_unretained NSString *lead_assigned_user_id;
	__unsafe_unretained NSString *lead_assigned_user_name;
	__unsafe_unretained NSString *lead_company;
	__unsafe_unretained NSString *lead_company_annualrevenue;
	__unsafe_unretained NSString *lead_company_industry;
	__unsafe_unretained NSString *lead_company_noofemployees;
	__unsafe_unretained NSString *lead_company_website;
	__unsafe_unretained NSString *lead_description;
	__unsafe_unretained NSString *lead_designation;
	__unsafe_unretained NSString *lead_email;
	__unsafe_unretained NSString *lead_fax;
	__unsafe_unretained NSString *lead_firstname;
	__unsafe_unretained NSString *lead_lastname;
	__unsafe_unretained NSString *lead_lead_no;
	__unsafe_unretained NSString *lead_leadid;
	__unsafe_unretained NSString *lead_leadsource;
	__unsafe_unretained NSString *lead_leadstatus;
	__unsafe_unretained NSString *lead_mobile;
	__unsafe_unretained NSString *lead_phone;
	__unsafe_unretained NSString *lead_rating;
	__unsafe_unretained NSString *lead_salutationtype;
	__unsafe_unretained NSString *lead_yahooid;
	__unsafe_unretained NSString *my_custom_fields;
} LeadAttributes;

extern const struct LeadRelationships {
	__unsafe_unretained NSString *address;
	__unsafe_unretained NSString *service;
} LeadRelationships;

@class LeadAddress;
@class Service;

@interface LeadID : NSManagedObjectID {}
@end

@interface _Lead : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) LeadID* objectID;

@property (nonatomic, strong) NSDate* crm_time_created;

//- (BOOL)validateCrm_time_created:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* crm_time_modified;

//- (BOOL)validateCrm_time_modified:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lead_assigned_user_id;

//- (BOOL)validateLead_assigned_user_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lead_assigned_user_name;

//- (BOOL)validateLead_assigned_user_name:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lead_company;

//- (BOOL)validateLead_company:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* lead_company_annualrevenue;

@property (atomic) int16_t lead_company_annualrevenueValue;
- (int16_t)lead_company_annualrevenueValue;
- (void)setLead_company_annualrevenueValue:(int16_t)value_;

//- (BOOL)validateLead_company_annualrevenue:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lead_company_industry;

//- (BOOL)validateLead_company_industry:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* lead_company_noofemployees;

@property (atomic) int16_t lead_company_noofemployeesValue;
- (int16_t)lead_company_noofemployeesValue;
- (void)setLead_company_noofemployeesValue:(int16_t)value_;

//- (BOOL)validateLead_company_noofemployees:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lead_company_website;

//- (BOOL)validateLead_company_website:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lead_description;

//- (BOOL)validateLead_description:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lead_designation;

//- (BOOL)validateLead_designation:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lead_email;

//- (BOOL)validateLead_email:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lead_fax;

//- (BOOL)validateLead_fax:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lead_firstname;

//- (BOOL)validateLead_firstname:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lead_lastname;

//- (BOOL)validateLead_lastname:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lead_lead_no;

//- (BOOL)validateLead_lead_no:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lead_leadid;

//- (BOOL)validateLead_leadid:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lead_leadsource;

//- (BOOL)validateLead_leadsource:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lead_leadstatus;

//- (BOOL)validateLead_leadstatus:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lead_mobile;

//- (BOOL)validateLead_mobile:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lead_phone;

//- (BOOL)validateLead_phone:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lead_rating;

//- (BOOL)validateLead_rating:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lead_salutationtype;

//- (BOOL)validateLead_salutationtype:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* lead_yahooid;

//- (BOOL)validateLead_yahooid:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSData* my_custom_fields;

//- (BOOL)validateMy_custom_fields:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) LeadAddress *address;

//- (BOOL)validateAddress:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Service *service;

//- (BOOL)validateService:(id*)value_ error:(NSError**)error_;

@end

@interface _Lead (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveCrm_time_created;
- (void)setPrimitiveCrm_time_created:(NSDate*)value;

- (NSDate*)primitiveCrm_time_modified;
- (void)setPrimitiveCrm_time_modified:(NSDate*)value;

- (NSString*)primitiveLead_assigned_user_id;
- (void)setPrimitiveLead_assigned_user_id:(NSString*)value;

- (NSString*)primitiveLead_assigned_user_name;
- (void)setPrimitiveLead_assigned_user_name:(NSString*)value;

- (NSString*)primitiveLead_company;
- (void)setPrimitiveLead_company:(NSString*)value;

- (NSNumber*)primitiveLead_company_annualrevenue;
- (void)setPrimitiveLead_company_annualrevenue:(NSNumber*)value;

- (int16_t)primitiveLead_company_annualrevenueValue;
- (void)setPrimitiveLead_company_annualrevenueValue:(int16_t)value_;

- (NSString*)primitiveLead_company_industry;
- (void)setPrimitiveLead_company_industry:(NSString*)value;

- (NSNumber*)primitiveLead_company_noofemployees;
- (void)setPrimitiveLead_company_noofemployees:(NSNumber*)value;

- (int16_t)primitiveLead_company_noofemployeesValue;
- (void)setPrimitiveLead_company_noofemployeesValue:(int16_t)value_;

- (NSString*)primitiveLead_company_website;
- (void)setPrimitiveLead_company_website:(NSString*)value;

- (NSString*)primitiveLead_description;
- (void)setPrimitiveLead_description:(NSString*)value;

- (NSString*)primitiveLead_designation;
- (void)setPrimitiveLead_designation:(NSString*)value;

- (NSString*)primitiveLead_email;
- (void)setPrimitiveLead_email:(NSString*)value;

- (NSString*)primitiveLead_fax;
- (void)setPrimitiveLead_fax:(NSString*)value;

- (NSString*)primitiveLead_firstname;
- (void)setPrimitiveLead_firstname:(NSString*)value;

- (NSString*)primitiveLead_lastname;
- (void)setPrimitiveLead_lastname:(NSString*)value;

- (NSString*)primitiveLead_lead_no;
- (void)setPrimitiveLead_lead_no:(NSString*)value;

- (NSString*)primitiveLead_leadid;
- (void)setPrimitiveLead_leadid:(NSString*)value;

- (NSString*)primitiveLead_leadsource;
- (void)setPrimitiveLead_leadsource:(NSString*)value;

- (NSString*)primitiveLead_leadstatus;
- (void)setPrimitiveLead_leadstatus:(NSString*)value;

- (NSString*)primitiveLead_mobile;
- (void)setPrimitiveLead_mobile:(NSString*)value;

- (NSString*)primitiveLead_phone;
- (void)setPrimitiveLead_phone:(NSString*)value;

- (NSString*)primitiveLead_rating;
- (void)setPrimitiveLead_rating:(NSString*)value;

- (NSString*)primitiveLead_salutationtype;
- (void)setPrimitiveLead_salutationtype:(NSString*)value;

- (NSString*)primitiveLead_yahooid;
- (void)setPrimitiveLead_yahooid:(NSString*)value;

- (NSData*)primitiveMy_custom_fields;
- (void)setPrimitiveMy_custom_fields:(NSData*)value;

- (LeadAddress*)primitiveAddress;
- (void)setPrimitiveAddress:(LeadAddress*)value;

- (Service*)primitiveService;
- (void)setPrimitiveService:(Service*)value;

@end
