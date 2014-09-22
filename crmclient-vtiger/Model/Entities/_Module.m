// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Module.m instead.

#import "_Module.h"

const struct ModuleAttributes ModuleAttributes = {
	.crm_id = @"crm_id",
	.crm_isEntity = @"crm_isEntity",
	.crm_label = @"crm_label",
	.crm_name = @"crm_name",
	.crm_singular = @"crm_singular",
};

const struct ModuleRelationships ModuleRelationships = {
	.fields = @"fields",
	.service = @"service",
};

@implementation ModuleID
@end

@implementation _Module

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Module" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Module";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Module" inManagedObjectContext:moc_];
}

- (ModuleID*)objectID {
	return (ModuleID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"crm_isEntityValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"crm_isEntity"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic crm_id;

@dynamic crm_isEntity;

- (BOOL)crm_isEntityValue {
	NSNumber *result = [self crm_isEntity];
	return [result boolValue];
}

- (void)setCrm_isEntityValue:(BOOL)value_ {
	[self setCrm_isEntity:@(value_)];
}

- (BOOL)primitiveCrm_isEntityValue {
	NSNumber *result = [self primitiveCrm_isEntity];
	return [result boolValue];
}

- (void)setPrimitiveCrm_isEntityValue:(BOOL)value_ {
	[self setPrimitiveCrm_isEntity:@(value_)];
}

@dynamic crm_label;

@dynamic crm_name;

@dynamic crm_singular;

@dynamic fields;

- (NSMutableSet*)fieldsSet {
	[self willAccessValueForKey:@"fields"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"fields"];

	[self didAccessValueForKey:@"fields"];
	return result;
}

@dynamic service;

@end

