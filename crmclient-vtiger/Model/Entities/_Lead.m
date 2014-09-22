// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Lead.m instead.

#import "_Lead.h"

const struct LeadAttributes LeadAttributes = {
	.crm_time_created = @"crm_time_created",
	.crm_time_modified = @"crm_time_modified",
	.lead_assigned_user_id = @"lead_assigned_user_id",
	.lead_assigned_user_name = @"lead_assigned_user_name",
	.lead_company = @"lead_company",
	.lead_company_annualrevenue = @"lead_company_annualrevenue",
	.lead_company_industry = @"lead_company_industry",
	.lead_company_noofemployees = @"lead_company_noofemployees",
	.lead_company_website = @"lead_company_website",
	.lead_description = @"lead_description",
	.lead_designation = @"lead_designation",
	.lead_email = @"lead_email",
	.lead_fax = @"lead_fax",
	.lead_firstname = @"lead_firstname",
	.lead_lastname = @"lead_lastname",
	.lead_lead_no = @"lead_lead_no",
	.lead_leadid = @"lead_leadid",
	.lead_leadsource = @"lead_leadsource",
	.lead_leadstatus = @"lead_leadstatus",
	.lead_mobile = @"lead_mobile",
	.lead_phone = @"lead_phone",
	.lead_rating = @"lead_rating",
	.lead_salutationtype = @"lead_salutationtype",
	.lead_yahooid = @"lead_yahooid",
	.my_custom_fields = @"my_custom_fields",
};

const struct LeadRelationships LeadRelationships = {
	.address = @"address",
	.service = @"service",
};

@implementation LeadID
@end

@implementation _Lead

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Lead" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Lead";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Lead" inManagedObjectContext:moc_];
}

- (LeadID*)objectID {
	return (LeadID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"lead_company_annualrevenueValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"lead_company_annualrevenue"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"lead_company_noofemployeesValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"lead_company_noofemployees"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic crm_time_created;

@dynamic crm_time_modified;

@dynamic lead_assigned_user_id;

@dynamic lead_assigned_user_name;

@dynamic lead_company;

@dynamic lead_company_annualrevenue;

- (int16_t)lead_company_annualrevenueValue {
	NSNumber *result = [self lead_company_annualrevenue];
	return [result shortValue];
}

- (void)setLead_company_annualrevenueValue:(int16_t)value_ {
	[self setLead_company_annualrevenue:@(value_)];
}

- (int16_t)primitiveLead_company_annualrevenueValue {
	NSNumber *result = [self primitiveLead_company_annualrevenue];
	return [result shortValue];
}

- (void)setPrimitiveLead_company_annualrevenueValue:(int16_t)value_ {
	[self setPrimitiveLead_company_annualrevenue:@(value_)];
}

@dynamic lead_company_industry;

@dynamic lead_company_noofemployees;

- (int16_t)lead_company_noofemployeesValue {
	NSNumber *result = [self lead_company_noofemployees];
	return [result shortValue];
}

- (void)setLead_company_noofemployeesValue:(int16_t)value_ {
	[self setLead_company_noofemployees:@(value_)];
}

- (int16_t)primitiveLead_company_noofemployeesValue {
	NSNumber *result = [self primitiveLead_company_noofemployees];
	return [result shortValue];
}

- (void)setPrimitiveLead_company_noofemployeesValue:(int16_t)value_ {
	[self setPrimitiveLead_company_noofemployees:@(value_)];
}

@dynamic lead_company_website;

@dynamic lead_description;

@dynamic lead_designation;

@dynamic lead_email;

@dynamic lead_fax;

@dynamic lead_firstname;

@dynamic lead_lastname;

@dynamic lead_lead_no;

@dynamic lead_leadid;

@dynamic lead_leadsource;

@dynamic lead_leadstatus;

@dynamic lead_mobile;

@dynamic lead_phone;

@dynamic lead_rating;

@dynamic lead_salutationtype;

@dynamic lead_yahooid;

@dynamic my_custom_fields;

@dynamic address;

@dynamic service;

@end

