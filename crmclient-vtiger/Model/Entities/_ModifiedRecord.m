// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ModifiedRecord.m instead.

#import "_ModifiedRecord.h"

const struct ModifiedRecordAttributes ModifiedRecordAttributes = {
	.crm_action = @"crm_action",
	.crm_id = @"crm_id",
	.crm_number_of_tries = @"crm_number_of_tries",
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

	if ([key isEqualToString:@"crm_number_of_triesValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"crm_number_of_tries"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic crm_action;

@dynamic crm_id;

@dynamic crm_number_of_tries;

- (int16_t)crm_number_of_triesValue {
	NSNumber *result = [self crm_number_of_tries];
	return [result shortValue];
}

- (void)setCrm_number_of_triesValue:(int16_t)value_ {
	[self setCrm_number_of_tries:@(value_)];
}

- (int16_t)primitiveCrm_number_of_triesValue {
	NSNumber *result = [self primitiveCrm_number_of_tries];
	return [result shortValue];
}

- (void)setPrimitiveCrm_number_of_triesValue:(int16_t)value_ {
	[self setPrimitiveCrm_number_of_tries:@(value_)];
}

@dynamic crm_timestamp;

@end

