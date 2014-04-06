// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Contact.h instead.

#import <CoreData/CoreData.h>


extern const struct ContactAttributes {
	__unsafe_unretained NSString *crm_account_id;
	__unsafe_unretained NSString *crm_account_name;
	__unsafe_unretained NSString *crm_assigned_user_id;
	__unsafe_unretained NSString *crm_assigned_user_name;
	__unsafe_unretained NSString *crm_assistant;
	__unsafe_unretained NSString *crm_assistantphone;
	__unsafe_unretained NSString *crm_birthday;
	__unsafe_unretained NSString *crm_contact_image;
	__unsafe_unretained NSString *crm_contact_no;
	__unsafe_unretained NSString *crm_department;
	__unsafe_unretained NSString *crm_description;
	__unsafe_unretained NSString *crm_email;
	__unsafe_unretained NSString *crm_fax;
	__unsafe_unretained NSString *crm_firstname;
	__unsafe_unretained NSString *crm_homephone;
	__unsafe_unretained NSString *crm_id;
	__unsafe_unretained NSString *crm_lastname;
	__unsafe_unretained NSString *crm_leadsource;
	__unsafe_unretained NSString *crm_mobile;
	__unsafe_unretained NSString *crm_otherphone;
	__unsafe_unretained NSString *crm_phone;
	__unsafe_unretained NSString *crm_reports_to_id;
	__unsafe_unretained NSString *crm_reports_to_name;
	__unsafe_unretained NSString *crm_salutationtype;
	__unsafe_unretained NSString *crm_time_created;
	__unsafe_unretained NSString *crm_time_modified;
	__unsafe_unretained NSString *crm_title;
	__unsafe_unretained NSString *crm_yahooid;
	__unsafe_unretained NSString *my_custom_fields;
} ContactAttributes;

extern const struct ContactRelationships {
	__unsafe_unretained NSString *address;
	__unsafe_unretained NSString *service;
} ContactRelationships;

extern const struct ContactFetchedProperties {
} ContactFetchedProperties;

@class ContactAddress;
@class Service;








@class NSObject;






















@interface ContactID : NSManagedObjectID {}
@end

@interface _Contact : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ContactID*)objectID;





@property (nonatomic, strong) NSString* crm_account_id;



//- (BOOL)validateCrm_account_id:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_account_name;



//- (BOOL)validateCrm_account_name:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_assigned_user_id;



//- (BOOL)validateCrm_assigned_user_id:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_assigned_user_name;



//- (BOOL)validateCrm_assigned_user_name:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_assistant;



//- (BOOL)validateCrm_assistant:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_assistantphone;



//- (BOOL)validateCrm_assistantphone:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_birthday;



//- (BOOL)validateCrm_birthday:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) id crm_contact_image;



//- (BOOL)validateCrm_contact_image:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_contact_no;



//- (BOOL)validateCrm_contact_no:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_department;



//- (BOOL)validateCrm_department:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_description;



//- (BOOL)validateCrm_description:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_email;



//- (BOOL)validateCrm_email:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_fax;



//- (BOOL)validateCrm_fax:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_firstname;



//- (BOOL)validateCrm_firstname:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_homephone;



//- (BOOL)validateCrm_homephone:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_id;



//- (BOOL)validateCrm_id:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_lastname;



//- (BOOL)validateCrm_lastname:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_leadsource;



//- (BOOL)validateCrm_leadsource:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_mobile;



//- (BOOL)validateCrm_mobile:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_otherphone;



//- (BOOL)validateCrm_otherphone:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_phone;



//- (BOOL)validateCrm_phone:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_reports_to_id;



//- (BOOL)validateCrm_reports_to_id:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_reports_to_name;



//- (BOOL)validateCrm_reports_to_name:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_salutationtype;



//- (BOOL)validateCrm_salutationtype:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* crm_time_created;



//- (BOOL)validateCrm_time_created:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* crm_time_modified;



//- (BOOL)validateCrm_time_modified:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_title;



//- (BOOL)validateCrm_title:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_yahooid;



//- (BOOL)validateCrm_yahooid:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSData* my_custom_fields;



