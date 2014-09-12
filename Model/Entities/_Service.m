// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Service.m instead.

#import "_Service.h"

const struct ServiceAttributes ServiceAttributes = {
	.crm_active = @"crm_active",
	.crm_client_certificate_data = @"crm_client_certificate_data",
	.crm_crmondemand = @"crm_crmondemand",
	.crm_servicename = @"crm_servicename",
	.crm_timezone_server = @"crm_timezone_server",
	.crm_timezone_user = @"crm_timezone_user",
	.crm_url = @"crm_url",
	.crm_userid = @"crm_userid",
	.crm_username = @"crm_username",
};

const struct ServiceRelationships ServiceRelationships = {
	.accounts = @"accounts",
	.activities = @"activities",
	.campaigns = @"campaigns",
	.comments = @"comments",
	.contacts = @"contacts",
	.documents = @"documents",
	.enabledModules = @"enabledModules",
	.errorMessages = @"errorMessages",
	.groups = @"groups",
	.history_locations = @"history_locations",
	.leads = @"leads",
	.modules = @"modules",
	.potentials = @"potentials",
	.products = @"products",
	.syncs = @"syncs",
	.synctokens = @"synctokens",
	.tickets = @"tickets",
	.users = @"users",
};

@implementation ServiceID
@end

@implementation _Service

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Service" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Service";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Service" inManagedObjectContext:moc_];
}

- (ServiceID*)objectID {
	return (ServiceID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"crm_activeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"crm_active"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"crm_crmondemandValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"crm_crmondemand"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic crm_active;

- (BOOL)crm_activeValue {
	NSNumber *result = [self crm_active];
	return [result boolValue];
}

- (void)setCrm_activeValue:(BOOL)value_ {
	[self setCrm_active:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveCrm_activeValue {
	NSNumber *result = [self primitiveCrm_active];
	return [result boolValue];
}

- (void)setPrimitiveCrm_activeValue:(BOOL)value_ {
	[self setPrimitiveCrm_active:[NSNumber numberWithBool:value_]];
}

@dynamic crm_client_certificate_data;

@dynamic crm_crmondemand;

- (BOOL)crm_crmondemandValue {
	NSNumber *result = [self crm_crmondemand];
	return [result boolValue];
}

- (void)setCrm_crmondemandValue:(BOOL)value_ {
	[self setCrm_crmondemand:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveCrm_crmondemandValue {
	NSNumber *result = [self primitiveCrm_crmondemand];
	return [result boolValue];
}

- (void)setPrimitiveCrm_crmondemandValue:(BOOL)value_ {
	[self setPrimitiveCrm_crmondemand:[NSNumber numberWithBool:value_]];
}

@dynamic crm_servicename;

@dynamic crm_timezone_server;

@dynamic crm_timezone_user;

@dynamic crm_url;

@dynamic crm_userid;

@dynamic crm_username;

@dynamic accounts;

- (NSMutableSet*)accountsSet {
	[self willAccessValueForKey:@"accounts"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"accounts"];

	[self didAccessValueForKey:@"accounts"];
	return result;
}

@dynamic activities;

- (NSMutableSet*)activitiesSet {
	[self willAccessValueForKey:@"activities"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"activities"];

	[self didAccessValueForKey:@"activities"];
	return result;
}

@dynamic campaigns;

- (NSMutableSet*)campaignsSet {
	[self willAccessValueForKey:@"campaigns"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"campaigns"];

	[self didAccessValueForKey:@"campaigns"];
	return result;
}

@dynamic comments;

- (NSMutableSet*)commentsSet {
	[self willAccessValueForKey:@"comments"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"comments"];

	[self didAccessValueForKey:@"comments"];
	return result;
}

@dynamic contacts;

- (NSMutableSet*)contactsSet {
	[self willAccessValueForKey:@"contacts"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"contacts"];

	[self didAccessValueForKey:@"contacts"];
	return result;
}

@dynamic documents;

- (NSMutableSet*)documentsSet {
	[self willAccessValueForKey:@"documents"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"documents"];

	[self didAccessValueForKey:@"documents"];
	return result;
}

@dynamic enabledModules;

- (NSMutableSet*)enabledModulesSet {
	[self willAccessValueForKey:@"enabledModules"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"enabledModules"];

	[self didAccessValueForKey:@"enabledModules"];
	return result;
}

@dynamic errorMessages;

- (NSMutableSet*)errorMessagesSet {
	[self willAccessValueForKey:@"errorMessages"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"errorMessages"];

	[self didAccessValueForKey:@"errorMessages"];
	return result;
}

@dynamic groups;

- (NSMutableSet*)groupsSet {
	[self willAccessValueForKey:@"groups"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"groups"];

	[self didAccessValueForKey:@"groups"];
	return result;
}

@dynamic history_locations;

- (NSMutableSet*)history_locationsSet {
	[self willAccessValueForKey:@"history_locations"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"history_locations"];

	[self didAccessValueForKey:@"history_locations"];
	return result;
}

@dynamic leads;

- (NSMutableSet*)leadsSet {
	[self willAccessValueForKey:@"leads"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"leads"];

	[self didAccessValueForKey:@"leads"];
	return result;
}

@dynamic modules;

- (NSMutableSet*)modulesSet {
	[self willAccessValueForKey:@"modules"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"modules"];

	[self didAccessValueForKey:@"modules"];
	return result;
}

@dynamic potentials;

- (NSMutableSet*)potentialsSet {
	[self willAccessValueForKey:@"potentials"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"potentials"];

	[self didAccessValueForKey:@"potentials"];
	return result;
}

@dynamic products;

- (NSMutableSet*)productsSet {
	[self willAccessValueForKey:@"products"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"products"];

	[self didAccessValueForKey:@"products"];
	return result;
}

@dynamic syncs;

- (NSMutableSet*)syncsSet {
	[self willAccessValueForKey:@"syncs"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"syncs"];

	[self didAccessValueForKey:@"syncs"];
	return result;
}

@dynamic synctokens;

- (NSMutableSet*)synctokensSet {
	[self willAccessValueForKey:@"synctokens"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"synctokens"];

	[self didAccessValueForKey:@"synctokens"];
	return result;
}

@dynamic tickets;

- (NSMutableSet*)ticketsSet {
	[self willAccessValueForKey:@"tickets"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"tickets"];

	[self didAccessValueForKey:@"tickets"];
	return result;
}

@dynamic users;

- (NSMutableSet*)usersSet {
	[self willAccessValueForKey:@"users"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"users"];

	[self didAccessValueForKey:@"users"];
	return result;
}

@end

