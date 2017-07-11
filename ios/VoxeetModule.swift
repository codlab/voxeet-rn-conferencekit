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
  
  class func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
    VoxeetConferenceKit.shared.application(application, didReceive: notification)
  }
  
  class func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, for notification: UILocalNotification, completionHandler: @escaping () -> Void) {
    VoxeetConferenceKit.shared.application(application, handleActionWithIdentifier: identifier, for: notification, completionHandler: completionHandler)
  }
  
  class func initialize(_ consumerKey: String, consumerSecret: String, automaticallyOpenSession: Bool) {
    VoxeetConferenceKit.shared.initialize(consumerKey: consumerKey, consumerSecret: consumerSecret, automaticallyOpenSession: automaticallyOpenSession)
  }
  
  class func openSession(_ participantId: String, participantName: String, avatarURL: String, completion: @escaping () -> Void,onError: @escaping (_ error: String) -> Void) {
    let ownParticipant = VoxeetParticipant(id: participantId, name: participantName, avatarURL: URL(string: avatarURL))
    VoxeetConferenceKit.shared.openSession(participant: ownParticipant, completion: { (error) in
      if let error = error {
        onError(error.localizedDescription)
      } else {
        completion()
      }
    })
  }
  
  class func updateSession(_ participantId: String, participantName: String, avatarURL: String, completion: @escaping () -> Void, onError: @escaping (_ error: String) -> Void) {
    let ownParticipant = VoxeetParticipant(id: participantId, name: participantName, avatarURL: URL(string: avatarURL))
    VoxeetConferenceKit.shared.updateSession(participant: ownParticipant, completion: { (error) in
      if let error = error {
        onError(error.localizedDescription)
      } else {
        completion()
      }
    })
  }
  
  class func closeSession(completion: @escaping () -> Void, onError: @escaping (_ error: String) -> Void) {
    VoxeetConferenceKit.shared.closeSession(completion: { (error) in
      if let error = error {
        onError(error.localizedDescription)
      } else {
        completion()
      }
    })
  }
  
  class func initializeConference(conferenceId: String, participants: [AnyObject]) {
    var finalParticipants = [VoxeetParticipant]()
    
    for participant in participants {
      if let participantId = participant["id"] as? String, let participantName = participant["name"] as? String {
        let participantAvatar = participant["avatar"] as? String
        
        finalParticipants.append(VoxeetParticipant(id: participantId, name: participantName, avatarURL: URL(string: participantAvatar ?? "")))
      }
    }
    
    VoxeetConferenceKit.shared.initializeConference(id: conferenceId, participants: finalParticipants)
  }
  
  class func startConference(_ sendInvitation: Bool, completion: @escaping (_ json: [String: Any]?) -> Void, onError: @escaping (_ error: String) -> Void) {
    VoxeetConferenceKit.shared.startConference(sendInvitation: sendInvitation, success: { (json) in
      completion(json)
    }, fail: { (error) in
      onError(error.localizedDescription)
    })
  }
  
  class func stopConference(completion: @escaping () -> Void, onError: @escaping (_ error: String) -> Void) {
    VoxeetConferenceKit.shared.stopConference(completion: { (error) in
      if let error = error {
        onError(error.localizedDescription)
      } else {
        completion()
      }
    })
  }
  
  class func add(participant: AnyObject) {
    if let participantId = participant["id"] as? String, let participantName = participant["name"] as? String {
      let participantAvatar = participant["avatar"] as? String
      
      VoxeetConferenceKit.shared.add(participant: VoxeetParticipant(id: participantId, name: participantName, avatarURL: URL(string: participantAvatar ?? "")))
    }
  }
  
  class func update(participant: AnyObject) {
    if let participantId = participant["id"] as? String, let participantName = participant["name"] as? String {
      let participantAvatar = participant["avatar"] as? String
      
      VoxeetConferenceKit.shared.update(participant: VoxeetParticipant(id: participantId, name: participantName, avatarURL: URL(string: participantAvatar ?? "")))
    }
  }
  
  class func update(participants: [AnyObject]) {
    var finalParticipants = [VoxeetParticipant]()
    
    for participant in participants {
      if let participantId = participant["id"] as? String, let participantName = participant["name"] as? String {
        let participantAvatar = participant["avatar"] as? String
        
        finalParticipants.append(VoxeetParticipant(id: participantId, name: participantName, avatarURL: URL(string: participantAvatar ?? "")))
      }
    }
    
    VoxeetConferenceKit.shared.update(participants: finalParticipants)
  }
  
  class func remove(participant: AnyObject) {
    if let participantId = participant["id"] as? String, let participantName = participant["name"] as? String {
      let participantAvatar = participant["avatar"] as? String
      
      VoxeetConferenceKit.shared.remove(participant: VoxeetParticipant(id: participantId, name: participantName, avatarURL: URL(string: participantAvatar ?? "")))
    }
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
