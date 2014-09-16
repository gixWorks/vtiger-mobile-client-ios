#import "CRMErrorMessage.h"


@interface CRMErrorMessage ()

// Private interface goes here.

@end


@implementation CRMErrorMessage

+ (CRMErrorMessage*)addErrorMessageWithMessage:(id)message
{

    NSString* msgString;
    if ([message isKindOfClass:[NSDictionary class]]) {
        msgString = [message description];
    }
    else if([message isKindOfClass:[NSError class]]){
        msgString = [message localizedDescription];
    }
    else if([message isKindOfClass:[NSString class]]){
        msgString = message;
    }
    else{
        return nil;
    }
    CRMErrorMessage *em = [CRMErrorMessage MR_createEntity];
    em.crm_message = msgString;
    em.crm_timestamp = [NSDate date];
    em.service = [Service getActive];
    return  em;
}


@end
