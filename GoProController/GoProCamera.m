//
//  GoProCamera.m
//  kiosk
//
//  Created by Adil Malik on 05/10/2015.
//  Copyright © 2015 cape. All rights reserved.
//

#import "GoProCamera.h"
#import "NSObject+DictionaryToObject.h"

@interface GoProCamera ()

// Camera Info
@property (nonatomic, strong) NSNumber *modelNumber;
@property (nonatomic, strong) NSString *modelName;
@property (nonatomic, strong) NSString *firmwareVersion;
@property (nonatomic, strong) NSString *serialNumber;
@property (nonatomic, strong) NSString *boardType;
@property (nonatomic, strong) NSString *mac;
@property (nonatomic, strong) NSString *ssid;
@property (nonatomic, strong) NSNumber *hasDefaultCredentials;
@property (nonatomic, strong) NSString *gitSha1;

@property (nonatomic, strong) GoProCameraSystemStatus *systemStatus;
@property (nonatomic, strong) GoProCameraAppStatus *appStatus;
@property (nonatomic, strong) GoProCameraVideoStatus *videoStatus;
@property (nonatomic, strong) GoProCameraWirelessStatus *wirelessStatus;
@property (nonatomic, strong) GoProCameraStreamStatus *streamStatus;
@property (nonatomic, strong) GoProCameraStorageStatus *storageStatus;
@property (nonatomic, strong) GoProCameraSetupStatus *setupStatus;

// Status Dictionary
@property (nonatomic, strong) NSMutableDictionary *statusMappingDictionary;

@end

@implementation GoProCamera

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self)
    {
        [self populateObjectValueFromDictionary:dictionary];
    }

    return self;
}

+ (instancetype)camerWithDictionary:(NSDictionary *)dictionary
{
    return [[[self class] alloc] initWithDictionary:dictionary];
}

- (BOOL)isSameCamera:(GoProCamera *)camera
{
    return [self.ssid isEqual:camera.ssid] && [self.mac isEqual:camera.mac];
}

#pragma mark - Values Popluation
- (void)populateObjectValueFromDictionary:(NSDictionary *)dictionary
{
    //Populating Camera Info
    NSDictionary *infoDictionary = dictionary[@"info"];
    [self populateObjectValueFromDictionary:infoDictionary withMappingDictionay:[self infoMappingDictionary]];

    //Populating Status Keys so we can populating values from status json
    NSArray *groups = dictionary[@"status"][@"groups"];

    self.statusMappingDictionary = [NSMutableDictionary dictionary];
    for (NSDictionary *group in groups)
    {
        [self.statusMappingDictionary setValue:group[@"fields"] forKey:group[@"group"]];
    }
}

- (void)updateCameraStatusFromDictionary:(NSDictionary *)dictionary
{
    self.systemStatus = [GoProCameraSystemStatus statusWithDictionary:dictionary[@"status"] forMappingFields:self.statusMappingDictionary[@"system"]];
    self.appStatus = [GoProCameraAppStatus statusWithDictionary:dictionary[@"status"] forMappingFields:self.statusMappingDictionary[@"app"]];
    self.videoStatus = [GoProCameraVideoStatus statusWithDictionary:dictionary[@"status"] forMappingFields:self.statusMappingDictionary[@"video"]];
    self.wirelessStatus = [GoProCameraWirelessStatus statusWithDictionary:dictionary[@"status"] forMappingFields:self.statusMappingDictionary[@"wirless"]];
    self.streamStatus = [GoProCameraStreamStatus statusWithDictionary:dictionary[@"status"] forMappingFields:self.statusMappingDictionary[@"stream"]];
    self.storageStatus = [GoProCameraStorageStatus statusWithDictionary:dictionary[@"status"] forMappingFields:self.statusMappingDictionary[@"storage"]];
    self.setupStatus = [GoProCameraSetupStatus statusWithDictionary:dictionary[@"status"] forMappingFields:self.statusMappingDictionary[@"setup"]];
}

- (NSDictionary *)infoMappingDictionary
{
    return @{
             @"model_number": @"modelNumber",
             @"model_name": @"modelName",
             @"firmware_version": @"firmwareVersion",
             @"serial_number": @"serialNumber",
             @"board_type": @"boardType",
             @"ap_mac": @"mac",
             @"ap_ssid": @"ssid",
             @"ap_has_default_credentials": @"hasDefaultCredentials",
             @"git_sha1": @"gitSha1"
             };
}

@end