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


RCT_EXPORT_METHOD(initialize:(NSString*)consumerKey
                  consumerSecret:(NSString*)consumerSecret
                  automaticallyOpenSession:(BOOL)automaticallyOpenSession)
{
  [VoxeetModule initialize:consumerKey consumerSecret:consumerSecret automaticallyOpenSession:automaticallyOpenSession];
}

RCT_EXPORT_METHOD(openSession:(NSString*)userId
                  participantName:(NSString*)participantName
                  avatarURL:(NSString*)avatarURL
                  resolve:(RCTPromiseResolveBlock)resolve
                  ejecter:(RCTPromiseRejectBlock)reject)
{
  [VoxeetModule openSession:userId participantName:participantName avatarURL:avatarURL completion:^{
    resolve(@"");
  } onError:^(NSString *error) {
    reject(@"openSession_error", error, nil);
  }];
}

RCT_EXPORT_METHOD(updateSession:(NSString*)userId
                  participantName:(NSString*)participantName
                  avatarURL:(NSString*)avatarURL
                  resolve:(RCTPromiseResolveBlock)resolve
                  ejecter:(RCTPromiseRejectBlock)reject)
{
  [VoxeetModule updateSession:userId participantName:participantName avatarURL:avatarURL completion:^{
    resolve(@"");
  } onError:^(NSString *error) {
    reject(@"updateSession_error", error, nil);
  }];
}

RCT_EXPORT_METHOD(closeSession:(RCTPromiseResolveBlock)resolve
                  ejecter:(RCTPromiseRejectBlock)reject)
{
  [VoxeetModule closeSessionWithCompletion:^{
    resolve(@"");
  } onError:^(NSString *error) {
    reject(@"closeSession_error", error, nil);
  }];
}

RCT_EXPORT_METHOD(initializeConference:(NSString*)conferenceId
                  participants:(NSArray*)participants)
{
  [VoxeetModule initializeConferenceWithConferenceId:conferenceId participants:participants];
}

RCT_EXPORT_METHOD(startConference:(BOOL)sendInvitation
                  resolve:(RCTPromiseResolveBlock)resolve
                  ejecter:(RCTPromiseRejectBlock)reject)
{
  [VoxeetModule startConference:sendInvitation completion:^(NSDictionary<NSString *,id> *json) {
    resolve(json);
  } onError:^(NSString *error) {
    reject(@"startConference_error", error, nil);
  }];
}

RCT_EXPORT_METHOD(stopConference:(RCTPromiseResolveBlock)resolve
                  ejecter:(RCTPromiseRejectBlock)reject)
{
  [VoxeetModule stopConferenceWithCompletion:^{
    resolve(@"");
  } onError:^(NSString *error) {
    reject(@"stopConference_error", error, nil);
  }];
}

RCT_EXPORT_METHOD(add:(id)participant)
{
  [VoxeetModule addWithParticipant:participant];
}

RCT_EXPORT_METHOD(update:(id)participant)
{
  [VoxeetModule updateWithParticipant:participant];
}

RCT_EXPORT_METHOD(remove:(id)participant)
{
  [VoxeetModule removeWithParticipant:participant];
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

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}



@end