//- (BOOL)validateMy_custom_fields:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) ContactAddress *address;

//- (BOOL)validateAddress:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) Service *service;

//- (BOOL)validateService:(id*)value_ error:(NSError**)error_;





@end

@interface _Contact (CoreDataGeneratedAccessors)

@end

@interface _Contact (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveCrm_account_id;
- (void)setPrimitiveCrm_account_id:(NSString*)value;




- (NSString*)primitiveCrm_account_name;
- (void)setPrimitiveCrm_account_name:(NSString*)value;




- (NSString*)primitiveCrm_assigned_user_id;
- (void)setPrimitiveCrm_assigned_user_id:(NSString*)value;




- (NSString*)primitiveCrm_assigned_user_name;
- (void)setPrimitiveCrm_assigned_user_name:(NSString*)value;




- (NSString*)primitiveCrm_assistant;
- (void)setPrimitiveCrm_assistant:(NSString*)value;




- (NSString*)primitiveCrm_assistantphone;
- (void)setPrimitiveCrm_assistantphone:(NSString*)value;




- (NSString*)primitiveCrm_birthday;
- (void)setPrimitiveCrm_birthday:(NSString*)value;




- (id)primitiveCrm_contact_image;
- (void)setPrimitiveCrm_contact_image:(id)value;




- (NSString*)primitiveCrm_contact_no;
- (void)setPrimitiveCrm_contact_no:(NSString*)value;




- (NSString*)primitiveCrm_department;
- (void)setPrimitiveCrm_department:(NSString*)value;




- (NSString*)primitiveCrm_description;
- (void)setPrimitiveCrm_description:(NSString*)value;




- (NSString*)primitiveCrm_email;
- (void)setPrimitiveCrm_email:(NSString*)value;




- (NSString*)primitiveCrm_fax;
- (void)setPrimitiveCrm_fax:(NSString*)value;




- (NSString*)primitiveCrm_firstname;
- (void)setPrimitiveCrm_firstname:(NSString*)value;




- (NSString*)primitiveCrm_homephone;
- (void)setPrimitiveCrm_homephone:(NSString*)value;




- (NSString*)primitiveCrm_id;
- (void)setPrimitiveCrm_id:(NSString*)value;




- (NSString*)primitiveCrm_lastname;
- (void)setPrimitiveCrm_lastname:(NSString*)value;




- (NSString*)primitiveCrm_leadsource;
- (void)setPrimitiveCrm_leadsource:(NSString*)value;




- (NSString*)primitiveCrm_mobile;
- (void)setPrimitiveCrm_mobile:(NSString*)value;




- (NSString*)primitiveCrm_otherphone;
- (void)setPrimitiveCrm_otherphone:(NSString*)value;




- (NSString*)primitiveCrm_phone;
- (void)setPrimitiveCrm_phone:(NSString*)value;




- (NSString*)primitiveCrm_reports_to_id;
- (void)setPrimitiveCrm_reports_to_id:(NSString*)value;




- (NSString*)primitiveCrm_reports_to_name;
- (void)setPrimitiveCrm_reports_to_name:(NSString*)value;




- (NSString*)primitiveCrm_salutationtype;
- (void)setPrimitiveCrm_salutationtype:(NSString*)value;




- (NSDate*)primitiveCrm_time_created;
- (void)setPrimitiveCrm_time_created:(NSDate*)value;




- (NSDate*)primitiveCrm_time_modified;
- (void)setPrimitiveCrm_time_modified:(NSDate*)value;




- (NSString*)primitiveCrm_title;
- (void)setPrimitiveCrm_title:(NSString*)value;




- (NSString*)primitiveCrm_yahooid;
- (void)setPrimitiveCrm_yahooid:(NSString*)value;




- (NSData*)primitiveMy_custom_fields;
- (void)setPrimitiveMy_custom_fields:(NSData*)value;





- (ContactAddress*)primitiveAddress;
- (void)setPrimitiveAddress:(ContactAddress*)value;



- (Service*)primitiveService;
- (void)setPrimitiveService:(Service*)value;


@end
