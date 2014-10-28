#import "ProjectTask.h"
#import "Project.h"
#import "CoreData+MagicalRecord.h"
#import "CRMFieldConstants.h"
#import "CRMConstants.h"
#import "GWPreferencesHelper.h"
#import "NSDate+GWUtilities.h"

@interface ProjectTask ()

// Private interface goes here.

@end

@implementation ProjectTask

+ (ProjectTask *)modelObjectWithDictionary:(NSDictionary *)dict
{
	//Extract custom fields
	NSMutableDictionary *cfields = [[NSMutableDictionary alloc] init];
	[dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
		if ([key hasPrefix:@"cf_"]) {
			//it's a custom field
			[cfields setObject:@{key : obj} forKey:key];
		}
	}];
	return [ProjectTask modelObjectWithDictionary:dict customFields:cfields];
}

+ (ProjectTask *)modelObjectWithDictionary:(NSDictionary *)dict customFields:(NSDictionary*)cfields
{
	NSString *record_id = [dict objectForKey:kProjecttaskId];
	ProjectTask *instance;
	
	//I first try to count the entities (should take less time) and load the entity only if strictly necessary (if count > 0). The Count operation should be less intensive than the Fetch, so I use it for checking the existence
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"crm_id = %@", record_id];
	NSUInteger count = [ProjectTask MR_countOfEntitiesWithPredicate:predicate];
	
	if (count > 0) {
		instance = [ProjectTask MR_findFirstByAttribute:@"crm_id" withValue:record_id];
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
		instance = [ProjectTask MR_createEntity];
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
			NSDate *start_date = [dateFormat dateFromString:[dict objectForKey:kProjecttaskStartdate]];
			NSDate *end_date = [dateFormat dateFromString:[dict objectForKey:kProjecttaskEnddate]];
			
			//Properties defined by CRM
			
			self.crm_due_date = end_date;
			self.crm_date_start = start_date;
			self.crm_description = [dict objectForKey:kFieldDescription];
			self.crm_hours = [dict objectForKey:kProjecttaskHours];
			self.crm_id = [dict objectForKey:kProjecttaskId];
			self.crm_subject = [dict objectForKey:kProjecttaskName];
			self.crm_priority = [dict objectForKey:kProjecttaskPriority];
			self.crm_progress = [dict objectForKey:kProjecttaskProgress];
			self.crm_status = [dict objectForKey:kProjecttaskStatus];
			self.crm_task_no = [dict objectForKey:kProjecttaskNo];
			self.crm_task_number = [dict objectForKey:kProjecttaskNumber];
			self.crm_type = [dict objectForKey:kProjecttaskType];
			
			
			//Properties defined by me
			NSCalendar *cal = [NSCalendar currentCalendar];
			NSDateComponents *comps = [[NSDateComponents alloc] init];
			NSDateComponents *start_date_comp = [cal components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self.crm_date_start];
			NSDateComponents *end_date_comp = [cal components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:self.crm_due_date];
			NSDateComponents *start_time_comp;

			start_time_comp = [NSDateComponents alloc];
			[start_time_comp setHour:0];
			[start_time_comp setMinute:0];
			[start_time_comp setSecond:0];
			[comps setYear:[start_date_comp year]];
			[comps setMonth:[start_date_comp month]];
			[comps setDay:[start_date_comp day]];
			[comps setHour:[start_time_comp hour]];
			[comps setMinute:[start_time_comp minute]];
			[comps setSecond:[start_time_comp second]];
			
			self.my_datetime_start = [[cal dateFromComponents:comps] gw_convertToTimeZone:[Service getActive].crm_timezone_server];
			self.my_datetime_end = [cal dateFromComponents:end_date_comp];
			self.my_timezone = [Service getActive].crm_timezone_server;


			//Now that we have end date, we check if we should actually sync it
//			NSDate *syncBackTo = [GWPreferencesHelper getDateToSyncBackTo];
//			if ([self.crm_due_date compare:syncBackTo] == NSOrderedAscending) {
//				//Means we should not sync this item
//#if DEBUG
//				NSLog(@"%@ Skipping item %@ as it happens earlier than the date to sync back to: %@", NSStringFromSelector(_cmd), self.crm_id, syncBackTo);
//#endif
//				return NO;
//			}

			//Related records
			NSDictionary *assigned_user = [dict objectForKey:kProjecttaskAssigned_user_id];
			if ([[assigned_user objectForKey:@"value"] length] > 0) {
				self.crm_assigned_user_id = [assigned_user objectForKey:@"value"];
				self.crm_assigned_user_name = [assigned_user objectForKey:@"label"];
			}
			NSDictionary *modified_by = [dict objectForKey:kProjecttaskModifiedby];
			if ([[modified_by objectForKey:@"value"] length] > 0) {
				self.crm_modified_by_id = [modified_by objectForKey:@"value"];
				self.crm_modified_by_name = [modified_by objectForKey:@"label"];
			}
			NSDictionary *related_proj = [dict objectForKey:kProjecttaskProjectid];
			if ([[related_proj objectForKey:@"value"] length] > 0) {
				self.crm_related_project_id = [related_proj objectForKey:@"value"];
				self.crm_related_project_name = [related_proj objectForKey:@"label"];
			}
			
			//Custom fields
			NSError *cfieldsError;
			self.my_custom_fields = [NSJSONSerialization dataWithJSONObject:cfields options:NSJSONWritingPrettyPrinted error:&cfieldsError];
			if (cfieldsError != nil) {
				NSLog(@"Entity: %@ Error in custom fields: %@", self.crm_id, [cfieldsError description]);
			}
			
			
			//Look for existing related project
			Project *project = [Project MR_findFirstByAttribute:@"crm_id" withValue:self.crm_related_project_id];
			if (project) {
				self.project = project;
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

- (NSDictionary *)crmRepresentation
{
	
	BOOL isNewRecord = NO;
	if ([self.crm_id rangeOfString:@"-"].location != NSNotFound) {
		//if the record id is in the structure 1x4345-5445-54554-445 it's been created with CFUUID
		isNewRecord = YES;
	}
	//Should be like this:
	// {"date_start":"2014-10-17", "due_date": "2014-10-18","projecttaskname":"Sent from API", "projectid": "30x70", "assigned_user_id": "19x1"}
	NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
	[numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
	
	//Setup the date formatters
	NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
	[dateFormat setDateFormat:@"yyyy-MM-dd"];
	[dateFormat setTimeZone:[NSTimeZone timeZoneWithName:[Service getActive].crm_timezone_server]];

	
	NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
	if ([self.crm_assigned_user_id length] > 0) { [dict setObject:self.crm_assigned_user_id forKey:kProjecttaskAssigned_user_id]; }
	[dict setObject:[dateFormat stringFromDate:self.crm_date_start] forKey:kProjecttaskStartdate];
	[dict setObject:self.crm_description forKey:kFieldDescription];
	[dict setObject:[dateFormat stringFromDate:self.crm_due_date] forKey:kProjecttaskEnddate];
	[dict setObject:self.crm_hours forKey:kProjecttaskHours];
	if (isNewRecord == NO) { [dict setObject:self.crm_id forKey:kProjecttaskId]; }
	[dict setObject:self.crm_priority forKey:kProjecttaskPriority];
	[dict setObject:self.crm_progress forKey:kProjecttaskProgress];
	if([self.crm_related_project_id length] > 0){ 	[dict setObject:self.crm_related_project_id forKey:kProjecttaskProjectid]; }
	if (self.crm_status) {
		[dict setObject:self.crm_status forKey:kProjecttaskStatus];
	}
	[dict setObject:self.crm_subject forKey:kProjecttaskName];
	[dict setObject:self.crm_task_no forKey:kProjecttaskNo];
	[dict setObject:self.crm_task_number forKey:kProjecttaskNumber];
	[dict setObject:self.crm_type forKey:kProjecttaskType];
	//Custom fields
	if (self.my_custom_fields) {
		NSDictionary *cFields = [NSJSONSerialization JSONObjectWithData:self.my_custom_fields options:0 error:nil];
		for (NSString *cFieldName in [cFields allKeys]) {
			[dict setValue:[[cFields objectForKey:cFieldName] objectForKey:@"value"] forKey:cFieldName];
		}
	}
	
	return [dict copy]; //We return the immutable copy because dict is mutable.
}

- (NSDictionary *)proxyForJson
{
	return [self crmRepresentation];
}

@end
