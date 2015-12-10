//
//  GoProCameraStatus.h
//  kiosk
//
//  Created by Adil Malik on 06/11/2015.
//  Copyright © 2015 cape. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoProCameraStatus : NSObject

+ (instancetype)statusWithDictionary:(NSDictionary *)dictionary forMappingFields:(NSArray *)mappingFields;

@end

#pragma mark - GoProCameraSystemStatus
@interface GoProCameraSystemStatus : GoProCameraStatus

@property (nonatomic, readonly) NSNumber *internalBatteryPresent;
@property (nonatomic, readonly) NSNumber *internalBatteryLevel;
@property (nonatomic, readonly) NSNumber *externalBatteryPresent;
@property (nonatomic, readonly) NSNumber *externalBatteryLevel;
@property (nonatomic, readonly) NSNumber *systemHot;
@property (nonatomic, readonly) NSNumber *systemBusy;
@property (nonatomic, readonly) NSNumber *quickCaptureActive;
@property (nonatomic, readonly) NSNumber *encodingActive;
@property (nonatomic, readonly) NSNumber *lcdLockActive;
@property (nonatomic, readonly) NSNumber *cameraLocateActive;
@property (nonatomic, readonly) NSNumber *currentTimeMsec;
@property (nonatomic, readonly) NSNumber *nextPollMsec;
@property (nonatomic, readonly) NSNumber *analyticsReady;
@property (nonatomic, readonly) NSNumber *analyticsSize;
@property (nonatomic, readonly) NSNumber *inContextualMenu;

@end

#pragma mark - GoProCameraAppStatus
@interface GoProCameraAppStatus : GoProCameraStatus

@property (nonatomic, readonly) NSNumber *mode;
@property (nonatomic, readonly) NSNumber *subMode;

@end

#pragma mark - GoProCameraVideoStatus
@interface GoProCameraVideoStatus : GoProCameraStatus

@property (nonatomic, readonly) NSNumber *videoProgressCounter;
@property (nonatomic, readonly) NSNumber *videoProtuneDefault;

@end

#pragma mark - GoProCameraWirelessStatus
@interface GoProCameraWirelessStatus : GoProCameraStatus

@property (nonatomic, readonly) NSNumber *enable;
@property (nonatomic, readonly) NSNumber *state;
@property (nonatomic, readonly) NSNumber *type;
@property (nonatomic, readonly) NSNumber *pairTime;
@property (nonatomic, readonly) NSNumber *scanTimeMsec;
@property (nonatomic, readonly) NSNumber *pairing;
@property (nonatomic, readonly) NSNumber *remoteControlVersion;
@property (nonatomic, readonly) NSNumber *remoteControlConnected;
@property (nonatomic, readonly) NSNumber *appCount;
@property (nonatomic, readonly) NSNumber *provisionStatus;
@property (nonatomic, readonly) NSString *wlanSSID;
@property (nonatomic, readonly) NSString *apSSID;
@property (nonatomic, readonly) NSNumber *wifiBars;

@end

#pragma mark - GoProCameraStreamStatus
@interface GoProCameraStreamStatus : GoProCameraStatus

@property (nonatomic, readonly) NSNumber *enable;
@property (nonatomic, readonly) NSNumber *supported;

@end

#pragma mark - GoProCameraStorageStatus
@interface GoProCameraStorageStatus : GoProCameraStatus

@property (nonatomic, readonly) NSNumber *sdStatus;
@property (nonatomic, readonly) NSNumber *remainingPhotos;
@property (nonatomic, readonly) NSNumber *remainingVideoTime;
@property (nonatomic, readonly) NSNumber *numGroupPhotos;
@property (nonatomic, readonly) NSNumber *numGroupVideos;
@property (nonatomic, readonly) NSNumber *numTotalPhotos;
@property (nonatomic, readonly) NSNumber *numTotalVideos;
@property (nonatomic, readonly) NSNumber *remainingSpace;
@property (nonatomic, readonly) NSNumber *numHilights;
@property (nonatomic, readonly) NSNumber *lastHilightTimeMsec;
@property (nonatomic, readonly) NSNumber *remainingTimelapseTime;

@end

#pragma mark - GoProCameraSetupStatus
@interface GoProCameraSetupStatus : GoProCameraStatus

@property (nonatomic, readonly) NSString *dateTime;

@end