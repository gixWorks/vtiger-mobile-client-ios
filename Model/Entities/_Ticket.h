// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Ticket.h instead.

#import <CoreData/CoreData.h>


extern const struct TicketAttributes {
	__unsafe_unretained NSString *crm_assigned_user_id;
	__unsafe_unretained NSString *crm_assigned_user_name;
	__unsafe_unretained NSString *crm_days;
	__unsafe_unretained NSString *crm_description;
	__unsafe_unretained NSString *crm_hours;
	__unsafe_unretained NSString *crm_id;
	__unsafe_unretained NSString *crm_parent_id;
	__unsafe_unretained NSString *crm_parent_name;
	__unsafe_unretained NSString *crm_parent_type;
	__unsafe_unretained NSString *crm_product_id;
	__unsafe_unretained NSString *crm_product_name;
	__unsafe_unretained NSString *crm_solution;
	__unsafe_unretained NSString *crm_ticket_no;
	__unsafe_unretained NSString *crm_ticketcategory;
	__unsafe_unretained NSString *crm_ticketpriority;
	__unsafe_unretained NSString *crm_ticketseverity;
	__unsafe_unretained NSString *crm_ticketstatus;
	__unsafe_unretained NSString *crm_tickettitle;
	__unsafe_unretained NSString *crm_time_created;
	__unsafe_unretained NSString *crm_time_modified;
	__unsafe_unretained NSString *my_custom_fields;
} TicketAttributes;

extern const struct TicketRelationships {
	__unsafe_unretained NSString *service;
} TicketRelationships;

extern const struct TicketFetchedProperties {
} TicketFetchedProperties;

@class Service;























@interface TicketID : NSManagedObjectID {}
@end

@interface _Ticket : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (TicketID*)objectID;





@property (nonatomic, strong) NSString* crm_assigned_user_id;



//- (BOOL)validateCrm_assigned_user_id:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_assigned_user_name;



//- (BOOL)validateCrm_assigned_user_name:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* crm_days;



@property int16_t crm_daysValue;
- (int16_t)crm_daysValue;
- (void)setCrm_daysValue:(int16_t)value_;

//- (BOOL)validateCrm_days:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_description;



//- (BOOL)validateCrm_description:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* crm_hours;



@property int16_t crm_hoursValue;
- (int16_t)crm_hoursValue;
- (void)setCrm_hoursValue:(int16_t)value_;

//- (BOOL)validateCrm_hours:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_id;



//- (BOOL)validateCrm_id:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_parent_id;



//- (BOOL)validateCrm_parent_id:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_parent_name;



//- (BOOL)validateCrm_parent_name:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_parent_type;



//- (BOOL)validateCrm_parent_type:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_product_id;



//- (BOOL)validateCrm_product_id:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_product_name;



//- (BOOL)validateCrm_product_name:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_solution;



//- (BOOL)validateCrm_solution:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_ticket_no;



//- (BOOL)validateCrm_ticket_no:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_ticketcategory;



//- (BOOL)validateCrm_ticketcategory:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_ticketpriority;



//- (BOOL)validateCrm_ticketpriority:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_ticketseverity;



//- (BOOL)validateCrm_ticketseverity:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_ticketstatus;



//- (BOOL)validateCrm_ticketstatus:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_tickettitle;



//- (BOOL)validateCrm_tickettitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* crm_time_created;



//- (BOOL)validateCrm_time_created:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* crm_time_modified;



//- (BOOL)validateCrm_time_modified:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSData* my_custom_fields;



//- (BOOL)validateMy_custom_fields:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Service *service;

//- (BOOL)validateService:(id*)value_ error:(NSError**)error_;





@end

@interface _Ticket (CoreDataGeneratedAccessors)

@end

@interface _Ticket (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveCrm_assigned_user_id;
- (void)setPrimitiveCrm_assigned_user_id:(NSString*)value;




- (NSString*)primitiveCrm_assigned_user_name;
- (void)setPrimitiveCrm_assigned_user_name:(NSString*)value;




- (NSNumber*)primitiveCrm_days;
- (void)setPrimitiveCrm_days:(NSNumber*)value;

- (int16_t)primitiveCrm_daysValue;
- (void)setPrimitiveCrm_daysValue:(int16_t)value_;




- (NSString*)primitiveCrm_description;
- (void)setPrimitiveCrm_description:(NSString*)value;




- (NSNumber*)primitiveCrm_hours;
- (void)setPrimitiveCrm_hours:(NSNumber*)value;

- (int16_t)primitiveCrm_hoursValue;
- (void)setPrimitiveCrm_hoursValue:(int16_t)value_;




- (NSString*)primitiveCrm_id;
- (void)setPrimitiveCrm_id:(NSString*)value;




- (NSString*)primitiveCrm_parent_id;
- (void)setPrimitiveCrm_parent_id:(NSString*)value;




- (NSString*)primitiveCrm_parent_name;
- (void)setPrimitiveCrm_parent_name:(NSString*)value;




- (NSString*)primitiveCrm_parent_type;
- (void)setPrimitiveCrm_parent_type:(NSString*)value;




- (NSString*)primitiveCrm_product_id;
- (void)setPrimitiveCrm_product_id:(NSString*)value;




- (NSString*)primitiveCrm_product_name;
- (void)setPrimitiveCrm_product_name:(NSString*)value;




- (NSString*)primitiveCrm_solution;
- (void)setPrimitiveCrm_solution:(NSString*)value;




- (NSString*)primitiveCrm_ticket_no;
- (void)setPrimitiveCrm_ticket_no:(NSString*)value;




- (NSString*)primitiveCrm_ticketcategory;
- (void)setPrimitiveCrm_ticketcategory:(NSString*)value;




- (NSString*)primitiveCrm_ticketpriority;
- (void)setPrimitiveCrm_ticketpriority:(NSString*)value;




- (NSString*)primitiveCrm_ticketseverity;
- (void)setPrimitiveCrm_ticketseverity:(NSString*)value;




- (NSString*)primitiveCrm_ticketstatus;
- (void)setPrimitiveCrm_ticketstatus:(NSString*)value;




- (NSString*)primitiveCrm_tickettitle;
- (void)setPrimitiveCrm_tickettitle:(NSString*)value;




- (NSDate*)primitiveCrm_time_created;
- (void)setPrimitiveCrm_time_created:(NSDate*)value;




- (NSDate*)primitiveCrm_time_modified;
- (void)setPrimitiveCrm_time_modified:(NSDate*)value;




- (NSData*)primitiveMy_custom_fields;
- (void)setPrimitiveMy_custom_fields:(NSData*)value;





- (Service*)primitiveService;
- (void)setPrimitiveService:(Service*)value;


@end
