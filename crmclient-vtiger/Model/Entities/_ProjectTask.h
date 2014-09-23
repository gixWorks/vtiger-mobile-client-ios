// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ProjectTask.h instead.

@import CoreData;
#import "CalendarItem.h"

extern const struct ProjectTaskAttributes {
	__unsafe_unretained NSString *crm_assigned_user_id;
	__unsafe_unretained NSString *crm_assigned_user_name;
	__unsafe_unretained NSString *crm_hours;
	__unsafe_unretained NSString *crm_id;
	__unsafe_unretained NSString *crm_modified_by_id;
	__unsafe_unretained NSString *crm_modified_by_name;
	__unsafe_unretained NSString *crm_priority;
	__unsafe_unretained NSString *crm_progress;
	__unsafe_unretained NSString *crm_related_project_id;
	__unsafe_unretained NSString *crm_related_project_name;
	__unsafe_unretained NSString *crm_status;
	__unsafe_unretained NSString *crm_task_no;
	__unsafe_unretained NSString *crm_task_number;
	__unsafe_unretained NSString *crm_time_created;
	__unsafe_unretained NSString *crm_time_modified;
	__unsafe_unretained NSString *crm_type;
	__unsafe_unretained NSString *my_custom_fields;
	__unsafe_unretained NSString *my_timezone;
} ProjectTaskAttributes;

extern const struct ProjectTaskRelationships {
	__unsafe_unretained NSString *project;
} ProjectTaskRelationships;

@class Project;

@interface ProjectTaskID : CalendarItemID {}
@end

@interface _ProjectTask : CalendarItem {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ProjectTaskID* objectID;

@property (nonatomic, strong) NSString* crm_assigned_user_id;

//- (BOOL)validateCrm_assigned_user_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_assigned_user_name;

//- (BOOL)validateCrm_assigned_user_name:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_hours;

//- (BOOL)validateCrm_hours:(id*)value_ error:(NSError**)error_;

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

@property (nonatomic, strong) NSString* crm_related_project_id;

//- (BOOL)validateCrm_related_project_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_related_project_name;

//- (BOOL)validateCrm_related_project_name:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_status;

//- (BOOL)validateCrm_status:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_task_no;

//- (BOOL)validateCrm_task_no:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_task_number;

//- (BOOL)validateCrm_task_number:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* crm_time_created;

//- (BOOL)validateCrm_time_created:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* crm_time_modified;

//- (BOOL)validateCrm_time_modified:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_type;

//- (BOOL)validateCrm_type:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSData* my_custom_fields;

//- (BOOL)validateMy_custom_fields:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* my_timezone;

//- (BOOL)validateMy_timezone:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Project *project;

//- (BOOL)validateProject:(id*)value_ error:(NSError**)error_;

@end

@interface _ProjectTask (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveCrm_assigned_user_id;
- (void)setPrimitiveCrm_assigned_user_id:(NSString*)value;

- (NSString*)primitiveCrm_assigned_user_name;
- (void)setPrimitiveCrm_assigned_user_name:(NSString*)value;

- (NSString*)primitiveCrm_hours;
- (void)setPrimitiveCrm_hours:(NSString*)value;

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

- (NSString*)primitiveCrm_related_project_id;
- (void)setPrimitiveCrm_related_project_id:(NSString*)value;

- (NSString*)primitiveCrm_related_project_name;
- (void)setPrimitiveCrm_related_project_name:(NSString*)value;

- (NSString*)primitiveCrm_status;
- (void)setPrimitiveCrm_status:(NSString*)value;

- (NSString*)primitiveCrm_task_no;
- (void)setPrimitiveCrm_task_no:(NSString*)value;

- (NSString*)primitiveCrm_task_number;
- (void)setPrimitiveCrm_task_number:(NSString*)value;

- (NSDate*)primitiveCrm_time_created;
- (void)setPrimitiveCrm_time_created:(NSDate*)value;

- (NSDate*)primitiveCrm_time_modified;
- (void)setPrimitiveCrm_time_modified:(NSDate*)value;

- (NSString*)primitiveCrm_type;
- (void)setPrimitiveCrm_type:(NSString*)value;

- (NSData*)primitiveMy_custom_fields;
- (void)setPrimitiveMy_custom_fields:(NSData*)value;

- (NSString*)primitiveMy_timezone;
- (void)setPrimitiveMy_timezone:(NSString*)value;

- (Project*)primitiveProject;
- (void)setPrimitiveProject:(Project*)value;

@end
