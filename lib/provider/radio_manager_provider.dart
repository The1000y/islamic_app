import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class RadioManagerProvider extends ChangeNotifier {
  String? currentPlayingRadio;
  bool isplaying = false;
  bool isMusted = false;
  AudioPlayer player = AudioPlayer();

  Future<void> play(String url) async {
    if (currentPlayingRadio == url) {
      isplaying ? player.pause() : player.resume();
      isplaying = !isplaying;
    } else {
      player.play(UrlSource(url), volume: 0.5);
      isplaying = true;
      currentPlayingRadio = url;
    }
    notifyListeners();
  }

  Future<void> stop() async {
    await player.stop();
    currentPlayingRadio = null;
    isplaying = false;
    notifyListeners();
  }

  Future<void> mute() async {
    if (isMusted) {
      await player.setVolume(0.5);
    } else {
      await player.setVolume(0);
    }
    isMusted = !isMusted;
    notifyListeners();
  }
}
