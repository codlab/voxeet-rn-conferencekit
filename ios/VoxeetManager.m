//
//  VoxeetManager.m
//  VoxeetRNSample
//
//  Created by Voxeet on 27/06/2017.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import "VoxeetManager.h"
#import "VoxeetRNSample-Swift.h"

@implementation VoxeetManager

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(joinConference:(NSString*)conferenceId
                  participants:(NSArray*)participants
                  resolve:(RCTPromiseResolveBlock) resolve
                  ejecter:(RCTPromiseRejectBlock)reject)
{
  [VoxeetModule joinConference:conferenceId participants:participants completion:^() {
    resolve(@"");
  } onError:^(NSString *error) {
    reject(@"joinConference_error", error, nil);
  }];
}

RCT_EXPORT_METHOD(openSession:(NSString*)userId
                  participantName:(NSString*)participantName
                  avatarURL:(NSString*)avatarURL)
{
  [VoxeetModule openSession:userId participantName:participantName avatarURL:avatarURL];
}

RCT_EXPORT_METHOD(appearMaximized:(BOOL)enabled)
{
  [VoxeetModule appearMaximized:enabled];
}

RCT_EXPORT_METHOD(defaultBuiltInSpeaker:(BOOL)enabled)
{
  [VoxeetModule defaultBuiltInSpeaker:enabled];
}

RCT_EXPORT_METHOD(screenAutoLock:(BOOL)enabled)
{
  [VoxeetModule screenAutoLock:enabled];
}

RCT_EXPORT_METHOD(initVoxeetSDK:(NSString*)consumerKey
                  consumerSecret:(NSString*)consumerSecret
                  automaticallyOpenSession:(BOOL)automaticallyOpenSession)
{
  [VoxeetModule initVoxeetSDK:consumerKey consumerSecret:consumerSecret automaticallyOpenSession:automaticallyOpenSession];
}

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}



@end
