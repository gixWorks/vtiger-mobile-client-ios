// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Product.h instead.

#import <CoreData/CoreData.h>

extern const struct ProductAttributes {
	__unsafe_unretained NSString *crm_description;
	__unsafe_unretained NSString *crm_discontinued;
	__unsafe_unretained NSString *crm_glacct;
	__unsafe_unretained NSString *crm_id;
	__unsafe_unretained NSString *crm_manufacturer;
	__unsafe_unretained NSString *crm_mfr_part_no;
	__unsafe_unretained NSString *crm_product_no;
	__unsafe_unretained NSString *crm_productcategory;
	__unsafe_unretained NSString *crm_productcode;
	__unsafe_unretained NSString *crm_productname;
	__unsafe_unretained NSString *crm_productsheet;
	__unsafe_unretained NSString *crm_sales_end_date;
	__unsafe_unretained NSString *crm_sales_start_date;
	__unsafe_unretained NSString *crm_serial_no;
	__unsafe_unretained NSString *crm_support_end_date;
	__unsafe_unretained NSString *crm_support_start_date;
	__unsafe_unretained NSString *crm_time_created;
	__unsafe_unretained NSString *crm_time_modified;
	__unsafe_unretained NSString *crm_vendor_id;
	__unsafe_unretained NSString *crm_vendor_name;
	__unsafe_unretained NSString *crm_vendor_part_no;
	__unsafe_unretained NSString *crm_website;
} ProductAttributes;

extern const struct ProductRelationships {
	__unsafe_unretained NSString *service;
} ProductRelationships;

@class Service;

@interface ProductID : NSManagedObjectID {}
@end

@interface _Product : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ProductID* objectID;

@property (nonatomic, strong) NSString* crm_description;

//- (BOOL)validateCrm_description:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* crm_discontinued;

@property (atomic) BOOL crm_discontinuedValue;
- (BOOL)crm_discontinuedValue;
- (void)setCrm_discontinuedValue:(BOOL)value_;

//- (BOOL)validateCrm_discontinued:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_glacct;

//- (BOOL)validateCrm_glacct:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_id;

//- (BOOL)validateCrm_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_manufacturer;

//- (BOOL)validateCrm_manufacturer:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_mfr_part_no;

//- (BOOL)validateCrm_mfr_part_no:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_product_no;

//- (BOOL)validateCrm_product_no:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_productcategory;

//- (BOOL)validateCrm_productcategory:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_productcode;

//- (BOOL)validateCrm_productcode:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_productname;

//- (BOOL)validateCrm_productname:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_productsheet;

//- (BOOL)validateCrm_productsheet:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* crm_sales_end_date;

//- (BOOL)validateCrm_sales_end_date:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* crm_sales_start_date;

//- (BOOL)validateCrm_sales_start_date:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_serial_no;

//- (BOOL)validateCrm_serial_no:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* crm_support_end_date;

//- (BOOL)validateCrm_support_end_date:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* crm_support_start_date;

//- (BOOL)validateCrm_support_start_date:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* crm_time_created;

//- (BOOL)validateCrm_time_created:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* crm_time_modified;

//- (BOOL)validateCrm_time_modified:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_vendor_id;

//- (BOOL)validateCrm_vendor_id:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_vendor_name;

//- (BOOL)validateCrm_vendor_name:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_vendor_part_no;

//- (BOOL)validateCrm_vendor_part_no:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* crm_website;

//- (BOOL)validateCrm_website:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Service *service;

//- (BOOL)validateService:(id*)value_ error:(NSError**)error_;

@end

@interface _Product (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveCrm_description;
- (void)setPrimitiveCrm_description:(NSString*)value;

- (NSNumber*)primitiveCrm_discontinued;
- (void)setPrimitiveCrm_discontinued:(NSNumber*)value;

- (BOOL)primitiveCrm_discontinuedValue;
- (void)setPrimitiveCrm_discontinuedValue:(BOOL)value_;

- (NSString*)primitiveCrm_glacct;
- (void)setPrimitiveCrm_glacct:(NSString*)value;

- (NSString*)primitiveCrm_id;
- (void)setPrimitiveCrm_id:(NSString*)value;

- (NSString*)primitiveCrm_manufacturer;
- (void)setPrimitiveCrm_manufacturer:(NSString*)value;

- (NSString*)primitiveCrm_mfr_part_no;
- (void)setPrimitiveCrm_mfr_part_no:(NSString*)value;

- (NSString*)primitiveCrm_product_no;
- (void)setPrimitiveCrm_product_no:(NSString*)value;

- (NSString*)primitiveCrm_productcategory;
- (void)setPrimitiveCrm_productcategory:(NSString*)value;

- (NSString*)primitiveCrm_productcode;
- (void)setPrimitiveCrm_productcode:(NSString*)value;

- (NSString*)primitiveCrm_productname;
- (void)setPrimitiveCrm_productname:(NSString*)value;

- (NSString*)primitiveCrm_productsheet;
- (void)setPrimitiveCrm_productsheet:(NSString*)value;

- (NSDate*)primitiveCrm_sales_end_date;
- (void)setPrimitiveCrm_sales_end_date:(NSDate*)value;

- (NSDate*)primitiveCrm_sales_start_date;
- (void)setPrimitiveCrm_sales_start_date:(NSDate*)value;

- (NSString*)primitiveCrm_serial_no;
- (void)setPrimitiveCrm_serial_no:(NSString*)value;

- (NSDate*)primitiveCrm_support_end_date;
- (void)setPrimitiveCrm_support_end_date:(NSDate*)value;

- (NSDate*)primitiveCrm_support_start_date;
- (void)setPrimitiveCrm_support_start_date:(NSDate*)value;

- (NSDate*)primitiveCrm_time_created;
- (void)setPrimitiveCrm_time_created:(NSDate*)value;

- (NSDate*)primitiveCrm_time_modified;
- (void)setPrimitiveCrm_time_modified:(NSDate*)value;

- (NSString*)primitiveCrm_vendor_id;
- (void)setPrimitiveCrm_vendor_id:(NSString*)value;

- (NSString*)primitiveCrm_vendor_name;
- (void)setPrimitiveCrm_vendor_name:(NSString*)value;

- (NSString*)primitiveCrm_vendor_part_no;
- (void)setPrimitiveCrm_vendor_part_no:(NSString*)value;

- (NSString*)primitiveCrm_website;
- (void)setPrimitiveCrm_website:(NSString*)value;

- (Service*)primitiveService;
- (void)setPrimitiveService:(Service*)value;

@end
