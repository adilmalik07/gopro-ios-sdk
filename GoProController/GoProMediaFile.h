//
//  GoProMediaFile.h
//  kiosk
//
//  Created by Adil Malik on 12/11/2015.
//  Copyright © 2015 cape. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoProMediaFile : NSObject

@property (nonatomic, copy, readonly) NSString *fileName;
@property (nonatomic, copy, readonly) NSString *path; //realtive path
@property (nonatomic, readonly) NSInteger fileSize;
@property (nonatomic, readonly) NSInteger previewFileSize;
@property (nonatomic, copy, readonly) NSDate *dateModified;


+ (instancetype)mediaFileWithDictionary:(NSDictionary *)dictionary inFolder:(NSString *)folderName;

@end