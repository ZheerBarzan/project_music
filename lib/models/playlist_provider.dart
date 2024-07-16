import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:project_music/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  // playlist of songs
  final List<Song> _playlist = [
    Song(
      songName: "505",
      artistName: "Arctic Monkeys",
      albumArtImagePath: "assets/images/505.jpg",
      songPath: "assets/audio/505.mp3",
    ),
    Song(
      songName: "Do I Wanna Know?",
      artistName: "Arctic Monkeys",
      albumArtImagePath: "assets/images/am.jpg",
      songPath: "assets/audio/Do I Wanna Know.mp3",
    ),
    Song(
      songName: "I Wanna Be Yours",
      artistName: "Arctic Monkeys",
      albumArtImagePath: "assets/images/am.jpg",
      songPath: "assets/audio/I Wanna Be Yours.mp3",
    ),
    Song(
      songName: "R U Mine",
      artistName: "Arctic Monkeys",
      albumArtImagePath: "assets/images/am.jpg",
      songPath: "assets/audio/R U Mine.mp3",
    ),
  ];

  int? _currentSongIndex;

  // audio player
  final _audioPlayer = AudioPlayer();

  //duration

  Duration? _currentDuration = Duration.zero;
  Duration? _toatalDuration = Duration.zero;

  //constructor

  PlaylistProvider() {
    listenToDuration();
  }

  //initally not playing

  // play

  // pause

  // resume

  //puse or resume

  // seek

  //next

  // previous

  // listen to duration
  void listenToDuration() {
    // listen for current duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _toatalDuration = newDuration;
      notifyListeners();
    });

    // listen for total duration

    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });
    // listen for the song completed

    _audioPlayer.onPlayerComplete.listen((event) {});
  }
  // dispose of audio player

  //getters

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;

  //setters

  set currentSongIndex(int? index) {
    _currentSongIndex = index;
    notifyListeners();
  }
}
