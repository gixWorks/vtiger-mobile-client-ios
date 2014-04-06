// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to LeadAddress.m instead.

#import "_LeadAddress.h"

const struct LeadAddressAttributes LeadAddressAttributes = {
	.crm_city = @"crm_city",
	.crm_code = @"crm_code",
	.crm_country = @"crm_country",
	.crm_pobox = @"crm_pobox",
	.crm_state = @"crm_state",
	.crm_street = @"crm_street",
};

const struct LeadAddressRelationships LeadAddressRelationships = {
	.lead = @"lead",
};

const struct LeadAddressFetchedProperties LeadAddressFetchedProperties = {
};

@implementation LeadAddressID
@end

@implementation _LeadAddress

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"LeadAddress" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"LeadAddress";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"LeadAddress" inManagedObjectContext:moc_];
}

- (LeadAddressID*)objectID {
	return (LeadAddressID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic crm_city;






@dynamic crm_code;






@dynamic crm_country;






@dynamic crm_pobox;






@dynamic crm_state;






@dynamic crm_street;






@dynamic lead;

	






@end
