// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CRMErrorMessage.h instead.

#import <CoreData/CoreData.h>


extern const struct CRMErrorMessageAttributes {
	__unsafe_unretained NSString *crm_message;
	__unsafe_unretained NSString *crm_timestamp;
} CRMErrorMessageAttributes;

extern const struct CRMErrorMessageRelationships {
	__unsafe_unretained NSString *service;
} CRMErrorMessageRelationships;

extern const struct CRMErrorMessageFetchedProperties {
} CRMErrorMessageFetchedProperties;

@class Service;




@interface CRMErrorMessageID : NSManagedObjectID {}
@end

@interface _CRMErrorMessage : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (CRMErrorMessageID*)objectID;





@property (nonatomic, strong) NSString* crm_message;



//- (BOOL)validateCrm_message:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* crm_timestamp;



//- (BOOL)validateCrm_timestamp:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Service *service;

//- (BOOL)validateService:(id*)value_ error:(NSError**)error_;





@end

@interface _CRMErrorMessage (CoreDataGeneratedAccessors)

@end

@interface _CRMErrorMessage (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveCrm_message;
- (void)setPrimitiveCrm_message:(NSString*)value;




- (NSDate*)primitiveCrm_timestamp;
- (void)setPrimitiveCrm_timestamp:(NSDate*)value;





- (Service*)primitiveService;
- (void)setPrimitiveService:(Service*)value;


@end
