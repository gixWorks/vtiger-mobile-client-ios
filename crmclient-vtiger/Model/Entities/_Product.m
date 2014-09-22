// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Product.m instead.

#import "_Product.h"

const struct ProductAttributes ProductAttributes = {
	.crm_description = @"crm_description",
	.crm_discontinued = @"crm_discontinued",
	.crm_glacct = @"crm_glacct",
	.crm_id = @"crm_id",
	.crm_manufacturer = @"crm_manufacturer",
	.crm_mfr_part_no = @"crm_mfr_part_no",
	.crm_product_no = @"crm_product_no",
	.crm_productcategory = @"crm_productcategory",
	.crm_productcode = @"crm_productcode",
	.crm_productname = @"crm_productname",
	.crm_productsheet = @"crm_productsheet",
	.crm_sales_end_date = @"crm_sales_end_date",
	.crm_sales_start_date = @"crm_sales_start_date",
	.crm_serial_no = @"crm_serial_no",
	.crm_support_end_date = @"crm_support_end_date",
	.crm_support_start_date = @"crm_support_start_date",
	.crm_time_created = @"crm_time_created",
	.crm_time_modified = @"crm_time_modified",
	.crm_vendor_id = @"crm_vendor_id",
	.crm_vendor_name = @"crm_vendor_name",
	.crm_vendor_part_no = @"crm_vendor_part_no",
	.crm_website = @"crm_website",
};

const struct ProductRelationships ProductRelationships = {
	.service = @"service",
};

@implementation ProductID
@end

@implementation _Product

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Product";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Product" inManagedObjectContext:moc_];
}

- (ProductID*)objectID {
	return (ProductID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"crm_discontinuedValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"crm_discontinued"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic crm_description;

@dynamic crm_discontinued;

- (BOOL)crm_discontinuedValue {
	NSNumber *result = [self crm_discontinued];
	return [result boolValue];
}

- (void)setCrm_discontinuedValue:(BOOL)value_ {
	[self setCrm_discontinued:@(value_)];
}

- (BOOL)primitiveCrm_discontinuedValue {
	NSNumber *result = [self primitiveCrm_discontinued];
	return [result boolValue];
}

- (void)setPrimitiveCrm_discontinuedValue:(BOOL)value_ {
	[self setPrimitiveCrm_discontinued:@(value_)];
}

@dynamic crm_glacct;

@dynamic crm_id;

@dynamic crm_manufacturer;

@dynamic crm_mfr_part_no;

@dynamic crm_product_no;

@dynamic crm_productcategory;

@dynamic crm_productcode;

@dynamic crm_productname;

@dynamic crm_productsheet;

@dynamic crm_sales_end_date;

@dynamic crm_sales_start_date;

@dynamic crm_serial_no;

@dynamic crm_support_end_date;

@dynamic crm_support_start_date;

@dynamic crm_time_created;

@dynamic crm_time_modified;

@dynamic crm_vendor_id;

@dynamic crm_vendor_name;

@dynamic crm_vendor_part_no;

@dynamic crm_website;

@dynamic service;

@end

