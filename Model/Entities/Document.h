//
//  Document.h
//  TapkuLibrary
//
//  Created by Giovanni on 24/02/14.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Service;

@interface Document : NSManagedObject

@property (nonatomic, retain) NSDate * crm_time_created;
@property (nonatomic, retain) NSDate * crm_time_modified;
@property (nonatomic, retain) NSString * crm_note_title;
@property (nonatomic, retain) NSString * crm_note_content;
@property (nonatomic, retain) NSString * crm_assigned_user_id;
@property (nonatomic, retain) NSString * crm_assigned_user_name;
@property (nonatomic, retain) NSString * crm_folder_id;
@property (nonatomic, retain) NSString * crm_folder_name;
@property (nonatomic, retain) NSString * crm_filetype;
@property (nonatomic, retain) NSString * crm_filelocationtype;
@property (nonatomic, retain) NSNumber * crm_filesize;
@property (nonatomic, retain) NSString * crm_fileversion;
@property (nonatomic, retain) NSString * crm_filestatus;
@property (nonatomic, retain) NSString * crm_note_no;
@property (nonatomic, retain) NSString * crm_id;
@property (nonatomic, retain) NSNumber * crm_filedownloadcount;
@property (nonatomic, retain) Service *service;

@end
