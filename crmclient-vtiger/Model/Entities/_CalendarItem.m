// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CalendarItem.m instead.

#import "_CalendarItem.h"

const struct CalendarItemAttributes CalendarItemAttributes = {
	.crm_date_start = @"crm_date_start",
	.crm_description = @"crm_description",
	.crm_due_date = @"crm_due_date",
	.crm_id = @"crm_id",
	.crm_subject = @"crm_subject",
	.my_custom_fields = @"my_custom_fields",
	.my_datetime_end = @"my_datetime_end",
	.my_datetime_start = @"my_datetime_start",
	.my_deleted = @"my_deleted",
};

const struct CalendarItemRelationships CalendarItemRelationships = {
	.service = @"service",
};

const struct CalendarItemFetchedProperties CalendarItemFetchedProperties = {
	.calc_search_date = @"calc_search_date",
};

@implementation CalendarItemID
@end

@implementation _CalendarItem

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"CalendarItem" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"CalendarItem";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"CalendarItem" inManagedObjectContext:moc_];
}

- (CalendarItemID*)objectID {
	return (CalendarItemID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"my_deletedValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"my_deleted"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic crm_date_start;

@dynamic crm_description;

@dynamic crm_due_date;

@dynamic crm_id;

@dynamic crm_subject;

@dynamic my_custom_fields;

@dynamic my_datetime_end;

@dynamic my_datetime_start;

@dynamic my_deleted;

- (BOOL)my_deletedValue {
	NSNumber *result = [self my_deleted];
	return [result boolValue];
}

- (void)setMy_deletedValue:(BOOL)value_ {
	[self setMy_deleted:@(value_)];
}

- (BOOL)primitiveMy_deletedValue {
	NSNumber *result = [self primitiveMy_deleted];
	return [result boolValue];
}

- (void)setPrimitiveMy_deletedValue:(BOOL)value_ {
	[self setPrimitiveMy_deleted:@(value_)];
}

@dynamic service;

@dynamic calc_search_date;

@end

