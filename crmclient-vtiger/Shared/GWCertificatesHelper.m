//
//  GWCertificatesHelper.m
//  ContactiCalVtiger
//
//  Created by Giovanni on 24/07/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#import "GWCertificatesHelper.h"

@implementation GWCertificatesHelper

+ (CFDataRef)gw_identityRefFromKeychainFromP12file:(NSData*)fileData withPassword:(NSString*)p12password
{
    CFDataRef inP12data = (__bridge CFDataRef)fileData;
    
    SecIdentityRef myIdentity;
    SecTrustRef myTrust;
    OSStatus status =  extractIdentityAndTrust(inP12data, p12password, &myIdentity, &myTrust);
    if (status != errSecSuccess) {
        return nil;
    }
    
    SecTrustResultType secTrustEvaluationResult;
    OSStatus trustEvalStatus = SecTrustEvaluate(myTrust, &secTrustEvaluationResult);
    if (trustEvalStatus != errSecSuccess || secTrustEvaluationResult == kSecTrustResultInvalid || secTrustEvaluationResult == kSecTrustResultFatalTrustFailure  || secTrustEvaluationResult == kSecTrustResultInvalid) {
#if DEBUG
        NSLog(@"Error with certificate trust!. Trust evaluation status: %d", (int)trustEvalStatus);
#endif
    }
    
    //CFDataRef (as opposite to SecIdentityRef or SecTrustRef which are lost when app terminates) can be stored
    CFDataRef persistentRefToIdentity = persistentRefForIdentity(myIdentity);
    
    persistentRefForIdentity(myIdentity);

    return persistentRefToIdentity;
}

+ (SecIdentityRef)gw_identityFromPersistentRef:(NSData *)persistentRef
{
    SecIdentityRef myIdentity = identityForPersistentRef((__bridge CFDataRef)(persistentRef));
    return myIdentity;
}

#pragma mark - Methods for opening a P12 file and storing to keychain

OSStatus extractIdentityAndTrust(CFDataRef inP12data, NSString *userPassword, SecIdentityRef *identity, SecTrustRef *trust)
{
    OSStatus securityError = errSecSuccess;
    
    CFStringRef password = (__bridge CFStringRef)(userPassword);
    const void *keys[] = { kSecImportExportPassphrase };
    const void *values[] = { password };
    
    CFDictionaryRef options = CFDictionaryCreate(NULL, keys, values, 1, NULL, NULL);
    
    CFArrayRef items = CFArrayCreate(NULL, 0, 0, NULL);
    securityError = SecPKCS12Import(inP12data, options, &items);
    
    if (securityError == 0) {
        CFDictionaryRef myIdentityAndTrust = CFArrayGetValueAtIndex(items, 0);
        const void *tempIdentity = NULL;
        tempIdentity = CFDictionaryGetValue(myIdentityAndTrust, kSecImportItemIdentity);
        *identity = (SecIdentityRef)tempIdentity;
        const void *tempTrust = NULL;
        tempTrust = CFDictionaryGetValue(myIdentityAndTrust, kSecImportItemTrust);
        *trust = (SecTrustRef)tempTrust;
    }
    
    if (options) {
        CFRelease(options);
    }
    
    return securityError;
}

CFDataRef persistentRefForIdentity(SecIdentityRef identity)
{
    OSStatus status = errSecSuccess;
    
    CFTypeRef  persistent_ref = NULL;
    const void *keys[] =   { kSecReturnPersistentRef, kSecValueRef };
    const void *values[] = { kCFBooleanTrue,          identity };
    CFDictionaryRef dict = CFDictionaryCreate(NULL, keys, values,
                                              2, NULL, NULL);
    status = SecItemAdd(dict, &persistent_ref);
    NSLog(@"SecItemAdd status: %d", (int)status);
    if (status == errSecDuplicateItem) {
        status = SecItemCopyMatching(dict, &persistent_ref);
#if DEBUG
        NSLog(@"certificate was there already");
        NSLog(@"SecItemCopyMatching status: %d", (int)status);
#endif
    }
    
    if (dict)
        CFRelease(dict);
    
    return (CFDataRef)persistent_ref;
}

#pragma mark - Retrieving a identity from Keychain

SecIdentityRef identityForPersistentRef(CFDataRef persistent_ref)
{
    CFTypeRef   identity_ref     = NULL;
    const void *keys[] =   { kSecClass, kSecReturnRef,  kSecValuePersistentRef };
    const void *values[] = { kSecClassIdentity, kCFBooleanTrue, persistent_ref };
    CFDictionaryRef dict = CFDictionaryCreate(NULL, keys, values,
                                              3, NULL, NULL);
    SecItemCopyMatching(dict, &identity_ref);
    
    if (dict)
        CFRelease(dict);
    
    return (SecIdentityRef)identity_ref;
}

@end
