// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Account.m instead.

#import "_Account.h"

const struct AccountAttributes AccountAttributes = {
	.crm_account_no = @"crm_account_no",
	.crm_accountname = @"crm_accountname",
	.crm_accounttype = @"crm_accounttype",
	.crm_annual_revenue = @"crm_annual_revenue",
	.crm_assigned_user_id = @"crm_assigned_user_id",
	.crm_assigned_user_name = @"crm_assigned_user_name",
	.crm_description = @"crm_description",
	.crm_email1 = @"crm_email1",
	.crm_email2 = @"crm_email2",
	.crm_emailoptout = @"crm_emailoptout",
	.crm_employees = @"crm_employees",
	.crm_fax = @"crm_fax",
	.crm_id = @"crm_id",
	.crm_industry = @"crm_industry",
	.crm_memberof_id = @"crm_memberof_id",
	.crm_memberof_name = @"crm_memberof_name",
	.crm_notify_owner = @"crm_notify_owner",
	.crm_otherphone = @"crm_otherphone",
	.crm_ownership = @"crm_ownership",
	.crm_phone = @"crm_phone",
	.crm_rating = @"crm_rating",
	.crm_siccode = @"crm_siccode",
	.crm_tickersymbol = @"crm_tickersymbol",
	.crm_time_created = @"crm_time_created",
	.crm_time_modified = @"crm_time_modified",
	.crm_website = @"crm_website",
	.my_custom_fields = @"my_custom_fields",
};

const struct AccountRelationships AccountRelationships = {
	.address = @"address",
	.service = @"service",
};

@implementation AccountID
@end

@implementation _Account

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Account" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Account";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Account" inManagedObjectContext:moc_];
}

- (AccountID*)objectID {
	return (AccountID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"crm_annual_revenueValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"crm_annual_revenue"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"crm_emailoptoutValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"crm_emailoptout"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"crm_employeesValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"crm_employees"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"crm_notify_ownerValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"crm_notify_owner"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic crm_account_no;

@dynamic crm_accountname;

@dynamic crm_accounttype;

@dynamic crm_annual_revenue;

- (int16_t)crm_annual_revenueValue {
	NSNumber *result = [self crm_annual_revenue];
	return [result shortValue];
}

- (void)setCrm_annual_revenueValue:(int16_t)value_ {
	[self setCrm_annual_revenue:@(value_)];
}

- (int16_t)primitiveCrm_annual_revenueValue {
	NSNumber *result = [self primitiveCrm_annual_revenue];
	return [result shortValue];
}

- (void)setPrimitiveCrm_annual_revenueValue:(int16_t)value_ {
	[self setPrimitiveCrm_annual_revenue:@(value_)];
}

@dynamic crm_assigned_user_id;

@dynamic crm_assigned_user_name;

@dynamic crm_description;

@dynamic crm_email1;

@dynamic crm_email2;

@dynamic crm_emailoptout;

- (BOOL)crm_emailoptoutValue {
	NSNumber *result = [self crm_emailoptout];
	return [result boolValue];
}

- (void)setCrm_emailoptoutValue:(BOOL)value_ {
	[self setCrm_emailoptout:@(value_)];
}

- (BOOL)primitiveCrm_emailoptoutValue {
	NSNumber *result = [self primitiveCrm_emailoptout];
	return [result boolValue];
}

- (void)setPrimitiveCrm_emailoptoutValue:(BOOL)value_ {
	[self setPrimitiveCrm_emailoptout:@(value_)];
}

@dynamic crm_employees;

- (int16_t)crm_employeesValue {
	NSNumber *result = [self crm_employees];
	return [result shortValue];
}

- (void)setCrm_employeesValue:(int16_t)value_ {
	[self setCrm_employees:@(value_)];
}

- (int16_t)primitiveCrm_employeesValue {
	NSNumber *result = [self primitiveCrm_employees];
	return [result shortValue];
}

- (void)setPrimitiveCrm_employeesValue:(int16_t)value_ {
	[self setPrimitiveCrm_employees:@(value_)];
}

@dynamic crm_fax;

@dynamic crm_id;

@dynamic crm_industry;

@dynamic crm_memberof_id;

@dynamic crm_memberof_name;

@dynamic crm_notify_owner;

- (BOOL)crm_notify_ownerValue {
	NSNumber *result = [self crm_notify_owner];
	return [result boolValue];
}

- (void)setCrm_notify_ownerValue:(BOOL)value_ {
	[self setCrm_notify_owner:@(value_)];
}

- (BOOL)primitiveCrm_notify_ownerValue {
	NSNumber *result = [self primitiveCrm_notify_owner];
	return [result boolValue];
}

- (void)setPrimitiveCrm_notify_ownerValue:(BOOL)value_ {
	[self setPrimitiveCrm_notify_owner:@(value_)];
}

@dynamic crm_otherphone;

@dynamic crm_ownership;

@dynamic crm_phone;

@dynamic crm_rating;

@dynamic crm_siccode;

@dynamic crm_tickersymbol;

@dynamic crm_time_created;

@dynamic crm_time_modified;

@dynamic crm_website;

@dynamic my_custom_fields;

@dynamic address;

@dynamic service;

@end

