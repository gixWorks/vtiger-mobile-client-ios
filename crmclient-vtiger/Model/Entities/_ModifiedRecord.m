// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ModifiedRecord.m instead.

#import "_ModifiedRecord.h"

const struct ModifiedRecordAttributes ModifiedRecordAttributes = {
	.crm_action = @"crm_action",
	.crm_id = @"crm_id",
	.crm_timestamp = @"crm_timestamp",
};

@implementation ModifiedRecordID
@end

@implementation _ModifiedRecord

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ModifiedRecord" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ModifiedRecord";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ModifiedRecord" inManagedObjectContext:moc_];
}

- (ModifiedRecordID*)objectID {
	return (ModifiedRecordID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic crm_action;

@dynamic crm_id;

@dynamic crm_timestamp;

@end

