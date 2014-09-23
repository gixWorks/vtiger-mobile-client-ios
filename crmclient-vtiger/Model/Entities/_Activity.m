// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Activity.m instead.

#import "_Activity.h"

const struct ActivityAttributes ActivityAttributes = {
	.crm_activitytype = @"crm_activitytype",
	.crm_assigned_user_id = @"crm_assigned_user_id",
	.crm_assigned_user_name = @"crm_assigned_user_name",
	.crm_contact_id = @"crm_contact_id",
	.crm_contact_name = @"crm_contact_name",
	.crm_duration_hours = @"crm_duration_hours",
	.crm_duration_minutes = @"crm_duration_minutes",
	.crm_eventstatus = @"crm_eventstatus",
	.crm_id = @"crm_id",
	.crm_location = @"crm_location",
	.crm_notime = @"crm_notime",
	.crm_parent_id = @"crm_parent_id",
	.crm_parent_name = @"crm_parent_name",
	.crm_parent_type = @"crm_parent_type",
	.crm_priority = @"crm_priority",
	.crm_recurringtype = @"crm_recurringtype",
	.crm_reminder_time = @"crm_reminder_time",
	.crm_sendnotification = @"crm_sendnotification",
	.crm_time_created = @"crm_time_created",
	.crm_time_end = @"crm_time_end",
	.crm_time_modified = @"crm_time_modified",
	.crm_time_start = @"crm_time_start",
	.crm_visibility = @"crm_visibility",
	.my_custom_fields = @"my_custom_fields",
	.my_timezone = @"my_timezone",
};

const struct ActivityFetchedProperties ActivityFetchedProperties = {
	.activity_relatedlead = @"activity_relatedlead",
};

@implementation ActivityID
@end

@implementation _Activity

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Activity" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Activity";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Activity" inManagedObjectContext:moc_];
}

- (ActivityID*)objectID {
	return (ActivityID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"crm_duration_hoursValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"crm_duration_hours"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"crm_duration_minutesValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"crm_duration_minutes"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"crm_reminder_timeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"crm_reminder_time"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic crm_activitytype;

@dynamic crm_assigned_user_id;

@dynamic crm_assigned_user_name;

@dynamic crm_contact_id;

@dynamic crm_contact_name;

@dynamic crm_duration_hours;

- (int16_t)crm_duration_hoursValue {
	NSNumber *result = [self crm_duration_hours];
	return [result shortValue];
}

- (void)setCrm_duration_hoursValue:(int16_t)value_ {
	[self setCrm_duration_hours:@(value_)];
}

- (int16_t)primitiveCrm_duration_hoursValue {
	NSNumber *result = [self primitiveCrm_duration_hours];
	return [result shortValue];
}

- (void)setPrimitiveCrm_duration_hoursValue:(int16_t)value_ {
	[self setPrimitiveCrm_duration_hours:@(value_)];
}

@dynamic crm_duration_minutes;

- (int16_t)crm_duration_minutesValue {
	NSNumber *result = [self crm_duration_minutes];
	return [result shortValue];
}

- (void)setCrm_duration_minutesValue:(int16_t)value_ {
	[self setCrm_duration_minutes:@(value_)];
}

- (int16_t)primitiveCrm_duration_minutesValue {
	NSNumber *result = [self primitiveCrm_duration_minutes];
	return [result shortValue];
}

- (void)setPrimitiveCrm_duration_minutesValue:(int16_t)value_ {
	[self setPrimitiveCrm_duration_minutes:@(value_)];
}

@dynamic crm_eventstatus;

@dynamic crm_id;

@dynamic crm_location;

@dynamic crm_notime;

@dynamic crm_parent_id;

@dynamic crm_parent_name;

@dynamic crm_parent_type;

@dynamic crm_priority;

@dynamic crm_recurringtype;

@dynamic crm_reminder_time;

- (int16_t)crm_reminder_timeValue {
	NSNumber *result = [self crm_reminder_time];
	return [result shortValue];
}

- (void)setCrm_reminder_timeValue:(int16_t)value_ {
	[self setCrm_reminder_time:@(value_)];
}

- (int16_t)primitiveCrm_reminder_timeValue {
	NSNumber *result = [self primitiveCrm_reminder_time];
	return [result shortValue];
}

- (void)setPrimitiveCrm_reminder_timeValue:(int16_t)value_ {
	[self setPrimitiveCrm_reminder_time:@(value_)];
}

@dynamic crm_sendnotification;

@dynamic crm_time_created;

@dynamic crm_time_end;

@dynamic crm_time_modified;

@dynamic crm_time_start;

@dynamic crm_visibility;

@dynamic my_custom_fields;

@dynamic my_timezone;

@dynamic activity_relatedlead;

@end

