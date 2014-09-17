#import "Sync.h"
#import "Service.h"
#import "CoreData+MagicalRecord.h"

@interface Sync ()

// Private interface goes here.

@end


@implementation Sync

// Custom logic goes here.

+ (instancetype)GW_createSyncWithDate:(NSDate *)date module:(NSString *)module deletedRecords:(NSInteger)deletedRecords updatedRecords:(NSInteger)updatedRecords success:(BOOL)success token:(NSString *)token
{
    Sync *entity = [Sync MR_createEntity];
    entity.syncdate = date;
    entity.syncmodule = module;
    entity.syncrecordsdeleted = @(deletedRecords);
    entity.syncrecordsupdated = @(updatedRecords);
    entity.syncsuccess = @(success);
    entity.synctoken = token;
    entity.service = [Service getActive];
    return entity;
}

+ (instancetype)GW_createSyncWithDate:(NSDate*)date module:(NSString*)module token:(NSString*)token
{
    Sync *entity = [Sync MR_createEntity];
    entity.syncdate = date;
    entity.syncmodule = module;
    entity.synctoken = token;
    entity.service = [Service getActive];
    entity.syncsuccess = nil;
    return entity;
}

+ (void)GW_updateFinishedSyncIdentifiedByToken:(NSString *)token andModule:(NSString *)module deletedRecords:(NSInteger)deletedRecords updatedRecords:(NSInteger)updatedRecords success:(BOOL)success
{
    NSPredicate *p = [NSPredicate predicateWithFormat:@"syncsuccess = NULL AND synctoken = %@ AND syncmodule = %@ AND service = %@", token, module, [Service getActive]];
    Sync *toUpdate = [Sync MR_findFirstWithPredicate:p];
    if (toUpdate != nil) {
        toUpdate.syncrecordsdeleted = @(deletedRecords);
        toUpdate.syncrecordsupdated = @(updatedRecords);
        toUpdate.syncsuccess = @(success);
    }
}


@end
