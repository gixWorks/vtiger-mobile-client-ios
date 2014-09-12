// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Contact.m instead.

#import "_Contact.h"

const struct ContactAttributes ContactAttributes = {
	.crm_account_id = @"crm_account_id",
	.crm_account_name = @"crm_account_name",
	.crm_assigned_user_id = @"crm_assigned_user_id",
	.crm_assigned_user_name = @"crm_assigned_user_name",
	.crm_assistant = @"crm_assistant",
	.crm_assistantphone = @"crm_assistantphone",
	.crm_birthday = @"crm_birthday",
	.crm_contact_image = @"crm_contact_image",
	.crm_contact_no = @"crm_contact_no",
	.crm_department = @"crm_department",
	.crm_description = @"crm_description",
	.crm_email = @"crm_email",
	.crm_fax = @"crm_fax",
	.crm_firstname = @"crm_firstname",
	.crm_homephone = @"crm_homephone",
	.crm_id = @"crm_id",
	.crm_lastname = @"crm_lastname",
	.crm_leadsource = @"crm_leadsource",
	.crm_mobile = @"crm_mobile",
	.crm_otherphone = @"crm_otherphone",
	.crm_phone = @"crm_phone",
	.crm_reports_to_id = @"crm_reports_to_id",
	.crm_reports_to_name = @"crm_reports_to_name",
	.crm_salutationtype = @"crm_salutationtype",
	.crm_time_created = @"crm_time_created",
	.crm_time_modified = @"crm_time_modified",
	.crm_title = @"crm_title",
	.crm_yahooid = @"crm_yahooid",
	.my_custom_fields = @"my_custom_fields",
};

const struct ContactRelationships ContactRelationships = {
	.address = @"address",
	.service = @"service",
};

@implementation ContactID
@end

@implementation _Contact

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Contact" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Contact";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Contact" inManagedObjectContext:moc_];
}

- (ContactID*)objectID {
	return (ContactID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic crm_account_id;

@dynamic crm_account_name;

@dynamic crm_assigned_user_id;

@dynamic crm_assigned_user_name;

@dynamic crm_assistant;

@dynamic crm_assistantphone;

@dynamic crm_birthday;

@dynamic crm_contact_image;

@dynamic crm_contact_no;

@dynamic crm_department;

@dynamic crm_description;

@dynamic crm_email;

@dynamic crm_fax;

@dynamic crm_firstname;

@dynamic crm_homephone;

@dynamic crm_id;

@dynamic crm_lastname;

@dynamic crm_leadsource;

@dynamic crm_mobile;

@dynamic crm_otherphone;

@dynamic crm_phone;

@dynamic crm_reports_to_id;

@dynamic crm_reports_to_name;

@dynamic crm_salutationtype;

@dynamic crm_time_created;

@dynamic crm_time_modified;

@dynamic crm_title;

@dynamic crm_yahooid;

@dynamic my_custom_fields;

@dynamic address;

@dynamic service;

@end

