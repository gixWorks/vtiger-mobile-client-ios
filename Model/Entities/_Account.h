// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Account.h instead.

#import <CoreData/CoreData.h>

extern const struct AccountAttributes {
	__unsafe_unretained NSString *crm_account_no;
	__unsafe_unretained NSString *crm_accountname;
	__unsafe_unretained NSString *crm_accounttype;
	__unsafe_unretained NSString *crm_annual_revenue;
	__unsafe_unretained NSString *crm_assigned_user_id;
	__unsafe_unretained NSString *crm_assigned_user_name;
	__unsafe_unretained NSString *crm_description;
	__unsafe_unretained NSString *crm_email1;
	__unsafe_unretained NSString *crm_email2;
	__unsafe_unretained NSString *crm_emailoptout;
	__unsafe_unretained NSString *crm_employees;
	__unsafe_unretained NSString *crm_fax;
	__unsafe_unretained NSString *crm_id;
	__unsafe_unretained NSString *crm_industry;
	__unsafe_unretained NSString *crm_memberof_id;
	__unsafe_unretained NSString *crm_memberof_name;
	__unsafe_unretained NSString *crm_notify_owner;
	__unsafe_unretained NSString *crm_otherphone;
	__unsafe_unretained NSString *crm_ownership;
	__unsafe_unretained NSString *crm_phone;
	__unsafe_unretained NSString *crm_rating;
	__unsafe_unretained NSString *crm_siccode;
	__unsafe_unretained NSString *crm_tickersymbol;
	__unsafe_unretained NSString *crm_time_created;
	__unsafe_unretained NSString *crm_time_modified;
	__unsafe_unretained NSString *crm_website;
	__unsafe_unretained NSString *my_custom_fields;
} AccountAttributes;

extern const struct AccountRelationships {
	__unsafe_unretained NSString *address;
	__unsafe_unretained NSString *service;
} AccountRelationships;

@class AccountAddress;
@class Service;

@interface AccountID : NSManagedObjectID {}
@end

@interface _Account : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) AccountID* objectID;

@property (nonatomic, strong) NSString* crm_account_no;

//- (BOOL)validateCrm_account_no:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_accountname;

//- (BOOL)validateCrm_accountname:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_accounttype;

//- (BOOL)validateCrm_accounttype:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* crm_annual_revenue;

@property (atomic) int16_t crm_annual_revenueValue;
- (int16_t)crm_annual_revenueValue;
- (void)setCrm_annual_revenueValue:(int16_t)value_;

//- (BOOL)validateCrm_annual_revenue:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_assigned_user_id;

//- (BOOL)validateCrm_assigned_user_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_assigned_user_name;

//- (BOOL)validateCrm_assigned_user_name:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_description;

//- (BOOL)validateCrm_description:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_email1;

//- (BOOL)validateCrm_email1:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_email2;

//- (BOOL)validateCrm_email2:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* crm_emailoptout;

@property (atomic) BOOL crm_emailoptoutValue;
- (BOOL)crm_emailoptoutValue;
- (void)setCrm_emailoptoutValue:(BOOL)value_;

//- (BOOL)validateCrm_emailoptout:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* crm_employees;

@property (atomic) int16_t crm_employeesValue;
- (int16_t)crm_employeesValue;
- (void)setCrm_employeesValue:(int16_t)value_;

//- (BOOL)validateCrm_employees:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_fax;

//- (BOOL)validateCrm_fax:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_id;

//- (BOOL)validateCrm_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_industry;

//- (BOOL)validateCrm_industry:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_memberof_id;

//- (BOOL)validateCrm_memberof_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_memberof_name;

//- (BOOL)validateCrm_memberof_name:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* crm_notify_owner;

@property (atomic) BOOL crm_notify_ownerValue;
- (BOOL)crm_notify_ownerValue;
- (void)setCrm_notify_ownerValue:(BOOL)value_;

//- (BOOL)validateCrm_notify_owner:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_otherphone;

//- (BOOL)validateCrm_otherphone:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_ownership;

//- (BOOL)validateCrm_ownership:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_phone;

//- (BOOL)validateCrm_phone:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_rating;

//- (BOOL)validateCrm_rating:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_siccode;

//- (BOOL)validateCrm_siccode:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_tickersymbol;

//- (BOOL)validateCrm_tickersymbol:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* crm_time_created;

//- (BOOL)validateCrm_time_created:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* crm_time_modified;

//- (BOOL)validateCrm_time_modified:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_website;

