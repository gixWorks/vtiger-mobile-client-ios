// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CRMErrorMessage.m instead.

#import "_CRMErrorMessage.h"

const struct CRMErrorMessageAttributes CRMErrorMessageAttributes = {
	.crm_message = @"crm_message",
	.crm_timestamp = @"crm_timestamp",
};

const struct CRMErrorMessageRelationships CRMErrorMessageRelationships = {
	.service = @"service",
};

const struct CRMErrorMessageFetchedProperties CRMErrorMessageFetchedProperties = {
};

@implementation CRMErrorMessageID
@end

@implementation _CRMErrorMessage

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"CRMErrorMessage" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"CRMErrorMessage";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"CRMErrorMessage" inManagedObjectContext:moc_];
}

- (CRMErrorMessageID*)objectID {
	return (CRMErrorMessageID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic crm_message;






@dynamic crm_timestamp;






@dynamic service;

	






@end
