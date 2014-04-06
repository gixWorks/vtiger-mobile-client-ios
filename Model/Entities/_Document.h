// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Document.h instead.

#import <CoreData/CoreData.h>


extern const struct DocumentAttributes {
	__unsafe_unretained NSString *crm_assigned_user_id;
	__unsafe_unretained NSString *crm_assigned_user_name;
	__unsafe_unretained NSString *crm_filedownloadcount;
	__unsafe_unretained NSString *crm_filelocationtype;
	__unsafe_unretained NSString *crm_filesize;
	__unsafe_unretained NSString *crm_filestatus;
	__unsafe_unretained NSString *crm_filetype;
	__unsafe_unretained NSString *crm_fileversion;
	__unsafe_unretained NSString *crm_folder_id;
	__unsafe_unretained NSString *crm_folder_name;
	__unsafe_unretained NSString *crm_id;
	__unsafe_unretained NSString *crm_note_content;
	__unsafe_unretained NSString *crm_note_no;
	__unsafe_unretained NSString *crm_note_title;
	__unsafe_unretained NSString *crm_time_created;
	__unsafe_unretained NSString *crm_time_modified;
} DocumentAttributes;

extern const struct DocumentRelationships {
	__unsafe_unretained NSString *service;
} DocumentRelationships;

extern const struct DocumentFetchedProperties {
} DocumentFetchedProperties;

@class Service;


















@interface DocumentID : NSManagedObjectID {}
@end

@interface _Document : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (DocumentID*)objectID;





@property (nonatomic, strong) NSString* crm_assigned_user_id;



//- (BOOL)validateCrm_assigned_user_id:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_assigned_user_name;



//- (BOOL)validateCrm_assigned_user_name:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* crm_filedownloadcount;



@property int32_t crm_filedownloadcountValue;
- (int32_t)crm_filedownloadcountValue;
- (void)setCrm_filedownloadcountValue:(int32_t)value_;

//- (BOOL)validateCrm_filedownloadcount:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_filelocationtype;



//- (BOOL)validateCrm_filelocationtype:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* crm_filesize;



@property int32_t crm_filesizeValue;
- (int32_t)crm_filesizeValue;
- (void)setCrm_filesizeValue:(int32_t)value_;

//- (BOOL)validateCrm_filesize:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_filestatus;



//- (BOOL)validateCrm_filestatus:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_filetype;



//- (BOOL)validateCrm_filetype:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_fileversion;



//- (BOOL)validateCrm_fileversion:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_folder_id;



//- (BOOL)validateCrm_folder_id:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_folder_name;



//- (BOOL)validateCrm_folder_name:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_id;



//- (BOOL)validateCrm_id:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_note_content;



//- (BOOL)validateCrm_note_content:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_note_no;



//- (BOOL)validateCrm_note_no:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* crm_note_title;



//- (BOOL)validateCrm_note_title:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* crm_time_created;



//- (BOOL)validateCrm_time_created:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* crm_time_modified;



//- (BOOL)validateCrm_time_modified:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Service *service;

//- (BOOL)validateService:(id*)value_ error:(NSError**)error_;





@end

@interface _Document (CoreDataGeneratedAccessors)

@end

@interface _Document (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveCrm_assigned_user_id;
- (void)setPrimitiveCrm_assigned_user_id:(NSString*)value;




- (NSString*)primitiveCrm_assigned_user_name;
- (void)setPrimitiveCrm_assigned_user_name:(NSString*)value;




- (NSNumber*)primitiveCrm_filedownloadcount;
- (void)setPrimitiveCrm_filedownloadcount:(NSNumber*)value;

- (int32_t)primitiveCrm_filedownloadcountValue;
- (void)setPrimitiveCrm_filedownloadcountValue:(int32_t)value_;




- (NSString*)primitiveCrm_filelocationtype;
- (void)setPrimitiveCrm_filelocationtype:(NSString*)value;




- (NSNumber*)primitiveCrm_filesize;
- (void)setPrimitiveCrm_filesize:(NSNumber*)value;

- (int32_t)primitiveCrm_filesizeValue;
- (void)setPrimitiveCrm_filesizeValue:(int32_t)value_;




- (NSString*)primitiveCrm_filestatus;
- (void)setPrimitiveCrm_filestatus:(NSString*)value;




- (NSString*)primitiveCrm_filetype;
- (void)setPrimitiveCrm_filetype:(NSString*)value;




- (NSString*)primitiveCrm_fileversion;
- (void)setPrimitiveCrm_fileversion:(NSString*)value;




- (NSString*)primitiveCrm_folder_id;
- (void)setPrimitiveCrm_folder_id:(NSString*)value;




- (NSString*)primitiveCrm_folder_name;
- (void)setPrimitiveCrm_folder_name:(NSString*)value;




- (NSString*)primitiveCrm_id;
- (void)setPrimitiveCrm_id:(NSString*)value;




- (NSString*)primitiveCrm_note_content;
- (void)setPrimitiveCrm_note_content:(NSString*)value;




- (NSString*)primitiveCrm_note_no;
- (void)setPrimitiveCrm_note_no:(NSString*)value;




- (NSString*)primitiveCrm_note_title;
- (void)setPrimitiveCrm_note_title:(NSString*)value;




- (NSDate*)primitiveCrm_time_created;
- (void)setPrimitiveCrm_time_created:(NSDate*)value;




- (NSDate*)primitiveCrm_time_modified;
- (void)setPrimitiveCrm_time_modified:(NSDate*)value;





- (Service*)primitiveService;
- (void)setPrimitiveService:(Service*)value;


@end
