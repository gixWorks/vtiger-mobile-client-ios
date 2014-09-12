// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to GWLocation.m instead.

#import "_GWLocation.h"

const struct GWLocationAttributes GWLocationAttributes = {
	.gw_address = @"gw_address",
	.gw_latitude = @"gw_latitude",
	.gw_longitude = @"gw_longitude",
	.gw_name = @"gw_name",
};

const struct GWLocationRelationships GWLocationRelationships = {
	.service = @"service",
};

@implementation GWLocationID
@end

@implementation _GWLocation

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"GWLocation" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"GWLocation";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"GWLocation" inManagedObjectContext:moc_];
}

- (GWLocationID*)objectID {
	return (GWLocationID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"gw_latitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"gw_latitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"gw_longitudeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"gw_longitude"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic gw_address;

@dynamic gw_latitude;

- (double)gw_latitudeValue {
	NSNumber *result = [self gw_latitude];
	return [result doubleValue];
}

- (void)setGw_latitudeValue:(double)value_ {
	[self setGw_latitude:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveGw_latitudeValue {
	NSNumber *result = [self primitiveGw_latitude];
	return [result doubleValue];
}

- (void)setPrimitiveGw_latitudeValue:(double)value_ {
	[self setPrimitiveGw_latitude:[NSNumber numberWithDouble:value_]];
}

@dynamic gw_longitude;

- (double)gw_longitudeValue {
	NSNumber *result = [self gw_longitude];
	return [result doubleValue];
}

- (void)setGw_longitudeValue:(double)value_ {
	[self setGw_longitude:[NSNumber numberWithDouble:value_]];
}

- (double)primitiveGw_longitudeValue {
	NSNumber *result = [self primitiveGw_longitude];
	return [result doubleValue];
}

- (void)setPrimitiveGw_longitudeValue:(double)value_ {
	[self setPrimitiveGw_longitude:[NSNumber numberWithDouble:value_]];
}

@dynamic gw_name;

@dynamic service;

@end

