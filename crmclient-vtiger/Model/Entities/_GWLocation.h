// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GWLocation.h instead.

@import CoreData;

extern const struct GWLocationAttributes {
	__unsafe_unretained NSString *gw_address;
	__unsafe_unretained NSString *gw_latitude;
	__unsafe_unretained NSString *gw_longitude;
	__unsafe_unretained NSString *gw_name;
} GWLocationAttributes;

extern const struct GWLocationRelationships {
	__unsafe_unretained NSString *service;
} GWLocationRelationships;

@class Service;

@interface GWLocationID : NSManagedObjectID {}
@end

@interface _GWLocation : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) GWLocationID* objectID;

@property (nonatomic, strong) NSString* gw_address;

//- (BOOL)validateGw_address:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* gw_latitude;

@property (atomic) double gw_latitudeValue;
- (double)gw_latitudeValue;
- (void)setGw_latitudeValue:(double)value_;

//- (BOOL)validateGw_latitude:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* gw_longitude;

@property (atomic) double gw_longitudeValue;
- (double)gw_longitudeValue;
- (void)setGw_longitudeValue:(double)value_;

//- (BOOL)validateGw_longitude:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* gw_name;

//- (BOOL)validateGw_name:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Service *service;

//- (BOOL)validateService:(id*)value_ error:(NSError**)error_;

@end

@interface _GWLocation (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveGw_address;
- (void)setPrimitiveGw_address:(NSString*)value;

- (NSNumber*)primitiveGw_latitude;
- (void)setPrimitiveGw_latitude:(NSNumber*)value;

- (double)primitiveGw_latitudeValue;
- (void)setPrimitiveGw_latitudeValue:(double)value_;

- (NSNumber*)primitiveGw_longitude;
- (void)setPrimitiveGw_longitude:(NSNumber*)value;

- (double)primitiveGw_longitudeValue;
- (void)setPrimitiveGw_longitudeValue:(double)value_;

- (NSString*)primitiveGw_name;
- (void)setPrimitiveGw_name:(NSString*)value;

- (Service*)primitiveService;
- (void)setPrimitiveService:(Service*)value;

@end
