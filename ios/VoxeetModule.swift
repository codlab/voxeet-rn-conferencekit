//
//  VoxeetModule.swift
//  VoxeetRNSample
//
//  Created by Voxeet on 25/06/2017.
//  Copyright © 2017 Facebook. All rights reserved.
//

import UIKit
import VoxeetConferenceKit

struct Participant {
  var id: String
  var name: String
  var avatar: String
}

@objc class VoxeetModule: NSObject {

  class func initVoxeetSDK(_ consumerKey: String, consumerSecret: String, automaticallyOpenSession: Bool) {
    VoxeetConferenceKit.shared.initialize(consumerKey: consumerKey, consumerSecret: consumerSecret, automaticallyOpenSession: automaticallyOpenSession)
  }
  
  class func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
    VoxeetConferenceKit.shared.application(application, didReceive: notification)
  }
  
  class func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, for notification: UILocalNotification, completionHandler: @escaping () -> Void) {
    VoxeetConferenceKit.shared.application(application, handleActionWithIdentifier: identifier, for: notification, completionHandler: completionHandler)
  }
  
  class func openSession(_ participantId: String, participantName: String, avatarURL: String) {
    let ownParticipant = VoxeetParticipant(id: participantId, name: participantName, avatarURL: URL(string: avatarURL))
    VoxeetConferenceKit.shared.openSession(participant: ownParticipant)
  }
  
  class func joinConference(_ conferenceId: String, participants:[AnyObject], completion: @escaping () -> Void, onError: @escaping (_ error: String) -> Void) {

    var finalParticipants = [VoxeetParticipant]()
    for participant in participants{
      
      let participantId = participant["id"] as! String
      let participantName = participant["name"] as! String
      let participantAvatar = participant["avatar"] as! String
      let nativeParticipant = VoxeetParticipant(id: participantId, name: participantName, avatarURL: URL(string: participantAvatar))
      finalParticipants.append(nativeParticipant)
    }
    
    // Initialize conference.
    VoxeetConferenceKit.shared.initializeConference(id: conferenceId, participants: finalParticipants)
    
    // Start and join conference.
    VoxeetConferenceKit.shared.startConference(sendInvitation: true, success: { (confID) in
      // Debug.
      completion()
      print("[VoxeetConferenceKitSample] \(#function).\(#line) Conference successfully started: \(confID)")
    }, fail: { (error) in
      
      onError(error.localizedDescription)
      // Debug.
      print("[VoxeetConferenceKitSample] \(#function).\(#line) Error: \(error)")
    })

  }
  
  class func appearMaximized(_ enabled: Bool) {
    VoxeetConferenceKit.shared.appearMaximized = enabled;
  }
  
  class func defaultBuiltInSpeaker(_ enabled: Bool) {
    VoxeetConferenceKit.shared.defaultBuiltInSpeaker = enabled;
  }
  
  class func screenAutoLock(_ enabled: Bool) {
    VoxeetConferenceKit.shared.screenAutoLock = enabled;
  }
}
