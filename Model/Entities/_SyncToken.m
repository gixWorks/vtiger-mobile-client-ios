// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SyncToken.m instead.

#import "_SyncToken.h"

const struct SyncTokenAttributes SyncTokenAttributes = {
	.datetime = @"datetime",
	.module = @"module",
	.token = @"token",
};

const struct SyncTokenRelationships SyncTokenRelationships = {
	.service = @"service",
};

const struct SyncTokenFetchedProperties SyncTokenFetchedProperties = {
};

@implementation SyncTokenID
@end

@implementation _SyncToken

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"SyncToken" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"SyncToken";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"SyncToken" inManagedObjectContext:moc_];
}

- (SyncTokenID*)objectID {
	return (SyncTokenID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic datetime;






@dynamic module;






@dynamic token;






@dynamic service;

	






@end
