//
//  MagicalRecord+GMAdditions.m
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 1/17/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import "MagicalRecord+GMAdditions.h"
#import "CoreData+MagicalRecord.h"

@implementation MagicalRecord (GMAdditions)

+ (void)GW_cleanAndResetupDB
{
    NSError *error = nil;
    NSURL *storeURL = [NSPersistentStore MR_urlForStoreName:[MagicalRecord defaultStoreName]];
    [MagicalRecord cleanUp];
    if([[NSFileManager defaultManager] removeItemAtURL:storeURL error:&error]){
        [MagicalRecord setupAutoMigratingCoreDataStack];
    }
    else{
        NSLog(@"An error has occurred while deleting store named: %@", [MagicalRecord defaultStoreName]);
        NSLog(@"Error description: %@", error.description);
    }
}

@end
