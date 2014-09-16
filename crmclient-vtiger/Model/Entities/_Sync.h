// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Sync.h instead.

#import <CoreData/CoreData.h>

extern const struct SyncAttributes {
	__unsafe_unretained NSString *syncdate;
	__unsafe_unretained NSString *syncmodule;
	__unsafe_unretained NSString *syncrecordsdeleted;
	__unsafe_unretained NSString *syncrecordsupdated;
	__unsafe_unretained NSString *syncsuccess;
	__unsafe_unretained NSString *synctoken;
} SyncAttributes;

extern const struct SyncRelationships {
	__unsafe_unretained NSString *service;
} SyncRelationships;

@class Service;

@interface SyncID : NSManagedObjectID {}
@end

@interface _Sync : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) SyncID* objectID;

@property (nonatomic, strong) NSDate* syncdate;

//- (BOOL)validateSyncdate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* syncmodule;

//- (BOOL)validateSyncmodule:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* syncrecordsdeleted;

@property (atomic) int32_t syncrecordsdeletedValue;
- (int32_t)syncrecordsdeletedValue;
- (void)setSyncrecordsdeletedValue:(int32_t)value_;

//- (BOOL)validateSyncrecordsdeleted:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* syncrecordsupdated;

@property (atomic) int32_t syncrecordsupdatedValue;
- (int32_t)syncrecordsupdatedValue;
- (void)setSyncrecordsupdatedValue:(int32_t)value_;

//- (BOOL)validateSyncrecordsupdated:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* syncsuccess;

@property (atomic) int32_t syncsuccessValue;
- (int32_t)syncsuccessValue;
- (void)setSyncsuccessValue:(int32_t)value_;

//- (BOOL)validateSyncsuccess:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* synctoken;

//- (BOOL)validateSynctoken:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Service *service;

//- (BOOL)validateService:(id*)value_ error:(NSError**)error_;

@end

@interface _Sync (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveSyncdate;
- (void)setPrimitiveSyncdate:(NSDate*)value;

- (NSString*)primitiveSyncmodule;
- (void)setPrimitiveSyncmodule:(NSString*)value;

- (NSNumber*)primitiveSyncrecordsdeleted;
- (void)setPrimitiveSyncrecordsdeleted:(NSNumber*)value;

- (int32_t)primitiveSyncrecordsdeletedValue;
- (void)setPrimitiveSyncrecordsdeletedValue:(int32_t)value_;

- (NSNumber*)primitiveSyncrecordsupdated;
- (void)setPrimitiveSyncrecordsupdated:(NSNumber*)value;

- (int32_t)primitiveSyncrecordsupdatedValue;
- (void)setPrimitiveSyncrecordsupdatedValue:(int32_t)value_;

- (NSNumber*)primitiveSyncsuccess;
- (void)setPrimitiveSyncsuccess:(NSNumber*)value;

- (int32_t)primitiveSyncsuccessValue;
- (void)setPrimitiveSyncsuccessValue:(int32_t)value_;

- (NSString*)primitiveSynctoken;
- (void)setPrimitiveSynctoken:(NSString*)value;

- (Service*)primitiveService;
- (void)setPrimitiveService:(Service*)value;

@end
