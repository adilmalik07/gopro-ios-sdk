//
//  GoProCamera.h
//  kiosk
//
//  Created by Adil Malik on 05/10/2015.
//  Copyright © 2015 cape. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GoProCameraStatus.h"

@interface GoProCamera : NSObject

@property (nonatomic, readonly) NSNumber *modelNumber;
@property (nonatomic, readonly) NSString *modelName;
@property (nonatomic, readonly) NSString *firmwareVersion;
@property (nonatomic, readonly) NSString *serialNumber;
@property (nonatomic, readonly) NSString *boardType;
@property (nonatomic, readonly) NSString *mac;
@property (nonatomic, readonly) NSString *ssid;
@property (nonatomic, readonly) NSNumber *hasDefaultCredentials;
@property (nonatomic, readonly) NSString *gitSha1;

@property (nonatomic, readonly) GoProCameraSystemStatus *systemStatus;
@property (nonatomic, readonly) GoProCameraAppStatus *appStatus;
@property (nonatomic, readonly) GoProCameraVideoStatus *videoStatus;
@property (nonatomic, readonly) GoProCameraWirelessStatus *wirelessStatus;
@property (nonatomic, readonly) GoProCameraStreamStatus *streamStatus;
@property (nonatomic, readonly) GoProCameraStorageStatus *storageStatus;
@property (nonatomic, readonly) GoProCameraSetupStatus *setupStatus;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
+ (instancetype)camerWithDictionary:(NSDictionary *)dictionary;

- (void)updateCameraStatusFromDictionary:(NSDictionary *)dictionary;

- (BOOL)isSameCamera:(GoProCamera *)camera;


@end