// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Sync.m instead.

#import "_Sync.h"

const struct SyncAttributes SyncAttributes = {
	.syncdate = @"syncdate",
	.syncmodule = @"syncmodule",
	.syncrecordsdeleted = @"syncrecordsdeleted",
	.syncrecordsupdated = @"syncrecordsupdated",
	.syncsuccess = @"syncsuccess",
	.synctoken = @"synctoken",
};

const struct SyncRelationships SyncRelationships = {
	.service = @"service",
};

@implementation SyncID
@end

@implementation _Sync

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Sync" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Sync";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Sync" inManagedObjectContext:moc_];
}

- (SyncID*)objectID {
	return (SyncID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"syncrecordsdeletedValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"syncrecordsdeleted"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"syncrecordsupdatedValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"syncrecordsupdated"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"syncsuccessValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"syncsuccess"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic syncdate;

@dynamic syncmodule;

@dynamic syncrecordsdeleted;

- (int32_t)syncrecordsdeletedValue {
	NSNumber *result = [self syncrecordsdeleted];
	return [result intValue];
}

- (void)setSyncrecordsdeletedValue:(int32_t)value_ {
	[self setSyncrecordsdeleted:@(value_)];
}

- (int32_t)primitiveSyncrecordsdeletedValue {
	NSNumber *result = [self primitiveSyncrecordsdeleted];
	return [result intValue];
}

- (void)setPrimitiveSyncrecordsdeletedValue:(int32_t)value_ {
	[self setPrimitiveSyncrecordsdeleted:@(value_)];
}

@dynamic syncrecordsupdated;

- (int32_t)syncrecordsupdatedValue {
	NSNumber *result = [self syncrecordsupdated];
	return [result intValue];
}

- (void)setSyncrecordsupdatedValue:(int32_t)value_ {
	[self setSyncrecordsupdated:@(value_)];
}

- (int32_t)primitiveSyncrecordsupdatedValue {
	NSNumber *result = [self primitiveSyncrecordsupdated];
	return [result intValue];
}

- (void)setPrimitiveSyncrecordsupdatedValue:(int32_t)value_ {
	[self setPrimitiveSyncrecordsupdated:@(value_)];
}

@dynamic syncsuccess;

- (int32_t)syncsuccessValue {
	NSNumber *result = [self syncsuccess];
	return [result intValue];
}

- (void)setSyncsuccessValue:(int32_t)value_ {
	[self setSyncsuccess:@(value_)];
}

- (int32_t)primitiveSyncsuccessValue {
	NSNumber *result = [self primitiveSyncsuccess];
	return [result intValue];
}

- (void)setPrimitiveSyncsuccessValue:(int32_t)value_ {
	[self setPrimitiveSyncsuccess:@(value_)];
}

@dynamic synctoken;

@dynamic service;

@end

