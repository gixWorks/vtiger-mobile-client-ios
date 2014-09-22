// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Project.h instead.

@import CoreData;

extern const struct ProjectAttributes {
	__unsafe_unretained NSString *crm_actualenddate;
	__unsafe_unretained NSString *crm_assigned_user_id;
	__unsafe_unretained NSString *crm_assigned_user_name;
	__unsafe_unretained NSString *crm_description;
	__unsafe_unretained NSString *crm_id;
	__unsafe_unretained NSString *crm_modified_by_id;
	__unsafe_unretained NSString *crm_modified_by_name;
	__unsafe_unretained NSString *crm_priority;
	__unsafe_unretained NSString *crm_progress;
	__unsafe_unretained NSString *crm_project_no;
	__unsafe_unretained NSString *crm_projectname;
	__unsafe_unretained NSString *crm_related_record_id;
	__unsafe_unretained NSString *crm_related_record_name;
	__unsafe_unretained NSString *crm_startdate;
	__unsafe_unretained NSString *crm_status;
	__unsafe_unretained NSString *crm_targetbudget;
	__unsafe_unretained NSString *crm_targetenddate;
	__unsafe_unretained NSString *crm_time_created;
	__unsafe_unretained NSString *crm_time_modified;
	__unsafe_unretained NSString *crm_type;
	__unsafe_unretained NSString *crm_url;
	__unsafe_unretained NSString *my_custom_fields;
} ProjectAttributes;

extern const struct ProjectRelationships {
	__unsafe_unretained NSString *projecttasks;
	__unsafe_unretained NSString *service;
} ProjectRelationships;

@class ProjectTask;
@class Service;

@interface ProjectID : NSManagedObjectID {}
@end

@interface _Project : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ProjectID* objectID;

@property (nonatomic, strong) NSDate* crm_actualenddate;

//- (BOOL)validateCrm_actualenddate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_assigned_user_id;

//- (BOOL)validateCrm_assigned_user_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_assigned_user_name;

//- (BOOL)validateCrm_assigned_user_name:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_description;

//- (BOOL)validateCrm_description:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_id;

//- (BOOL)validateCrm_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_modified_by_id;

//- (BOOL)validateCrm_modified_by_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_modified_by_name;

//- (BOOL)validateCrm_modified_by_name:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_priority;

//- (BOOL)validateCrm_priority:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_progress;

//- (BOOL)validateCrm_progress:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_project_no;

//- (BOOL)validateCrm_project_no:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_projectname;

//- (BOOL)validateCrm_projectname:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_related_record_id;

//- (BOOL)validateCrm_related_record_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_related_record_name;

//- (BOOL)validateCrm_related_record_name:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* crm_startdate;

//- (BOOL)validateCrm_startdate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_status;

//- (BOOL)validateCrm_status:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_targetbudget;

//- (BOOL)validateCrm_targetbudget:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* crm_targetenddate;

//- (BOOL)validateCrm_targetenddate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* crm_time_created;

//- (BOOL)validateCrm_time_created:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* crm_time_modified;

//- (BOOL)validateCrm_time_modified:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_type;

//- (BOOL)validateCrm_type:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_url;

//- (BOOL)validateCrm_url:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSData* my_custom_fields;

//- (BOOL)validateMy_custom_fields:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *projecttasks;

- (NSMutableSet*)projecttasksSet;

@property (nonatomic, strong) Service *service;

//- (BOOL)validateService:(id*)value_ error:(NSError**)error_;

@end

@interface _Project (ProjecttasksCoreDataGeneratedAccessors)
- (void)addProjecttasks:(NSSet*)value_;
- (void)removeProjecttasks:(NSSet*)value_;
- (void)addProjecttasksObject:(ProjectTask*)value_;
- (void)removeProjecttasksObject:(ProjectTask*)value_;

@end

@interface _Project (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveCrm_actualenddate;
- (void)setPrimitiveCrm_actualenddate:(NSDate*)value;

- (NSString*)primitiveCrm_assigned_user_id;
- (void)setPrimitiveCrm_assigned_user_id:(NSString*)value;

- (NSString*)primitiveCrm_assigned_user_name;
- (void)setPrimitiveCrm_assigned_user_name:(NSString*)value;

- (NSString*)primitiveCrm_description;
- (void)setPrimitiveCrm_description:(NSString*)value;

- (NSString*)primitiveCrm_id;
- (void)setPrimitiveCrm_id:(NSString*)value;

- (NSString*)primitiveCrm_modified_by_id;
- (void)setPrimitiveCrm_modified_by_id:(NSString*)value;

- (NSString*)primitiveCrm_modified_by_name;
- (void)setPrimitiveCrm_modified_by_name:(NSString*)value;

- (NSString*)primitiveCrm_priority;
- (void)setPrimitiveCrm_priority:(NSString*)value;

- (NSString*)primitiveCrm_progress;
- (void)setPrimitiveCrm_progress:(NSString*)value;

- (NSString*)primitiveCrm_project_no;
- (void)setPrimitiveCrm_project_no:(NSString*)value;

- (NSString*)primitiveCrm_projectname;
- (void)setPrimitiveCrm_projectname:(NSString*)value;

- (NSString*)primitiveCrm_related_record_id;
- (void)setPrimitiveCrm_related_record_id:(NSString*)value;

- (NSString*)primitiveCrm_related_record_name;
- (void)setPrimitiveCrm_related_record_name:(NSString*)value;

- (NSDate*)primitiveCrm_startdate;
- (void)setPrimitiveCrm_startdate:(NSDate*)value;

- (NSString*)primitiveCrm_status;
- (void)setPrimitiveCrm_status:(NSString*)value;

- (NSString*)primitiveCrm_targetbudget;
- (void)setPrimitiveCrm_targetbudget:(NSString*)value;

- (NSDate*)primitiveCrm_targetenddate;
- (void)setPrimitiveCrm_targetenddate:(NSDate*)value;

- (NSDate*)primitiveCrm_time_created;
- (void)setPrimitiveCrm_time_created:(NSDate*)value;

- (NSDate*)primitiveCrm_time_modified;
- (void)setPrimitiveCrm_time_modified:(NSDate*)value;

- (NSString*)primitiveCrm_type;
- (void)setPrimitiveCrm_type:(NSString*)value;

- (NSString*)primitiveCrm_url;
- (void)setPrimitiveCrm_url:(NSString*)value;

- (NSData*)primitiveMy_custom_fields;
- (void)setPrimitiveMy_custom_fields:(NSData*)value;

- (NSMutableSet*)primitiveProjecttasks;
- (void)setPrimitiveProjecttasks:(NSMutableSet*)value;

- (Service*)primitiveService;
- (void)setPrimitiveService:(Service*)value;

@end
