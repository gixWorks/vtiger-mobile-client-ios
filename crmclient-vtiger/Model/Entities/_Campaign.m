// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Campaign.m instead.

#import "_Campaign.h"

const struct CampaignAttributes CampaignAttributes = {
	.crm_assigned_user_id = @"crm_assigned_user_id",
	.crm_assigned_user_name = @"crm_assigned_user_name",
	.crm_campaign_no = @"crm_campaign_no",
	.crm_campaignname = @"crm_campaignname",
	.crm_campaignstatus = @"crm_campaignstatus",
	.crm_campaigntype = @"crm_campaigntype",
	.crm_closingdate = @"crm_closingdate",
	.crm_description = @"crm_description",
	.crm_id = @"crm_id",
	.crm_numsent = @"crm_numsent",
	.crm_product_id = @"crm_product_id",
	.crm_product_name = @"crm_product_name",
	.crm_sponsor = @"crm_sponsor",
	.crm_targetaudience = @"crm_targetaudience",
	.crm_targetsize = @"crm_targetsize",
	.crm_time_created = @"crm_time_created",
	.crm_time_modified = @"crm_time_modified",
	.my_custom_fields = @"my_custom_fields",
};

const struct CampaignRelationships CampaignRelationships = {
	.service = @"service",
};

@implementation CampaignID
@end

@implementation _Campaign

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Campaign" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Campaign";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Campaign" inManagedObjectContext:moc_];
}

- (CampaignID*)objectID {
	return (CampaignID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"crm_numsentValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"crm_numsent"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"crm_targetsizeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"crm_targetsize"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic crm_assigned_user_id;

@dynamic crm_assigned_user_name;

@dynamic crm_campaign_no;

@dynamic crm_campaignname;

@dynamic crm_campaignstatus;

@dynamic crm_campaigntype;

@dynamic crm_closingdate;

@dynamic crm_description;

@dynamic crm_id;

@dynamic crm_numsent;

- (int16_t)crm_numsentValue {
	NSNumber *result = [self crm_numsent];
	return [result shortValue];
}

- (void)setCrm_numsentValue:(int16_t)value_ {
	[self setCrm_numsent:@(value_)];
}

- (int16_t)primitiveCrm_numsentValue {
	NSNumber *result = [self primitiveCrm_numsent];
	return [result shortValue];
}

- (void)setPrimitiveCrm_numsentValue:(int16_t)value_ {
	[self setPrimitiveCrm_numsent:@(value_)];
}

@dynamic crm_product_id;

@dynamic crm_product_name;

@dynamic crm_sponsor;

@dynamic crm_targetaudience;

@dynamic crm_targetsize;

- (int16_t)crm_targetsizeValue {
	NSNumber *result = [self crm_targetsize];
	return [result shortValue];
}

- (void)setCrm_targetsizeValue:(int16_t)value_ {
	[self setCrm_targetsize:@(value_)];
}

- (int16_t)primitiveCrm_targetsizeValue {
	NSNumber *result = [self primitiveCrm_targetsize];
	return [result shortValue];
}

- (void)setPrimitiveCrm_targetsizeValue:(int16_t)value_ {
	[self setPrimitiveCrm_targetsize:@(value_)];
}

@dynamic crm_time_created;

@dynamic crm_time_modified;

@dynamic my_custom_fields;

@dynamic service;

@end

