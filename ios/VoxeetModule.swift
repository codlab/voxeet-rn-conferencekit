//
//  VoxeetModule.swift
//  VoxeetRNSample
//
//  Created by Voxeet on 25/06/2017.
//  Copyright © 2017 Facebook. All rights reserved.
//

import UIKit
import VoxeetSDK
import VoxeetConferenceKit

@objc class VoxeetModule: NSObject {
  
  class func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
    VoxeetConferenceKit.shared.application(application, didReceive: notification)
  }
  
  class func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, for notification: UILocalNotification, completionHandler: @escaping () -> Void) {
    VoxeetConferenceKit.shared.application(application, handleActionWithIdentifier: identifier, for: notification, completionHandler: completionHandler)
  }
  
  class func initialize(_ consumerKey: String, consumerSecret: String) {
    VoxeetConferenceKit.shared.initialize(consumerKey: consumerKey, consumerSecret: consumerSecret)
  }
  
  class func openSession(_ participantId: String, participantName: String, avatarURL: String, completion: @escaping () -> Void,onError: @escaping (_ error: String) -> Void) {
    let ownParticipant = VTUser(id: participantId, name: participantName, photoURL: avatarURL)
    VoxeetConferenceKit.shared.openSession(user: ownParticipant, completion: { (error) in
      if let error = error {
        onError(error.localizedDescription)
      } else {
        completion()
      }
    })
  }
  
  class func updateSession(_ participantId: String, participantName: String, avatarURL: String, completion: @escaping () -> Void, onError: @escaping (_ error: String) -> Void) {
    let ownParticipant = VTUser(id: participantId, name: participantName, photoURL: avatarURL)
    VoxeetConferenceKit.shared.updateSession(user: ownParticipant, completion: { (error) in
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
  
  class func startConference(conferenceId: String, users: [AnyObject], invite: Bool, completion: @escaping (_ json: [String: Any]?) -> Void, onError: @escaping (_ error: String) -> Void) {
    var finalUsers = [VTUser]()
    
    for user in users {
      if let participantId = user["id"] as? String, let participantName = user["name"] as? String {
        let participantAvatar = user["avatar"] as? String
        
        finalUsers.append(VTUser(id: participantId, name: participantName, photoURL: participantAvatar ?? ""))
      }
    }
    
    VoxeetConferenceKit.shared.startConference(id: conferenceId, users: finalUsers, invite: invite, success: { (json) in
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
      
      VoxeetConferenceKit.shared.add(user: VTUser(id: participantId, name: participantName, photoURL: participantAvatar ?? ""))
    }
  }
  
  class func update(participant: AnyObject) {
    if let participantId = participant["id"] as? String, let participantName = participant["name"] as? String {
      let participantAvatar = participant["avatar"] as? String
      
      VoxeetConferenceKit.shared.update(user: VTUser(id: participantId, name: participantName, photoURL: participantAvatar ?? ""))
    }
  }
  
  class func update(users: [AnyObject]) {
    var finalUsers = [VTUser]()

    for user in users {
      if let participantId = user["id"] as? String, let participantName = user["name"] as? String {
        let participantAvatar = user["avatar"] as? String

        finalUsers.append(VTUser(id: participantId, name: participantName, photoURL: participantAvatar ?? ""))
      }
    }
    
    VoxeetConferenceKit.shared.update(users: finalUsers)
  }
  
  class func remove(participant: AnyObject) {
    if let participantId = participant["id"] as? String, let participantName = participant["name"] as? String {
      let participantAvatar = participant["avatar"] as? String
      
      VoxeetConferenceKit.shared.remove(user: VTUser(id: participantId, name: participantName, photoURL: participantAvatar ?? ""))
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
