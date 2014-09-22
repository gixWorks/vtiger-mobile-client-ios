// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Project.m instead.

#import "_Project.h"

const struct ProjectAttributes ProjectAttributes = {
	.crm_actualenddate = @"crm_actualenddate",
	.crm_assigned_user_id = @"crm_assigned_user_id",
	.crm_assigned_user_name = @"crm_assigned_user_name",
	.crm_description = @"crm_description",
	.crm_id = @"crm_id",
	.crm_modified_by_id = @"crm_modified_by_id",
	.crm_modified_by_name = @"crm_modified_by_name",
	.crm_priority = @"crm_priority",
	.crm_progress = @"crm_progress",
	.crm_project_no = @"crm_project_no",
	.crm_projectname = @"crm_projectname",
	.crm_related_record_id = @"crm_related_record_id",
	.crm_related_record_name = @"crm_related_record_name",
	.crm_startdate = @"crm_startdate",
	.crm_status = @"crm_status",
	.crm_targetbudget = @"crm_targetbudget",
	.crm_targetenddate = @"crm_targetenddate",
	.crm_time_created = @"crm_time_created",
	.crm_time_modified = @"crm_time_modified",
	.crm_type = @"crm_type",
	.crm_url = @"crm_url",
	.my_custom_fields = @"my_custom_fields",
};

const struct ProjectRelationships ProjectRelationships = {
	.projecttasks = @"projecttasks",
	.service = @"service",
};

@implementation ProjectID
@end

@implementation _Project

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Project" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Project";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Project" inManagedObjectContext:moc_];
}

- (ProjectID*)objectID {
	return (ProjectID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic crm_actualenddate;

@dynamic crm_assigned_user_id;

@dynamic crm_assigned_user_name;

@dynamic crm_description;

@dynamic crm_id;

@dynamic crm_modified_by_id;

@dynamic crm_modified_by_name;

@dynamic crm_priority;

@dynamic crm_progress;

@dynamic crm_project_no;

@dynamic crm_projectname;

@dynamic crm_related_record_id;

@dynamic crm_related_record_name;

@dynamic crm_startdate;

@dynamic crm_status;

@dynamic crm_targetbudget;

@dynamic crm_targetenddate;

@dynamic crm_time_created;

@dynamic crm_time_modified;

@dynamic crm_type;

@dynamic crm_url;

@dynamic my_custom_fields;

@dynamic projecttasks;

- (NSMutableSet*)projecttasksSet {
	[self willAccessValueForKey:@"projecttasks"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"projecttasks"];

	[self didAccessValueForKey:@"projecttasks"];
	return result;
}

@dynamic service;

@end

