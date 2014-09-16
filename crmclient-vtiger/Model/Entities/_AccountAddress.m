// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AccountAddress.m instead.

#import "_AccountAddress.h"

const struct AccountAddressAttributes AccountAddressAttributes = {
	.crm_bill_city = @"crm_bill_city",
	.crm_bill_code = @"crm_bill_code",
	.crm_bill_country = @"crm_bill_country",
	.crm_bill_pobox = @"crm_bill_pobox",
	.crm_bill_state = @"crm_bill_state",
	.crm_bill_street = @"crm_bill_street",
	.crm_ship_city = @"crm_ship_city",
	.crm_ship_code = @"crm_ship_code",
	.crm_ship_country = @"crm_ship_country",
	.crm_ship_pobox = @"crm_ship_pobox",
	.crm_ship_state = @"crm_ship_state",
	.crm_ship_street = @"crm_ship_street",
};

const struct AccountAddressRelationships AccountAddressRelationships = {
	.account = @"account",
};

@implementation AccountAddressID
@end

@implementation _AccountAddress

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"AccountAddress" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"AccountAddress";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"AccountAddress" inManagedObjectContext:moc_];
}

- (AccountAddressID*)objectID {
	return (AccountAddressID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic crm_bill_city;

@dynamic crm_bill_code;

@dynamic crm_bill_country;

@dynamic crm_bill_pobox;

@dynamic crm_bill_state;

@dynamic crm_bill_street;

@dynamic crm_ship_city;

@dynamic crm_ship_code;

@dynamic crm_ship_country;

@dynamic crm_ship_pobox;

@dynamic crm_ship_state;

@dynamic crm_ship_street;

@dynamic account;

@end

