// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ContactAddress.m instead.

#import "_ContactAddress.h"

const struct ContactAddressAttributes ContactAddressAttributes = {
	.crm_mailingcity = @"crm_mailingcity",
	.crm_mailingcountry = @"crm_mailingcountry",
	.crm_mailingpobox = @"crm_mailingpobox",
	.crm_mailingstate = @"crm_mailingstate",
	.crm_mailingstreet = @"crm_mailingstreet",
	.crm_mailingzip = @"crm_mailingzip",
	.crm_othercity = @"crm_othercity",
	.crm_othercountry = @"crm_othercountry",
	.crm_otherpobox = @"crm_otherpobox",
	.crm_otherstate = @"crm_otherstate",
	.crm_otherstreet = @"crm_otherstreet",
	.crm_otherzip = @"crm_otherzip",
};

const struct ContactAddressRelationships ContactAddressRelationships = {
	.contact = @"contact",
};

const struct ContactAddressFetchedProperties ContactAddressFetchedProperties = {
};

@implementation ContactAddressID
@end

@implementation _ContactAddress

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ContactAddress" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ContactAddress";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ContactAddress" inManagedObjectContext:moc_];
}

- (ContactAddressID*)objectID {
	return (ContactAddressID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic crm_mailingcity;






@dynamic crm_mailingcountry;






@dynamic crm_mailingpobox;






@dynamic crm_mailingstate;






@dynamic crm_mailingstreet;






@dynamic crm_mailingzip;






@dynamic crm_othercity;






@dynamic crm_othercountry;






@dynamic crm_otherpobox;






@dynamic crm_otherstate;






@dynamic crm_otherstreet;






@dynamic crm_otherzip;






@dynamic contact;

	






@end
