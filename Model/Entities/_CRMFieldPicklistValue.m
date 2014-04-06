// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to CRMFieldPicklistValue.m instead.

#import "_CRMFieldPicklistValue.h"

const struct CRMFieldPicklistValueAttributes CRMFieldPicklistValueAttributes = {
	.crm_label = @"crm_label",
	.crm_value = @"crm_value",
};

const struct CRMFieldPicklistValueRelationships CRMFieldPicklistValueRelationships = {
	.field = @"field",
};

const struct CRMFieldPicklistValueFetchedProperties CRMFieldPicklistValueFetchedProperties = {
};

@implementation CRMFieldPicklistValueID
@end

@implementation _CRMFieldPicklistValue

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"CRMFieldPicklistValue" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"CRMFieldPicklistValue";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"CRMFieldPicklistValue" inManagedObjectContext:moc_];
}

- (CRMFieldPicklistValueID*)objectID {
	return (CRMFieldPicklistValueID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic crm_label;






@dynamic crm_value;






@dynamic field;

	






@end
