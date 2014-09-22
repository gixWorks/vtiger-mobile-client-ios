// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CalendarItem.h instead.

@import CoreData;

extern const struct CalendarItemAttributes {
	__unsafe_unretained NSString *my_datetime_end;
	__unsafe_unretained NSString *my_datetime_start;
	__unsafe_unretained NSString *my_deleted;
} CalendarItemAttributes;

extern const struct CalendarItemRelationships {
	__unsafe_unretained NSString *service;
} CalendarItemRelationships;

@class Service;

@interface CalendarItemID : NSManagedObjectID {}
@end

@interface _CalendarItem : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) CalendarItemID* objectID;

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

@end

@interface _CalendarItem (CoreDataGeneratedPrimitiveAccessors)

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
