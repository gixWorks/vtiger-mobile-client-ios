//
//  GWCertificatesHelper.h
//  ContactiCalVtiger
//
//  Created by Giovanni on 24/07/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GWCertificatesHelper : NSObject

+ (CFDataRef)gw_identityRefFromKeychainFromP12file:(NSData*)fileData withPassword:(NSString*)p12password;

+ (SecIdentityRef)gw_identityFromPersistentRef:(NSData*)persistentRef;

@end
