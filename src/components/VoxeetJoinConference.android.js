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

type Props = {
  onJoinConference: Function,
}

export default class VoxeetJoinConference extends Component {
  state: State;

  constructor() {
    super();
    this.state = {
      conferenceId: '',
    };
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
                          onPress={() => this.props.onJoinConference(this.state.conferenceId)}
                          disabled={this.state.conferenceId.length === 0}>
          <Text style={styles.joinText}>{"Join conference"}</Text>
        </TouchableOpacity>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: 'white',
  },
  joinButton: {
    paddingVertical: 12,
    paddingHorizontal: 16,
    backgroundColor: '#007AFF',
    marginRight: 8,
  },
  joinText: {
    color: 'white',
    fontSize: 16,
  },
  textInput: {
    flex: 1,
    height: 40,
    backgroundColor: 'white',
    marginHorizontal: 8,
    fontSize: 14,
  },
});
