// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SyncToken.h instead.

@import CoreData;

extern const struct SyncTokenAttributes {
	__unsafe_unretained NSString *datetime;
	__unsafe_unretained NSString *module;
	__unsafe_unretained NSString *token;
} SyncTokenAttributes;

extern const struct SyncTokenRelationships {
	__unsafe_unretained NSString *service;
} SyncTokenRelationships;

@class Service;

@interface SyncTokenID : NSManagedObjectID {}
@end

@interface _SyncToken : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) SyncTokenID* objectID;

@property (nonatomic, strong) NSDate* datetime;

//- (BOOL)validateDatetime:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* module;

//- (BOOL)validateModule:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* token;

//- (BOOL)validateToken:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Service *service;

//- (BOOL)validateService:(id*)value_ error:(NSError**)error_;

@end

@interface _SyncToken (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveDatetime;
- (void)setPrimitiveDatetime:(NSDate*)value;

- (NSString*)primitiveModule;
- (void)setPrimitiveModule:(NSString*)value;

- (NSString*)primitiveToken;
- (void)setPrimitiveToken:(NSString*)value;

- (Service*)primitiveService;
- (void)setPrimitiveService:(Service*)value;

@end
