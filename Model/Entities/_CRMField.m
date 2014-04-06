// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CRMField.m instead.

#import "_CRMField.h"

const struct CRMFieldAttributes CRMFieldAttributes = {
	.crm_label = @"crm_label",
	.crm_mandatory = @"crm_mandatory",
	.crm_name = @"crm_name",
	.crm_options = @"crm_options",
	.crm_type = @"crm_type",
	.crm_uitype = @"crm_uitype",
};

const struct CRMFieldRelationships CRMFieldRelationships = {
	.module = @"module",
	.picklist_values = @"picklist_values",
};

const struct CRMFieldFetchedProperties CRMFieldFetchedProperties = {
};

@implementation CRMFieldID
@end

@implementation _CRMField

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"CRMField" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"CRMField";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"CRMField" inManagedObjectContext:moc_];
}

- (CRMFieldID*)objectID {
	return (CRMFieldID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"crm_mandatoryValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"crm_mandatory"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic crm_label;






@dynamic crm_mandatory;



- (BOOL)crm_mandatoryValue {
	NSNumber *result = [self crm_mandatory];
	return [result boolValue];
}

- (void)setCrm_mandatoryValue:(BOOL)value_ {
	[self setCrm_mandatory:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveCrm_mandatoryValue {
	NSNumber *result = [self primitiveCrm_mandatory];
	return [result boolValue];
}

- (void)setPrimitiveCrm_mandatoryValue:(BOOL)value_ {
	[self setPrimitiveCrm_mandatory:[NSNumber numberWithBool:value_]];
}





@dynamic crm_name;






@dynamic crm_options;






@dynamic crm_type;






@dynamic crm_uitype;






@dynamic module;

	

@dynamic picklist_values;

	
- (NSMutableSet*)picklist_valuesSet {
	[self willAccessValueForKey:@"picklist_values"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"picklist_values"];
  
	[self didAccessValueForKey:@"picklist_values"];
	return result;
}
	






@end
