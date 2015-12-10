//
//  GoProMediaFile.m
//  kiosk
//
//  Created by Adil Malik on 12/11/2015.
//  Copyright © 2015 cape. All rights reserved.
//

#import "GoProMediaFile.h"

@interface GoProMediaFile ()

@property (nonatomic, copy) NSString *fileName;
@property (nonatomic, copy) NSString *path; //realtive path
@property (nonatomic, assign) NSInteger fileSize;
@property (nonatomic, assign) NSInteger previewFileSize;
@property (nonatomic, copy) NSDate *dateModified;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary inFolder:(NSString *)folderName;

@end

@implementation GoProMediaFile

+ (instancetype)mediaFileWithDictionary:(NSDictionary *)dictionary inFolder:(NSString *)folderName
{
    return [[[self class] alloc] initWithDictionary:dictionary inFolder:folderName];
}

#pragma mark - Private
- (instancetype)initWithDictionary:(NSDictionary *)dictionary inFolder:(NSString *)folderName
{
    self = [self init];
    if (self)
    {
        [self populateValuesFromDictionary:dictionary inFolder:folderName];
    }

    return self;
}

#pragma mark - Poplate
- (void)populateValuesFromDictionary:(NSDictionary *)dictionary inFolder:(NSString *)folderName
{
    self.fileName = dictionary[@"n"];
    self.path = [folderName stringByAppendingFormat:@"/%@", self.fileName];
    self.fileSize = [dictionary[@"s"] integerValue];
    self.previewFileSize = [dictionary[@"ls"] integerValue];

    NSTimeInterval date = [dictionary[@"mod"] doubleValue];
    double timeDifference = [[NSTimeZone systemTimeZone] secondsFromGMT];
    NSTimeInterval recordingDate = date - timeDifference;

    self.dateModified = [NSDate dateWithTimeIntervalSince1970:recordingDate];
}

@end