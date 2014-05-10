// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to EnabledModules.h instead.

#import <CoreData/CoreData.h>


extern const struct EnabledModulesAttributes {
	__unsafe_unretained NSString *crm_name;
	__unsafe_unretained NSString *enabled;
} EnabledModulesAttributes;

extern const struct EnabledModulesRelationships {
	__unsafe_unretained NSString *service;
} EnabledModulesRelationships;

extern const struct EnabledModulesFetchedProperties {
} EnabledModulesFetchedProperties;

@class Service;




@interface EnabledModulesID : NSManagedObjectID {}
@end

@interface _EnabledModules : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (EnabledModulesID*)objectID;





@property (nonatomic, strong) NSString* crm_name;



//- (BOOL)validateCrm_name:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* enabled;



@property BOOL enabledValue;
- (BOOL)enabledValue;
- (void)setEnabledValue:(BOOL)value_;

//- (BOOL)validateEnabled:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Service *service;

//- (BOOL)validateService:(id*)value_ error:(NSError**)error_;





@end

@interface _EnabledModules (CoreDataGeneratedAccessors)

@end

@interface _EnabledModules (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveCrm_name;
- (void)setPrimitiveCrm_name:(NSString*)value;




- (NSNumber*)primitiveEnabled;
- (void)setPrimitiveEnabled:(NSNumber*)value;

- (BOOL)primitiveEnabledValue;
- (void)setPrimitiveEnabledValue:(BOOL)value_;





- (Service*)primitiveService;
- (void)setPrimitiveService:(Service*)value;


@end
