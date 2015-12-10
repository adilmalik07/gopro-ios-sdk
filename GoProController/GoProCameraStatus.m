//
//  GoProCameraStatus.m
//  kiosk
//
//  Created by Adil Malik on 06/11/2015.
//  Copyright © 2015 cape. All rights reserved.
//

#import "GoProCameraStatus.h"
#import "NSObject+Properties.h"
#import "NSObject+DictionaryToObject.h"
#import "NSString+Inflections.h"

@interface GoProCameraStatus ()

- (instancetype)initWithDictionary:(NSDictionary *)dictionary forMappingFields:(NSArray *)mappingFields;

- (void)populateValuesFromDictionary:(NSDictionary *)dictionary forMappingFields:(NSArray *)mappingFields;

- (NSDictionary *)mappingDictionary;

@end

@implementation GoProCameraStatus

- (instancetype)initWithDictionary:(NSDictionary *)dictionary forMappingFields:(NSArray *)mappingFields
{
    self = [super init];

    if (self)
    {
        [self populateValuesFromDictionary:dictionary forMappingFields:mappingFields];
    }

    return self;
}

+ (instancetype)statusWithDictionary:(NSDictionary *)dictionary forMappingFields:(NSArray *)mappingFields
{
    return [[self alloc] initWithDictionary:dictionary forMappingFields:mappingFields];
}

- (void)populateValuesFromDictionary:(NSDictionary *)dictionary forMappingFields:(NSArray *)mappingFields
{
    NSMutableDictionary *statusKeyMappingDictionary = [NSMutableDictionary dictionary];
    for (NSDictionary *mappingObject in mappingFields)
    {
        [statusKeyMappingDictionary setValue:dictionary[[mappingObject[@"id"] stringValue]] forKey:mappingObject[@"name"]];
    }

    NSDictionary *mappingDictionary = [self mappingDictionary];

    [self populateObjectValueFromDictionary:statusKeyMappingDictionary withMappingDictionay:mappingDictionary];
}

- (NSDictionary *)mappingDictionary
{
    NSMutableDictionary *mappingDictionary = [NSMutableDictionary dictionary];

    for (NSString *propertyName in[[self class] allPropertyNames])
    {
        [mappingDictionary setValue:propertyName forKey:[propertyName underscore]];
    }

    return mappingDictionary;
}

@end

#pragma mark -
@interface GoProCameraSystemStatus ()

@property (nonatomic, strong) NSNumber *internalBatteryPresent;
@property (nonatomic, strong) NSNumber *internalBatteryLevel;
@property (nonatomic, strong) NSNumber *externalBatteryPresent;
@property (nonatomic, strong) NSNumber *externalBatteryLevel;
@property (nonatomic, strong) NSNumber *systemHot;
@property (nonatomic, strong) NSNumber *systemBusy;
@property (nonatomic, strong) NSNumber *quickCaptureActive;
@property (nonatomic, strong) NSNumber *encodingActive;
@property (nonatomic, strong) NSNumber *lcdLockActive;
@property (nonatomic, strong) NSNumber *cameraLocateActive;
@property (nonatomic, strong) NSNumber *currentTimeMsec;
@property (nonatomic, strong) NSNumber *nextPollMsec;
@property (nonatomic, strong) NSNumber *analyticsReady;
@property (nonatomic, strong) NSNumber *analyticsSize;
@property (nonatomic, strong) NSNumber *inContextualMenu;

@end

@implementation GoProCameraSystemStatus

@end

#pragma mark -
@interface GoProCameraAppStatus ()

@property (nonatomic, strong) NSNumber *mode;
@property (nonatomic, strong) NSNumber *subMode;

@end

@implementation GoProCameraAppStatus

@end

#pragma mark -
@interface GoProCameraVideoStatus ()

@property (nonatomic, strong) NSNumber *videoProgressCounter;
@property (nonatomic, strong) NSNumber *videoProtuneDefault;

@end

@implementation GoProCameraVideoStatus

@end

#pragma mark -
@interface GoProCameraWirelessStatus ()

@property (nonatomic, strong) NSNumber *enable;
@property (nonatomic, strong) NSNumber *state;
@property (nonatomic, strong) NSNumber *type;
@property (nonatomic, strong) NSNumber *pairTime;
@property (nonatomic, strong) NSNumber *scanTimeMsec;
@property (nonatomic, strong) NSNumber *pairing;
@property (nonatomic, strong) NSNumber *remoteControlVersion;
@property (nonatomic, strong) NSNumber *remoteControlConnected;
@property (nonatomic, strong) NSNumber *appCount;
@property (nonatomic, strong) NSNumber *provisionStatus;
@property (nonatomic, strong) NSString *wlanSSID;
@property (nonatomic, strong) NSString *apSSID;
@property (nonatomic, strong) NSNumber *wifiBars;

@end

@implementation GoProCameraWirelessStatus

@end

#pragma mark -
@interface GoProCameraStreamStatus ()

@property (nonatomic, strong) NSNumber *enable;
@property (nonatomic, strong) NSNumber *supported;

@end

@implementation GoProCameraStreamStatus

@end

#pragma mark -
@interface GoProCameraStorageStatus ()

@property (nonatomic, strong) NSNumber *sdStatus;
@property (nonatomic, strong) NSNumber *remainingPhotos;
@property (nonatomic, strong) NSNumber *remainingVideoTime;
@property (nonatomic, strong) NSNumber *numGroupPhotos;
@property (nonatomic, strong) NSNumber *numGroupVideos;
@property (nonatomic, strong) NSNumber *numTotalPhotos;
@property (nonatomic, strong) NSNumber *numTotalVideos;
@property (nonatomic, strong) NSNumber *remainingSpace;
@property (nonatomic, strong) NSNumber *numHilights;
@property (nonatomic, strong) NSNumber *lastHilightTimeMsec;
@property (nonatomic, strong) NSNumber *remainingTimelapseTime;

@end

@implementation GoProCameraStorageStatus

@end

#pragma mark -
@interface GoProCameraSetupStatus ()

@property (nonatomic, strong) NSString *dateTime;

@end

@implementation GoProCameraSetupStatus

@end