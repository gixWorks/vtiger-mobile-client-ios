//
//  DDLogLevel.h
//  vtcrmclient
//
//  Created by Giovanni on 17/09/14.
//  Copyright (c) 2014 gixWorks. All rights reserved.
//

#ifndef vtcrmclient_DDLogLevel_h
#define vtcrmclient_DDLogLevel_h

#ifdef DEBUG
static const int ddLogLevel = LOG_LEVEL_VERBOSE;
#else
static const int ddLogLevel = LOG_LEVEL_ERROR;
#endif


#endif
