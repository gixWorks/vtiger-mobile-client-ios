#import "_Sync.h"

@interface Sync : _Sync {}

+ (instancetype)GW_createSyncWithDate:(NSDate*)date module:(NSString*)module deletedRecords:(NSInteger)deletedRecords updatedRecords:(NSInteger)updatedRecords success:(BOOL)success token:(NSString*)token;

+ (instancetype)GW_createSyncWithDate:(NSDate*)date module:(NSString*)module token:(NSString*)token;

+ (void)GW_updateFinishedSyncIdentifiedByToken:(NSString*)token andModule:(NSString*)module deletedRecords:(NSInteger)deletedRecords updatedRecords:(NSInteger)updatedRecords success:(BOOL)success;

@end
