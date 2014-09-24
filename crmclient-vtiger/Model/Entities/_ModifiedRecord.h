// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ModifiedRecord.h instead.

@import CoreData;

extern const struct ModifiedRecordAttributes {
	__unsafe_unretained NSString *crm_action;
	__unsafe_unretained NSString *crm_id;
	__unsafe_unretained NSString *crm_number_of_tries;
	__unsafe_unretained NSString *crm_timestamp;
} ModifiedRecordAttributes;

@interface ModifiedRecordID : NSManagedObjectID {}
@end

@interface _ModifiedRecord : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ModifiedRecordID* objectID;

@property (nonatomic, strong) NSString* crm_action;

//- (BOOL)validateCrm_action:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_id;

//- (BOOL)validateCrm_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* crm_number_of_tries;

@property (atomic) int16_t crm_number_of_triesValue;
- (int16_t)crm_number_of_triesValue;
- (void)setCrm_number_of_triesValue:(int16_t)value_;

//- (BOOL)validateCrm_number_of_tries:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* crm_timestamp;

//- (BOOL)validateCrm_timestamp:(id*)value_ error:(NSError**)error_;

@end

@interface _ModifiedRecord (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveCrm_action;
- (void)setPrimitiveCrm_action:(NSString*)value;

- (NSString*)primitiveCrm_id;
- (void)setPrimitiveCrm_id:(NSString*)value;

- (NSNumber*)primitiveCrm_number_of_tries;
- (void)setPrimitiveCrm_number_of_tries:(NSNumber*)value;

- (int16_t)primitiveCrm_number_of_triesValue;
- (void)setPrimitiveCrm_number_of_triesValue:(int16_t)value_;

- (NSDate*)primitiveCrm_timestamp;
- (void)setPrimitiveCrm_timestamp:(NSDate*)value;

@end
