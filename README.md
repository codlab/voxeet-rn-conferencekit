# Voxeet RN Sample

## Requirements

  * iOS 9+
  * Xcode 8+
  * React Native > 0.40

## Install

`npm install --save voxeet-rn-conferencekit`

## Automatically (experimental)

`react-native link voxeet-rn-conferencekit`

## Manually

### By download

Download <a href="https://github.com/voxeet/voxeet-ios-conferencekit/tree/master/VoxeetConferenceKit/VoxeetSDK.framework">`VoxeetSDK.framework`</a> and <a href="https://github.com/voxeet/voxeet-ios-conferencekit/tree/master/VoxeetConferenceKit/VoxeetConferenceKit.framework">`VoxeetConferenceKit.framework`</a>.

Drag and drop them into your project, select 'Copy items if needed' with the right target.
Then in the general tab of your target, add the `VoxeetConferenceKit.framework` **AND** `VoxeetSDK.framework` into 'Embedded Binaries' and 'Linked Frameworks and Libraries'.

### By carthage

To integrate Voxeet Frameworks into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "voxeet/voxeet-ios-conferencekit" ~> 1.0
```

Run `carthage update` to build the framework and drag `VoxeetConferenceKit.framework` and `VoxeetSDK.framework` builds into your Xcode project *(needs to be dropped in 'Embedded Binaries' and 'Linked Frameworks and Libraries')*.

### Kingfisher

Voxeet-rn-conferencekit is also using some external libraries like Kingfisher for downloading and caching images from the web (users' avatars).
You can either download this framework at this link [Kingfisher](https://github.com/onevcat/Kingfisher) or install it with **Carthage** :

`github "onevcat/Kingfisher" ~> 3.0`

Or **CocoaPods**:

`pod 'Kingfisher', '~> 3.0'`

At the end 'Embedded Binaries' and 'Linked Frameworks and Libraries' sections should look like this:

<p align=“center”>
<img src="http://cdn.voxeet.com/images/XCodeFramework.png" alt=“Frameworks” title=“Frameworks” width=“500”/>
</p>

## Configure native code

Drag and drop them into your project these files:

* <a href="https://github.com/voxeet/voxeet-rn-conferencekit/blob/master/ios/VoxeetModule.swift">`VoxeetModule.swift`</a>
* <a href="https://github.com/voxeet/voxeet-rn-conferencekit/blob/master/ios/VoxeetManager.h">`VoxeetManager.h`</a>
* <a href="https://github.com/voxeet/voxeet-rn-conferencekit/blob/master/ios/VoxeetManager.m">`VoxeetManager.m`</a>


## Configure AppDelegate

`#import "VoxeetRNSample-Swift.h"`
```
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {

  [VoxeetModule application:application didReceive:notification];
}

- (void)application:(UIApplication *)application
handleActionWithIdentifier:(NSString *)identifier
forLocalNotification:(UILocalNotification *)notification
  completionHandler:(void (^ _Nonnull __strong)())completionHandler {

  [VoxeetModule application:application handleActionWithIdentifier:identifier for:notification completionHandler:completionHandler];

}
```


## Project setup

Before starting the Voxeet-rn-conferencekit, here is a few things to do:

## ios

Disable **Bitcode** in your Xcode target settings: 'Build Settings' -> 'Enable Bitcode' -> No

Enable **Background Modes**, go to your target settings -> 'Capabilities' -> 'Background Modes'
- Turn on 'Audio, AirPlay and Picture in Picture'  
- Turn on 'Voice over IP'

If you want to support CallKit (receiving incoming call when application is killed) and VoIP push notifications, also enable **Push Notifications** (you will need to send your voip push certificates to Voxeet). Go to your target settings -> 'Capabilities' -> 'Push Notifications'

<p align=“center”>
<img src="http://cdn.voxeet.com/images/VoxeetConferenceKitCapabilitiesXCode2.png" alt=“Capabilities” title=“Capabilities” width=“500”/>
</p>

Privacy **permissions**, in your plist add two new keys:
- Privacy - Camera Usage Description
- Privacy - Microphone Usage Description

# Test Voxeet with integrated example

* `clone this repo`
* Install deps `npm i`
* Install native dependency
	* IOS
		* `goto ios directory` `cd ios`
		* `carthage update --platform iOS`
* Setup consumerKey and consumerSecret in `Voxeet.js`
* launch packager `npm start`
* launch application on device with xcode

## Integrating to your project

`import VoxeetRN from 'voxeet-rn-conferencekit';`

### Init Voxeet sdk

`VoxeetRN.initialize('consumerKey', 'consumerSecret', false);`


### Open a new session

```
VoxeetRN.openSession('1111', 'John Smith', 'https://docs.moodle.org/27/en/images_en/7/7c/F1.png')
.then(() => console.log("Session connected"))
.catch((error) => this._displayConferenceError(error));
```

### initialize a conference
```
const participants = [{id: '2222', name: 'Bob', avatar: 'https://docs.moodle.org/27/en/images_en/7/7c/F1.png'}];`
`VoxeetRN.initializeConference(conferenceId, participants);
```

### Start a conference

```
VoxeetRN.startConference(true)
				 .then((json) => console.log(json))
				 .catch((error) => console.log(error));
```
