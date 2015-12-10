//
//  GoProCameraManager.h
//  kiosk
//
//  Created by Adil Malik 05/10/2015.
//  Copyright © 2015 cape. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GoProCamera.h"

@interface GoProCameraManager : NSObject

+ (instancetype)sharedManager;

- (void)lookupConnectedCameraWithCompletionBlock:(void (^)(GoProCamera *camera))completionBlock;
- (void)camera:(GoProCamera *)camera connectionStatusWithCompletionBlock:(void (^)(BOOL isConnected))completionBlock;
- (void)camera:(GoProCamera *)camera checkSystemStatusWithCompletionBlock:(void (^)(GoProCamera *camera))completionBlock;

#pragma mark - Recoding
- (void)camera:(GoProCamera *)camera startRecordingWithCompletionBlock:(void (^)(BOOL success))completionBlock;
- (void)camera:(GoProCamera *)camera stopRecordingWithCompletionBlock:(void (^)(BOOL success))completionBlock;

#pragma mark - Mode
- (void)camera:(GoProCamera *)camera setPrimaryMode:(NSInteger)mode completionBlock:(void (^)(BOOL success))completionBlock;
- (void)camera:(GoProCamera *)camera setSecondayPrimaryMode:(NSInteger)mode completionBlock:(void (^)(BOOL success))completionBlock;

#pragma mark - Files
- (void)camera:(GoProCamera *)camera getFilesListWithCompletionBlock:(void (^)(NSArray *filesList))completionBlock;

@end