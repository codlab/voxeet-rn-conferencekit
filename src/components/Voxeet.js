/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React, { Component } from 'react';
import VoxeetJoinConference from './VoxeetJoinConference';
import VoxeetRN from '../../VoxeetRN';
import type {ConferenceUser} from '../../VoxeetRN';

import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  TouchableOpacity,
  TextInput,
  Alert,
} from 'react-native';

export default class Voxeet extends Component {

  componentWillMount() {
    VoxeetRN.initialize('consumerKey', 'consumerSecret', false);
  }

  componentDidMount() {
    VoxeetRN.openSession('1111', 'John Smith', 'https://docs.moodle.org/27/en/images_en/7/7c/F1.png')
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
    VoxeetRN.appearMaximized(true);
    VoxeetRN.defaultBuiltInSpeaker(true);
    VoxeetRN.screenAutoLock(true);
  }

  _onJoinConference = (conferenceId: string) => {
    const participants = this._createParticipants();

    VoxeetRN.initializeConference(conferenceId, participants);
    VoxeetRN.startConference(true)
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
        <VoxeetJoinConference onJoinConference={(confId: string) => this._onJoinConference(confId)}/>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    backgroundColor: 'white',
  },
});
