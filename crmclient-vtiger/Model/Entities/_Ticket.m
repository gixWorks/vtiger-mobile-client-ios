// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Ticket.m instead.

#import "_Ticket.h"

const struct TicketAttributes TicketAttributes = {
	.crm_assigned_user_id = @"crm_assigned_user_id",
	.crm_assigned_user_name = @"crm_assigned_user_name",
	.crm_days = @"crm_days",
	.crm_description = @"crm_description",
	.crm_hours = @"crm_hours",
	.crm_id = @"crm_id",
	.crm_parent_id = @"crm_parent_id",
	.crm_parent_name = @"crm_parent_name",
	.crm_parent_type = @"crm_parent_type",
	.crm_product_id = @"crm_product_id",
	.crm_product_name = @"crm_product_name",
	.crm_solution = @"crm_solution",
	.crm_ticket_no = @"crm_ticket_no",
	.crm_ticketcategory = @"crm_ticketcategory",
	.crm_ticketpriority = @"crm_ticketpriority",
	.crm_ticketseverity = @"crm_ticketseverity",
	.crm_ticketstatus = @"crm_ticketstatus",
	.crm_tickettitle = @"crm_tickettitle",
	.crm_time_created = @"crm_time_created",
	.crm_time_modified = @"crm_time_modified",
	.my_custom_fields = @"my_custom_fields",
};

const struct TicketRelationships TicketRelationships = {
	.service = @"service",
};

@implementation TicketID
@end

@implementation _Ticket

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Ticket" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Ticket";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Ticket" inManagedObjectContext:moc_];
}

- (TicketID*)objectID {
	return (TicketID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"crm_daysValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"crm_days"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"crm_hoursValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"crm_hours"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic crm_assigned_user_id;

@dynamic crm_assigned_user_name;

@dynamic crm_days;

- (int16_t)crm_daysValue {
	NSNumber *result = [self crm_days];
	return [result shortValue];
}

- (void)setCrm_daysValue:(int16_t)value_ {
	[self setCrm_days:@(value_)];
}

- (int16_t)primitiveCrm_daysValue {
	NSNumber *result = [self primitiveCrm_days];
	return [result shortValue];
}

- (void)setPrimitiveCrm_daysValue:(int16_t)value_ {
	[self setPrimitiveCrm_days:@(value_)];
}

@dynamic crm_description;

@dynamic crm_hours;

- (int16_t)crm_hoursValue {
	NSNumber *result = [self crm_hours];
	return [result shortValue];
}

- (void)setCrm_hoursValue:(int16_t)value_ {
	[self setCrm_hours:@(value_)];
}

- (int16_t)primitiveCrm_hoursValue {
	NSNumber *result = [self primitiveCrm_hours];
	return [result shortValue];
}

- (void)setPrimitiveCrm_hoursValue:(int16_t)value_ {
	[self setPrimitiveCrm_hours:@(value_)];
}

@dynamic crm_id;

@dynamic crm_parent_id;

@dynamic crm_parent_name;

@dynamic crm_parent_type;

@dynamic crm_product_id;

@dynamic crm_product_name;

@dynamic crm_solution;

@dynamic crm_ticket_no;

@dynamic crm_ticketcategory;

@dynamic crm_ticketpriority;

@dynamic crm_ticketseverity;

@dynamic crm_ticketstatus;

@dynamic crm_tickettitle;

@dynamic crm_time_created;

@dynamic crm_time_modified;

@dynamic my_custom_fields;

@dynamic service;

@end

