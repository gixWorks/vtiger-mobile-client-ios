//
//  Activity+Extra.h
//  VTFunctionalitiesApp
//
//  Created by Giovanni on 11/30/13.
//  Copyright (c) 2013 gixWorks. All rights reserved.
//

#import "Activity.h"
#import <CoreData+MagicalRecord.h>
#import "ResponseParser.h"

@interface Activity (Extra)

/*** Init Methods ***/

+ (Activity *)modelObjectWithDictionary:(NSDictionary *)dict;

/*** Representation Methods ***/

- (NSDictionary*)crmRepresentation;

@end
