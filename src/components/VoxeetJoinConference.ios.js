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
    alignItems: 'center',
    backgroundColor: 'white',
    marginTop: 70,
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
