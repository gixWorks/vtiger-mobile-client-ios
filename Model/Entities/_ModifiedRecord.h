// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ModifiedRecord.h instead.

#import <CoreData/CoreData.h>

extern const struct ModifiedRecordAttributes {
	__unsafe_unretained NSString *crm_action;
	__unsafe_unretained NSString *crm_id;
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

@property (nonatomic, strong) NSDate* crm_timestamp;

//- (BOOL)validateCrm_timestamp:(id*)value_ error:(NSError**)error_;

@end

@interface _ModifiedRecord (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveCrm_action;
- (void)setPrimitiveCrm_action:(NSString*)value;

- (NSString*)primitiveCrm_id;
- (void)setPrimitiveCrm_id:(NSString*)value;

- (NSDate*)primitiveCrm_timestamp;
- (void)setPrimitiveCrm_timestamp:(NSDate*)value;

@end
