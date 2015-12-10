//
//  GoProCameraManager.m
//  kiosk
//
//  Created by Adil Malik on 05/10/2015.
//  Copyright © 2015 cape. All rights reserved.
//

#import "GoProCameraManager.h"
#import <AFNetworking/AFNetworking.h>
#import "GoProMediaFile.h"

NSString *const GoProBaseURL = @"http://10.5.5.9/";
#define INTERNET_TIMEOUT 5

@interface GoProNetworkManager : AFHTTPSessionManager

+ (instancetype)sharedManager;

@end

@implementation GoProNetworkManager

+ (instancetype)manager
{
    return [[self alloc] initWithBaseURL:[NSURL URLWithString:GoProBaseURL]];
}

- (instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];

    if (self)
    {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        self.responseSerializer = [AFJSONResponseSerializer serializer];

        self.requestSerializer.timeoutInterval = INTERNET_TIMEOUT;
    }

    return self;
}

#pragma mark - Shared Manager
+ (instancetype)sharedManager
{
    static GoProNetworkManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [GoProNetworkManager manager];
    });

    return _sharedManager;
}

@end

@implementation GoProCameraManager

+ (instancetype)sharedManager
{
    static GoProCameraManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[GoProCameraManager alloc] init];
    });

    return sharedManager;
}

- (void)lookupConnectedCameraWithCompletionBlock:(void (^)(GoProCamera *camera))completionBlock
{
    [[GoProNetworkManager sharedManager] GET:@"gp/gpControl"
                                  parameters:nil
                                     success: ^(NSURLSessionDataTask *_Nonnull task, id _Nonnull responseObject) {
                                         GoProCamera *camera = [GoProCamera camerWithDictionary:responseObject];
                                         if (completionBlock)
                                         {
                                             completionBlock(camera);
                                         }
                                     }
                                     failure: ^(NSURLSessionDataTask *_Nonnull task, NSError *_Nonnull error) {
                                         if (completionBlock)
                                         {
                                             completionBlock(nil);
                                         }
                                     }];
}

- (void)camera:(GoProCamera *)camera connectionStatusWithCompletionBlock:(void (^)(BOOL isConnected))completionBlock
{
    [self lookupConnectedCameraWithCompletionBlock: ^(GoProCamera *scanedCamera) {
        if (scanedCamera)
        {
            BOOL isConnected = [camera isSameCamera:scanedCamera];
            if (completionBlock)
            {
                completionBlock(isConnected);
            }
        }
        else
        {
            if (completionBlock)
            {
                completionBlock(NO);
            }
        }
    }];
}

- (void)camera:(GoProCamera *)camera checkSystemStatusWithCompletionBlock:(void (^)(GoProCamera *camera))completionBlock
{
    [[GoProNetworkManager sharedManager] GET:@"gp/gpControl/status"
                                  parameters:nil
                                     success: ^(NSURLSessionDataTask *_Nonnull task, id _Nonnull responseObject) {
                                         [camera updateCameraStatusFromDictionary:responseObject];
                                         if (completionBlock)
                                         {
                                             completionBlock(camera);
                                         }
                                     }
                                     failure: ^(NSURLSessionDataTask *_Nonnull task, NSError *_Nonnull error) {
                                         if (completionBlock)
                                         {
                                             completionBlock(nil);
                                         }
                                     }];
}

#pragma mark - Recording
- (void)camera:(GoProCamera *)camera startRecordingWithCompletionBlock:(void (^)(BOOL))completionBlock
{
    [[GoProNetworkManager sharedManager] GET:@"gp/gpControl/command/shutter?p=1"
                                  parameters:nil
                                     success: ^(NSURLSessionDataTask *_Nonnull task, id _Nonnull responseObject) {
                                         if (completionBlock)
                                         {
                                             completionBlock(YES);
                                         }
                                     }
                                     failure: ^(NSURLSessionDataTask *_Nonnull task, NSError *_Nonnull error) {
                                         if (completionBlock)
                                         {
                                             completionBlock(NO);
                                         }
                                     }];
}

- (void)camera:(GoProCamera *)camera stopRecordingWithCompletionBlock:(void (^)(BOOL))completionBlock
{
    [[GoProNetworkManager sharedManager] GET:@"gp/gpControl/command/shutter?p=0"
                                  parameters:nil
                                     success: ^(NSURLSessionDataTask *_Nonnull task, id _Nonnull responseObject) {
                                         if (completionBlock)
                                         {
                                             completionBlock(YES);
                                         }
                                     }
                                     failure: ^(NSURLSessionDataTask *_Nonnull task, NSError *_Nonnull error) {
                                         if (completionBlock)
                                         {
                                             completionBlock(NO);
                                         }
                                     }];
}

#pragma mark - Mode
- (void)camera:(GoProCamera *)camera setPrimaryMode:(NSInteger)mode completionBlock:(void (^)(BOOL))completionBlock
{
    [[GoProNetworkManager sharedManager] GET:[NSString stringWithFormat:@"gp/gpControl/command/xmode?p=%ld", (long)mode]
                                  parameters:nil
                                     success: ^(NSURLSessionDataTask *_Nonnull task, id _Nonnull responseObject) {
                                         if (completionBlock)
                                         {
                                             completionBlock(YES);
                                         }
                                     }
                                     failure: ^(NSURLSessionDataTask *_Nonnull task, NSError *_Nonnull error) {
                                         if (completionBlock)
                                         {
                                             completionBlock(NO);
                                         }
                                     }];
}

- (void)camera:(GoProCamera *)camera setSecondayPrimaryMode:(NSInteger)mode completionBlock:(void (^)(BOOL))completionBlock
{
    [[GoProNetworkManager sharedManager] GET:[NSString stringWithFormat:@"gp/gpControl/command/mode?p=%ld", (long)mode]
                                  parameters:nil
                                     success: ^(NSURLSessionDataTask *_Nonnull task, id _Nonnull responseObject) {
                                         if (completionBlock)
                                         {
                                             completionBlock(YES);
                                         }
                                     }
                                     failure: ^(NSURLSessionDataTask *_Nonnull task, NSError *_Nonnull error) {
                                         if (completionBlock)
                                         {
                                             completionBlock(NO);
                                         }
                                     }];
}

#pragma mark - Files
- (void)camera:(GoProCamera *)camera getFilesListWithCompletionBlock:(void (^)(NSArray *filesList))completionBlock
{
    [[GoProNetworkManager sharedManager] GET:@"gp/gpMediaList"
                                  parameters:nil
                                     success: ^(NSURLSessionDataTask *_Nonnull task, id _Nonnull responseObject) {
                                         NSArray *mediaArray = [responseObject valueForKey:@"media"];
                                         NSMutableArray *files = [NSMutableArray array];
                                         for (NSDictionary *folder in mediaArray)
                                         {
                                             NSString *folderName = folder[@"d"];
                                             for (NSDictionary *file in folder[@"fs"])
                                             {
                                                 [files addObject:[GoProMediaFile mediaFileWithDictionary:file inFolder:folderName]];
                                             }
                                         }

                                         if (completionBlock)
                                         {
                                             completionBlock(files);
                                         }
                                     }
                                     failure: ^(NSURLSessionDataTask *_Nonnull task, NSError *_Nonnull error) {
                                         DLog(@"file fetch error: %@", error.localizedDescription);
                                         if (completionBlock)
                                         {
                                             completionBlock(nil);
                                         }
                                     }];
}

@end