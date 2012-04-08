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

#import "xcode_KeyBuilder.h"

@implementation xcode_KeyBuilder

/* ================================================= Class Methods ================================================== */
+ (xcode_KeyBuilder*) forItemNamed:(NSString*)name {
    NSString* salt = [[NSDate date] description];
    NSData* data = [[name stringByAppendingString:salt] dataUsingEncoding:NSUTF8StringEncoding];
    return [[xcode_KeyBuilder alloc] initHashValueMD5HashWithBytes:[data bytes] length:[data length]];
}

+ (xcode_KeyBuilder*) forDictionary:(NSDictionary*)dict {
    NSString* salt = [[NSDate date] description];
	NSMutableData *data = [[NSMutableData alloc] init];
    [data appendData:[salt dataUsingEncoding:NSUTF8StringEncoding]];
	NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
	[archiver encodeObject:dict forKey:@"NSDictionary"];
	[archiver finishEncoding];
    return [[xcode_KeyBuilder alloc] initHashValueMD5HashWithBytes:[data bytes] length:[data length]];
}


/* ================================================== Initializers ================================================== */
- (id) initHashValueMD5HashWithBytes:(const void*)bytes length:(NSUInteger)length {
    self = [super init];
    if (self != nil) {
        CC_MD5(bytes, (int) length, _value);
    }
    return self;
}

/* ================================================ Interface Methods =============================================== */
- (NSString*) build {
    NSInteger byteLength = sizeof(HashValueMD5Hash);
    NSMutableString* stringValue = [NSMutableString stringWithCapacity:byteLength * 2];
    NSInteger i;
    for (i = 0; i < byteLength; i++) {
        [stringValue appendFormat:@"%02x", _value[i]];
    }
    return [stringValue substringToIndex:24];
}


@end
