//
//  NotificationsHandler.h
//  ContactiCalVtiger
//
//  Created by Giovanni on 07/04/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NotificationsHandler : NSObject

- (void)handleClientHasFinishedRelatedRecords:(NSNotification*)notification;

@end
