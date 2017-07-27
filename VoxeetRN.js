import {NativeModules} from 'react-native';
export type ConferenceUser ={
  id: string,
  name: string,
  avatar: string,
};



module.exports = {

  initialize: function(consumerKey:string, consumerSecret:string, automaticallyOpenSession:boolean) {
    NativeModules.VoxeetManager.initialize(consumerKey, consumerSecret, automaticallyOpenSession);
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
  initializeConference: function(conferenceId: string, participants: Array<ConferenceUser>) {
    NativeModules.VoxeetManager.initializeConference(conferenceId, participants);
  },
  startConference: function(sendInvitation: boolean) {
    return NativeModules.VoxeetManager.startConference(sendInvitation);
  },
};
