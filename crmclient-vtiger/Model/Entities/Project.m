#import "Project.h"
#import "CRMFieldConstants.h"
#import "CoreData+MagicalRecord.h"
#import "ModulesHelper.h"
#import "CRMClient.h"

@interface Project ()

// Private interface goes here.

@end

@implementation Project

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
	//Extract custom fields
	NSMutableDictionary *cfields = [[NSMutableDictionary alloc] init];
	[dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
		if ([key hasPrefix:@"cf_"]) {
			//it's a custom field
			[cfields setObject:@{key : obj} forKey:key];
		}
	}];
	return [Project modelObjectWithDictionary:dict customFields:cfields];
}

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict customFields:(NSDictionary*)cfields
{
	NSString *record_id = [dict objectForKey:kProjectId];
	Project *instance;
	
	//I first try to count the entities (should take less time) and load the entity only if strictly necessary (if count > 0). The Count operation should be less intensive than the Fetch, so I use it for checking the existence
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"crm_id = %@", record_id];
	NSUInteger count = [Project MR_countOfEntitiesWithPredicate:predicate];
	
	if (count > 0) {
		instance = [Project MR_findFirstByAttribute:@"crm_id" withValue:record_id];
		NSDateFormatter *dateTimeFormat = [[NSDateFormatter alloc] init];
		[dateTimeFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
		NSDate *time_modified = [dateTimeFormat dateFromString:[dict objectForKey:kFieldModifiedTime]];
		if ([time_modified compare:instance.crm_time_created] == NSOrderedSame) {
#if DEBUG
			NSLog(@"%@ %@ skipping %@ as modified_time is the same", NSStringFromClass([self class]), NSStringFromSelector(_cmd), record_id);
#endif
			//It's the same instance
			return instance;
		}
	}
	else{
		instance = [Project MR_createEntity];
	}
	
	if (![instance updateModelObjectWithDictionary:dict customFields:cfields]) {
		return nil;
	}
	return instance;
}

- (BOOL)updateModelObjectWithDictionary:(NSDictionary*)dict customFields:(NSDictionary*)cfields
{
	// This check serves to make sure that a non-NSDictionary object
	// passed into the model class doesn't break the parsing.
	if([dict isKindOfClass:[NSDictionary class]]) {
		@try {
			//Setup the number formatter
			NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
			[numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
			
			//Setup the date formatters
			NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
			[dateFormat setDateFormat:@"yyyy-MM-dd"];
			NSDateFormatter *timeFormat = [[NSDateFormatter alloc] init];
			[timeFormat setDateFormat:@"HH:mm:ss"];
		
			
			//DateTime Created and Modified
			NSDateFormatter *dateTimeFormat = [[NSDateFormatter alloc] init];
			[dateTimeFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
			NSDate *time_modified = [dateTimeFormat dateFromString:[dict objectForKey:kFieldModifiedTime]];
			NSDate *time_created = [dateTimeFormat dateFromString:[dict objectForKey:kFieldCreatedTime]];
			self.crm_time_modified = time_modified;
			self.crm_time_created = time_created;
			
			//Format some variables
			NSDate *start_date = [dateFormat dateFromString:[dict objectForKey:kProjectStartdate]];
			NSDate *due_date = [dateFormat dateFromString:[dict objectForKey:kProjectTargetenddate]];
			NSDate *end_date_actual = [dateFormat dateFromString:[dict objectForKey:kProjectActualenddate]];
			
			//Properties defined by CRM
			
			self.crm_actualenddate = end_date_actual;
			self.crm_description = [dict objectForKey:kFieldDescription];
			self.crm_id = [dict objectForKey:kProjectId];
			self.crm_priority = [dict objectForKey:kProjectPriority];
			self.crm_progress = [dict objectForKey:kProjectProgress];
			self.crm_project_no = [dict objectForKey:kProjectProject_no];
			self.crm_projectname = [dict objectForKey:kProjectName];
			self.crm_startdate = start_date;
			self.crm_status = [dict objectForKey:kProjectStatus];
			self.crm_targetbudget = [dict objectForKey:kProjectTargetbudget];
			self.crm_targetenddate = due_date;
			self.crm_type = [dict objectForKey:kProjectType];
			self.crm_url = [dict objectForKey:kProjectUrl];
			

			//Related records
			NSDictionary *related_record = [dict objectForKey:kProjectLinkstoaccountscontacts];
			if ([[related_record objectForKey:@"value"] length] > 0) {
				self.crm_related_record_id = [related_record objectForKey:@"value"];
				self.crm_related_record_name = [related_record objectForKey:@"label"];
				[[CRMClient sharedInstance] addRecordToFetchQueue:self.crm_related_record_id];
			}
			NSDictionary *assigned_user = [dict objectForKey:kProjectAssigned_user_id];
			if ([[assigned_user objectForKey:@"value"] length] > 0) {
				self.crm_assigned_user_id = [assigned_user objectForKey:@"value"];
				self.crm_assigned_user_name = [assigned_user objectForKey:@"label"];
			}
			NSDictionary *modified_by = [dict objectForKey:kProjectModifiedby];
			if ([[modified_by objectForKey:@"value"] length] > 0) {
				self.crm_modified_by_id = [modified_by objectForKey:@"value"];
				self.crm_modified_by_name = [modified_by objectForKey:@"label"];
			}
			
			//Custom fields
			NSError *cfieldsError;
			self.my_custom_fields = [NSJSONSerialization dataWithJSONObject:cfields options:NSJSONWritingPrettyPrinted error:&cfieldsError];
			if (cfieldsError != nil) {
				NSLog(@"Entity: %@ Error in custom fields: %@", self.crm_id, [cfieldsError description]);
			}
			
			//Add the relationship with the current service
			self.service = [Service getActive];
		}
		@catch (NSException *exception) {
			//clean this object from the context
			[[NSManagedObjectContext MR_defaultContext] deleteObject:self];
			//log the exception
			NSLog(@"%@ %@ Exception: %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd), [exception description]);
		}
	}
	
	return YES;
}

@end
