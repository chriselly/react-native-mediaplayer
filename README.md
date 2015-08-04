# react-native-mediaplayer
Simple full screen media player for React Native. 

## Installation
Install using npm with `npm install --save react-native-mediaplayer`. React Native >=0.4.0 is needed.

1. Using Xcode open the project navigator, right click and choose `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-mediaplayer` and add `RNMediaPlayer.h` and `RNMediaPlayer.m`

## Usage
```javascript
var React = require('react-native');
var MediaPlayer = require('react-native-mediaplayer');

MediaPlayer.open({uri: 'filename.ext'});
```

The best use case is to add it with onPress to load a video when the user taps on an item.

## Other notes


Only supports iOS 8.0 and later due to AVPlayerViewController usage.
File extensions must be specified due to media types at the moment.