//- (BOOL)validateCrm_website:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSData* my_custom_fields;

//- (BOOL)validateMy_custom_fields:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) AccountAddress *address;

//- (BOOL)validateAddress:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Service *service;

//- (BOOL)validateService:(id*)value_ error:(NSError**)error_;

@end

@interface _Account (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveCrm_account_no;
- (void)setPrimitiveCrm_account_no:(NSString*)value;

- (NSString*)primitiveCrm_accountname;
- (void)setPrimitiveCrm_accountname:(NSString*)value;

- (NSString*)primitiveCrm_accounttype;
- (void)setPrimitiveCrm_accounttype:(NSString*)value;

- (NSNumber*)primitiveCrm_annual_revenue;
- (void)setPrimitiveCrm_annual_revenue:(NSNumber*)value;

- (int16_t)primitiveCrm_annual_revenueValue;
- (void)setPrimitiveCrm_annual_revenueValue:(int16_t)value_;

- (NSString*)primitiveCrm_assigned_user_id;
- (void)setPrimitiveCrm_assigned_user_id:(NSString*)value;

- (NSString*)primitiveCrm_assigned_user_name;
- (void)setPrimitiveCrm_assigned_user_name:(NSString*)value;

- (NSString*)primitiveCrm_description;
- (void)setPrimitiveCrm_description:(NSString*)value;

- (NSString*)primitiveCrm_email1;
- (void)setPrimitiveCrm_email1:(NSString*)value;

- (NSString*)primitiveCrm_email2;
- (void)setPrimitiveCrm_email2:(NSString*)value;

- (NSNumber*)primitiveCrm_emailoptout;
- (void)setPrimitiveCrm_emailoptout:(NSNumber*)value;

- (BOOL)primitiveCrm_emailoptoutValue;
- (void)setPrimitiveCrm_emailoptoutValue:(BOOL)value_;

- (NSNumber*)primitiveCrm_employees;
- (void)setPrimitiveCrm_employees:(NSNumber*)value;

- (int16_t)primitiveCrm_employeesValue;
- (void)setPrimitiveCrm_employeesValue:(int16_t)value_;

- (NSString*)primitiveCrm_fax;
- (void)setPrimitiveCrm_fax:(NSString*)value;

- (NSString*)primitiveCrm_id;
- (void)setPrimitiveCrm_id:(NSString*)value;

- (NSString*)primitiveCrm_industry;
- (void)setPrimitiveCrm_industry:(NSString*)value;

- (NSString*)primitiveCrm_memberof_id;
- (void)setPrimitiveCrm_memberof_id:(NSString*)value;

- (NSString*)primitiveCrm_memberof_name;
- (void)setPrimitiveCrm_memberof_name:(NSString*)value;

- (NSNumber*)primitiveCrm_notify_owner;
- (void)setPrimitiveCrm_notify_owner:(NSNumber*)value;

- (BOOL)primitiveCrm_notify_ownerValue;
- (void)setPrimitiveCrm_notify_ownerValue:(BOOL)value_;

- (NSString*)primitiveCrm_otherphone;
- (void)setPrimitiveCrm_otherphone:(NSString*)value;

- (NSString*)primitiveCrm_ownership;
- (void)setPrimitiveCrm_ownership:(NSString*)value;

- (NSString*)primitiveCrm_phone;
- (void)setPrimitiveCrm_phone:(NSString*)value;

- (NSString*)primitiveCrm_rating;
- (void)setPrimitiveCrm_rating:(NSString*)value;

- (NSString*)primitiveCrm_siccode;
- (void)setPrimitiveCrm_siccode:(NSString*)value;

- (NSString*)primitiveCrm_tickersymbol;
- (void)setPrimitiveCrm_tickersymbol:(NSString*)value;

- (NSDate*)primitiveCrm_time_created;
- (void)setPrimitiveCrm_time_created:(NSDate*)value;

- (NSDate*)primitiveCrm_time_modified;
- (void)setPrimitiveCrm_time_modified:(NSDate*)value;

- (NSString*)primitiveCrm_website;
- (void)setPrimitiveCrm_website:(NSString*)value;

- (NSData*)primitiveMy_custom_fields;
- (void)setPrimitiveMy_custom_fields:(NSData*)value;

- (AccountAddress*)primitiveAddress;
- (void)setPrimitiveAddress:(AccountAddress*)value;

- (Service*)primitiveService;
- (void)setPrimitiveService:(Service*)value;

@end
