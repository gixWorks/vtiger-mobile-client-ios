// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to EnabledModules.m instead.

#import "_EnabledModules.h"

const struct EnabledModulesAttributes EnabledModulesAttributes = {
	.crm_name = @"crm_name",
	.enabled = @"enabled",
};

const struct EnabledModulesRelationships EnabledModulesRelationships = {
	.service = @"service",
};

@implementation EnabledModulesID
@end

@implementation _EnabledModules

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"EnabledModules" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"EnabledModules";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"EnabledModules" inManagedObjectContext:moc_];
}

- (EnabledModulesID*)objectID {
	return (EnabledModulesID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"enabledValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"enabled"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic crm_name;

@dynamic enabled;

- (BOOL)enabledValue {
	NSNumber *result = [self enabled];
	return [result boolValue];
}

- (void)setEnabledValue:(BOOL)value_ {
	[self setEnabled:@(value_)];
}

- (BOOL)primitiveEnabledValue {
	NSNumber *result = [self primitiveEnabled];
	return [result boolValue];
}

- (void)setPrimitiveEnabledValue:(BOOL)value_ {
	[self setPrimitiveEnabled:@(value_)];
}

@dynamic service;

@end

