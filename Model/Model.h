//
//  Model.h
//  CalendarAppThatSyncs
//
//  Created by Giovanni on 19/07/12.
//
//

#ifndef CalendarAppThatSyncs_AllEntities_h
#define CalendarAppThatSyncs_AllEntities_h

#import <CoreData+MagicalRecord.h>

//Model objects without Categories
#import "Sync.h"
#import "SyncToken.h"
#import "ModifiedRecord.h"

//Their Extra categories, which already import the base class
#import "Activity+Extra.h"
#import "Module+Extra.h"
#import "Lead+Extra.h"
#import "LeadAddress+Extra.h"
#import "Contact+Extra.h"
#import "ContactAddress+Extra.h"
#import "Account+Extra.h"
#import "AccountAddress+Extra.h"
#import "Potential+Extra.h"
#import "Service+Extra.h"
#import "Product+Extra.h"
#import "Ticket+Extra.h"
#import "CRMField+Extra.h"

#endif
