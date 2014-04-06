// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Group.h instead.

#import <CoreData/CoreData.h>


extern const struct GroupAttributes {
	__unsafe_unretained NSString *crm_id;
	__unsafe_unretained NSString *crm_label;
} GroupAttributes;

extern const struct GroupRelationships {
	__unsafe_unretained NSString *service;
} GroupRelationships;

extern const struct GroupFetchedProperties {
} GroupFetchedProperties;

@class Service;




@interface GroupID : NSManagedObjectID {}
@end

@interface _Group : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (GroupID*)objectID;





@property (nonatomic, strong) NSString* crm_id;



//- (BOOL)validateCrm_id:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_label;



//- (BOOL)validateCrm_label:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Service *service;

//- (BOOL)validateService:(id*)value_ error:(NSError**)error_;





@end

@interface _Group (CoreDataGeneratedAccessors)

@end

@interface _Group (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveCrm_id;
- (void)setPrimitiveCrm_id:(NSString*)value;




- (NSString*)primitiveCrm_label;
- (void)setPrimitiveCrm_label:(NSString*)value;





- (Service*)primitiveService;
- (void)setPrimitiveService:(Service*)value;


@end
