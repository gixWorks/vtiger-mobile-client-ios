#import "Product.h"
#import "CRMFieldConstants.h"

@interface Product ()

// Private interface goes here.

@end


@implementation Product

+ (Product *)modelObjectWithDictionary:(NSDictionary *)dict
{
    NSString *record_id = [dict objectForKey:kProductFieldId];
    Product *instance;
    
    
    //I first try to count the entities (should take less time) and load the entity only if strictly necessary (if count > 0). The Count operation should be less intensive than the Fetch, so I use it for checking the existence
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"crm_id = %@", record_id];
    NSUInteger count = [Lead MR_countOfEntitiesWithPredicate:predicate];
    
    if (count > 0) {
        instance = [Lead MR_findFirstByAttribute:@"crm_id" withValue:record_id];
        NSDateFormatter *dateTimeFormat = [[NSDateFormatter alloc] init];
        [dateTimeFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
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
        instance = [Lead MR_createEntity];
    }
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if([dict isKindOfClass:[NSDictionary class]]) {
        
        NSDateFormatter *dateTimeFormat = [[NSDateFormatter alloc] init];
        [dateTimeFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate *time_modified = [dateTimeFormat dateFromString:[dict objectForKey:kFieldModifiedTime]];
        NSDate *time_created = [dateTimeFormat dateFromString:[dict objectForKey:kFieldCreatedTime]];
        instance.crm_time_modified = time_modified;
        instance.crm_time_created = time_created;
        
        //Properties defined by CRM
        instance.crm_id = [dict objectForKey:kProductFieldId];
        instance.crm_description = [dict objectForKey:kProductFieldDescription];
        instance.crm_discontinued = [NSNumber numberWithBool:[[dict objectForKey:kProductFieldDiscontinued] boolValue]];
        instance.crm_glacct = [dict objectForKey:kProductFieldGlacct];
        instance.crm_manufacturer = [dict objectForKey:kProductFieldManufacturer];
        instance.crm_mfr_part_no = [dict objectForKey:kProductFieldMfrPartNo];
        instance.crm_product_no = [dict objectForKey:kProductFieldProductNo];
        instance.crm_productcategory = [dict objectForKey:kProductFieldProductCategory];
        instance.crm_productcode = [dict objectForKey:kProductFieldProductCode];
        instance.crm_productname = [dict objectForKey:kProductFieldProductName];
        instance.crm_productsheet = [dict objectForKey:kProductFieldProductSheet];
        instance.crm_sales_end_date = dateFromString([dict objectForKey:kProductFieldSalesEndDate], @"yyyy-MM-dd");
        instance.crm_sales_start_date = dateFromString([dict objectForKey:kProductFieldSalesStartDate], @"yyyy-MM-dd");
        instance.crm_serial_no = [dict objectForKey:kProductFieldSerialNo];
        instance.crm_support_end_date = dateFromString([dict objectForKey:kProductFieldSupportEndDate], @"yyyy-MM-dd");
        instance.crm_support_start_date = dateFromString([dict objectForKey:kProductFieldSupportStartDate], @"yyyy-MM-dd");
        instance.crm_vendor_id = [[dict objectForKey:kProductFieldVendor] objectForKey:@"value"];
        instance.crm_vendor_name = [[dict objectForKey:kProductFieldVendor] objectForKey:@"name"];
        instance.crm_vendor_part_no = [dict objectForKey:kProductFieldVendorPartNo];
        instance.crm_website = [dict objectForKey:kProductFieldWebsite];
        
        //Add the relationship with the current service
        instance.service = [Service getActive];
        
        
    }
    
    return instance;
}

@end
