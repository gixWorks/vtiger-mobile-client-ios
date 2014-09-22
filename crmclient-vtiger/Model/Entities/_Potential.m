// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Potential.m instead.

#import "_Potential.h"

const struct PotentialAttributes PotentialAttributes = {
	.crm_amount = @"crm_amount",
	.crm_assigned_user_id = @"crm_assigned_user_id",
	.crm_assigned_user_name = @"crm_assigned_user_name",
	.crm_campaign_id = @"crm_campaign_id",
	.crm_campaign_name = @"crm_campaign_name",
	.crm_closingdate = @"crm_closingdate",
	.crm_description = @"crm_description",
	.crm_id = @"crm_id",
	.crm_leadsource = @"crm_leadsource",
	.crm_nextstep = @"crm_nextstep",
	.crm_opportunity_type = @"crm_opportunity_type",
	.crm_potential_no = @"crm_potential_no",
	.crm_potentialname = @"crm_potentialname",
	.crm_probability = @"crm_probability",
	.crm_related_to_id = @"crm_related_to_id",
	.crm_related_to_name = @"crm_related_to_name",
	.crm_related_to_type = @"crm_related_to_type",
	.crm_sales_stage = @"crm_sales_stage",
	.crm_time_created = @"crm_time_created",
	.crm_time_modified = @"crm_time_modified",
	.my_custom_fields = @"my_custom_fields",
};

const struct PotentialRelationships PotentialRelationships = {
	.service = @"service",
};

@implementation PotentialID
@end

@implementation _Potential

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Potential" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Potential";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Potential" inManagedObjectContext:moc_];
}

- (PotentialID*)objectID {
	return (PotentialID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"crm_probabilityValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"crm_probability"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic crm_amount;

@dynamic crm_assigned_user_id;

@dynamic crm_assigned_user_name;

@dynamic crm_campaign_id;

@dynamic crm_campaign_name;

@dynamic crm_closingdate;

@dynamic crm_description;

@dynamic crm_id;

@dynamic crm_leadsource;

@dynamic crm_nextstep;

@dynamic crm_opportunity_type;

@dynamic crm_potential_no;

@dynamic crm_potentialname;

@dynamic crm_probability;

- (float)crm_probabilityValue {
	NSNumber *result = [self crm_probability];
	return [result floatValue];
}

- (void)setCrm_probabilityValue:(float)value_ {
	[self setCrm_probability:@(value_)];
}

- (float)primitiveCrm_probabilityValue {
	NSNumber *result = [self primitiveCrm_probability];
	return [result floatValue];
}

- (void)setPrimitiveCrm_probabilityValue:(float)value_ {
	[self setPrimitiveCrm_probability:@(value_)];
}

@dynamic crm_related_to_id;

@dynamic crm_related_to_name;

@dynamic crm_related_to_type;

@dynamic crm_sales_stage;

@dynamic crm_time_created;

@dynamic crm_time_modified;

@dynamic my_custom_fields;

@dynamic service;

@end

