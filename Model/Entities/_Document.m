// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Document.m instead.

#import "_Document.h"

const struct DocumentAttributes DocumentAttributes = {
	.crm_assigned_user_id = @"crm_assigned_user_id",
	.crm_assigned_user_name = @"crm_assigned_user_name",
	.crm_filedownloadcount = @"crm_filedownloadcount",
	.crm_filelocationtype = @"crm_filelocationtype",
	.crm_filesize = @"crm_filesize",
	.crm_filestatus = @"crm_filestatus",
	.crm_filetype = @"crm_filetype",
	.crm_fileversion = @"crm_fileversion",
	.crm_folder_id = @"crm_folder_id",
	.crm_folder_name = @"crm_folder_name",
	.crm_id = @"crm_id",
	.crm_note_content = @"crm_note_content",
	.crm_note_no = @"crm_note_no",
	.crm_note_title = @"crm_note_title",
	.crm_time_created = @"crm_time_created",
	.crm_time_modified = @"crm_time_modified",
};

const struct DocumentRelationships DocumentRelationships = {
	.service = @"service",
};

const struct DocumentFetchedProperties DocumentFetchedProperties = {
};

@implementation DocumentID
@end

@implementation _Document

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Document" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Document";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Document" inManagedObjectContext:moc_];
}

- (DocumentID*)objectID {
	return (DocumentID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"crm_filedownloadcountValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"crm_filedownloadcount"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"crm_filesizeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"crm_filesize"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic crm_assigned_user_id;






@dynamic crm_assigned_user_name;






@dynamic crm_filedownloadcount;



- (int32_t)crm_filedownloadcountValue {
	NSNumber *result = [self crm_filedownloadcount];
	return [result intValue];
}

- (void)setCrm_filedownloadcountValue:(int32_t)value_ {
	[self setCrm_filedownloadcount:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveCrm_filedownloadcountValue {
	NSNumber *result = [self primitiveCrm_filedownloadcount];
	return [result intValue];
}

- (void)setPrimitiveCrm_filedownloadcountValue:(int32_t)value_ {
	[self setPrimitiveCrm_filedownloadcount:[NSNumber numberWithInt:value_]];
}





@dynamic crm_filelocationtype;






@dynamic crm_filesize;



- (int32_t)crm_filesizeValue {
	NSNumber *result = [self crm_filesize];
	return [result intValue];
}

- (void)setCrm_filesizeValue:(int32_t)value_ {
	[self setCrm_filesize:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveCrm_filesizeValue {
	NSNumber *result = [self primitiveCrm_filesize];
	return [result intValue];
}

- (void)setPrimitiveCrm_filesizeValue:(int32_t)value_ {
	[self setPrimitiveCrm_filesize:[NSNumber numberWithInt:value_]];
}





@dynamic crm_filestatus;






@dynamic crm_filetype;






@dynamic crm_fileversion;






@dynamic crm_folder_id;






@dynamic crm_folder_name;






@dynamic crm_id;






@dynamic crm_note_content;






@dynamic crm_note_no;






@dynamic crm_note_title;






@dynamic crm_time_created;






@dynamic crm_time_modified;






@dynamic service;

	






@end
