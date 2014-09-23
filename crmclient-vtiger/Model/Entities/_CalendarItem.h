// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CalendarItem.h instead.

@import CoreData;

extern const struct CalendarItemAttributes {
	__unsafe_unretained NSString *crm_date_start;
	__unsafe_unretained NSString *crm_description;
	__unsafe_unretained NSString *crm_due_date;
	__unsafe_unretained NSString *crm_subject;
	__unsafe_unretained NSString *my_datetime_end;
	__unsafe_unretained NSString *my_datetime_start;
	__unsafe_unretained NSString *my_deleted;
} CalendarItemAttributes;

extern const struct CalendarItemRelationships {
	__unsafe_unretained NSString *service;
} CalendarItemRelationships;

extern const struct CalendarItemFetchedProperties {
	__unsafe_unretained NSString *calc_search_date;
} CalendarItemFetchedProperties;

@class Service;

@interface CalendarItemID : NSManagedObjectID {}
@end

@interface _CalendarItem : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) CalendarItemID* objectID;

@property (nonatomic, strong) NSDate* crm_date_start;

//- (BOOL)validateCrm_date_start:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_description;

//- (BOOL)validateCrm_description:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* crm_due_date;

//- (BOOL)validateCrm_due_date:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_subject;

//- (BOOL)validateCrm_subject:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* my_datetime_end;

//- (BOOL)validateMy_datetime_end:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* my_datetime_start;

//- (BOOL)validateMy_datetime_start:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* my_deleted;

@property (atomic) BOOL my_deletedValue;
- (BOOL)my_deletedValue;
- (void)setMy_deletedValue:(BOOL)value_;

//- (BOOL)validateMy_deleted:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Service *service;

//- (BOOL)validateService:(id*)value_ error:(NSError**)error_;

@property (nonatomic, readonly) NSArray *calc_search_date;

@end

@interface _CalendarItem (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveCrm_date_start;
- (void)setPrimitiveCrm_date_start:(NSDate*)value;

- (NSString*)primitiveCrm_description;
- (void)setPrimitiveCrm_description:(NSString*)value;

- (NSDate*)primitiveCrm_due_date;
- (void)setPrimitiveCrm_due_date:(NSDate*)value;

- (NSString*)primitiveCrm_subject;
- (void)setPrimitiveCrm_subject:(NSString*)value;

- (NSDate*)primitiveMy_datetime_end;
- (void)setPrimitiveMy_datetime_end:(NSDate*)value;

- (NSDate*)primitiveMy_datetime_start;
- (void)setPrimitiveMy_datetime_start:(NSDate*)value;

- (NSNumber*)primitiveMy_deleted;
- (void)setPrimitiveMy_deleted:(NSNumber*)value;

- (BOOL)primitiveMy_deletedValue;
- (void)setPrimitiveMy_deletedValue:(BOOL)value_;

- (Service*)primitiveService;
- (void)setPrimitiveService:(Service*)value;

@end