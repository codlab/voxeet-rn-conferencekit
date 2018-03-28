import {NativeModules} from 'react-native';
export type ConferenceUser ={
  id: string,
  name: string,
  avatar: string,
};



module.exports = {

  initialize: function(consumerKey:string, consumerSecret:string) {
    NativeModules.VoxeetManager.initialize(consumerKey, consumerSecret);
  },
  openSession: function(userId: string, name: string, avatarURL: string): Promise {
    return NativeModules.VoxeetManager.openSession(userId, name, avatarURL);
  },
  appearMaximized: function(activate: boolean) {
    NativeModules.VoxeetManager.appearMaximized(activate);
  },
  defaultBuiltInSpeaker: function(activate: boolean) {
    NativeModules.VoxeetManager.defaultBuiltInSpeaker(activate);
  },
  screenAutoLock: function(activate: boolean) {
    NativeModules.VoxeetManager.screenAutoLock(activate);
  },
  startConference: function(conferenceId: string, participants: Array<ConferenceUser>, invite: boolean): Promise {
    return NativeModules.VoxeetManager.startConference(conferenceId, participants, invite);
  },
};
