/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  TouchableOpacity,
  TextInput,
  NativeModules,
  Alert,
} from 'react-native';

export type ConferenceUser ={
  id: string,
  name: string,
  avatar: string,
};

type State = {
  conferenceId: string,
};


export default class VoxeetRNSample extends Component {
  state: State;

  constructor() {
    super();
    this.state = {
      conferenceId: '',
    };
  }

  componentWillMount() {
    NativeModules.VoxeetManager.initVoxeetSDK('consumerKey', 'consumerSecret', false)
  }

  componentDidMount() {
    NativeModules.VoxeetManager.openSession('1111', 'John Smith', 'https://docs.moodle.org/27/en/images_en/7/7c/F1.png')
    .then(() => console.log("Session connected"))
    .catch((error) => this._displayConferenceError(error));
    this._configureConferenceSettings();
  }

  _createParticipants = ():Array<ConferenceUser> =>{

    const participantA:ConferenceUser = {id: '2222', name: 'Bob', avatar: 'https://docs.moodle.org/27/en/images_en/7/7c/F1.png'};
    const participantB:ConferenceUser = {id: '3333', name: 'Matt', avatar: 'https://docs.moodle.org/27/en/images_en/7/7c/F1.png'};

    let participants = [];
    participants.push(participantA);
    participants.push(participantB);
    return participants;
  }

  _configureConferenceSettings = () => {
    NativeModules.VoxeetManager.appearMaximized(true);
    NativeModules.VoxeetManager.defaultBuiltInSpeaker(true);
    NativeModules.VoxeetManager.screenAutoLock(true);
  }

  _onJoinConference = () => {
    const {conferenceId} = this.state;
    const participants = this._createParticipants();

    NativeModules.VoxeetManager.initializeConference(conferenceId, participants);
    NativeModules.VoxeetManager.startConference(true)
    .then((json) => console.log(json))
    .catch((error) => this._displayConferenceError(error));
  }

  _displayConferenceError = (error: string) => {
    console.log(error);
    Alert.alert(
      'Error',
      'Something went wrong with the conference.',
      [
        {text: 'OK', onPress: () => {}, style: 'cancel'},
      ],
    );
  }

  render() {
    return (
      <View style={styles.container}>
        <TextInput
            ref={component => this._textInput = component}
            style={styles.textInput}
            placeholder={'Conference_name'}
            autoFocus={true}
            placeholderTextColor={'lightgrey'}
            onChangeText={(text) => this.setState({conferenceId:text})}
          />
        <TouchableOpacity style={styles.joinButton}
                          onPress={this._onJoinConference}
                          disabled={this.state.conferenceId.length === 0}>
          <Text style={styles.joinText}>{"Join conference"}</Text>
        </TouchableOpacity>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    alignItems: 'center',
    backgroundColor: 'white',
    marginTop: 70,
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  joinButton: {
    padding: 4,
    paddingHorizontal: 4,
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: '#007AFF',
    borderRadius:5,
  },
  joinText: {
    color: 'white',
    fontSize: 16,
  },
  textInput: {
    height: 30,
    backgroundColor: 'white',
    marginHorizontal: 36,
    marginBottom: 16,
    paddingHorizontal: 12,
    fontSize: 14,
    borderRadius:5,
    borderWidth: 1,
    borderColor: 'lightgrey',
  },
});

AppRegistry.registerComponent('VoxeetRNSample', () => VoxeetRNSample);
