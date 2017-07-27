package com.voxeetrnsample;

import android.os.Handler;
import android.os.Looper;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.modules.core.DeviceEventManagerModule;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;

public class VoxeetReactModule extends ReactContextBaseJavaModule {

	@Override
	public String getName() {
			return "VoxeetManager";
	}

	public VoxeetReactModule(ReactApplicationContext reactContext) {
			super(reactContext);
	}

	@ReactMethod
	public void initialize(String consumerKey, String consumerSecret, Boolean automaticallyOpenSession) {

	}

	@ReactMethod
	public void openSession(String userId, String participantName, String avatarUrl, Promise promise) {

	}

	@ReactMethod
	public void closeSession() {

	}

	@ReactMethod
	public void initializeConference(String conferenceId, ReadableArray participants) {

	}

	@ReactMethod
	public void startConference(Boolean sendInvitation, Promise promise) {

	}

	@ReactMethod
	public void stopConference(Promise promise) {

	}

	@ReactMethod
	public void add(ReadableMap participant) {

	}

	@ReactMethod
	public void update(ReadableMap participant) {

	}

	@ReactMethod
	public void remove(ReadableMap participant) {

	}

	@ReactMethod
	public void appearMaximized(Boolean enabled) {

	}

	@ReactMethod
	public void defaultBuiltInSpeaker(Boolean enabled) {

	}

	@ReactMethod
	public void screenAutoLock(Boolean enabled) {

	}
}
