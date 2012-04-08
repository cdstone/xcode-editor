////////////////////////////////////////////////////////////////////////////////
//
//  EXPANZ
//  Copyright 2008-2011 EXPANZ
//  All Rights Reserved.
//
//  NOTICE: Expanz permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////
#import "xcode_FrameworkDefinition.h"


@implementation xcode_FrameworkDefinition

@synthesize isSDKFramework = _sdkFramework;
@synthesize filePath = _filePath;
@synthesize copyToDestination = _copyToDestination;

/* ================================================== Initializers ================================================== */
- (id) initWithFilePath:(NSString*)filePath copyToDestination:(BOOL)copyToDestination {
    self = [super init];
    if (self) {
        _filePath = [filePath copy];
        _copyToDestination = copyToDestination;
        _sdkFramework = NO;
    }
    return self;
}
- (id) initWithFilePath:(NSString*)filePath copyToDestination:(BOOL)copyToDestination isSDK:(BOOL)sdk
{
    self = [self initWithFilePath:filePath copyToDestination:copyToDestination];
    if (self)
    {
        _sdkFramework = sdk;
    }
    return self;
}

/* ================================================ Interface Methods =============================================== */
- (NSString*) name {
    return [_filePath lastPathComponent];
}


@end