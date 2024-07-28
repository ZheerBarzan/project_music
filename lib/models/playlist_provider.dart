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
      songPath: "audio/505.mp3",
    ),
    Song(
      songName: "Do I Wanna Know?",
      artistName: "Arctic Monkeys",
      albumArtImagePath: "assets/images/am.jpg",
      songPath: "audio/Do I Wanna Know.mp3",
    ),
    Song(
      songName: "I Wanna Be Yours",
      artistName: "Arctic Monkeys",
      albumArtImagePath: "assets/images/am.jpg",
      songPath: "audio/I Wanna Be Yours.mp3",
    ),
    Song(
      songName: "R U Mine",
      artistName: "Arctic Monkeys",
      albumArtImagePath: "assets/images/am.jpg",
      songPath: "audio/R U Mine.mp3",
    ),
  ];

  int? _currentSongIndex;

  // audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  //duration

  Duration? _currentDuration = Duration.zero;
  Duration? _totalDuration = Duration.zero;

  //constructor

  PlaylistProvider() {
    listenToDuration();
  }

  //initally not playing
  bool _isPlaying = false;

  // play
  void play() async {
    final String path = _playlist[_currentSongIndex!].songPath;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    notifyListeners();
  }

  // pause

  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  // resume
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  //pause or resume

  void togglePlay() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  // seek

  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  //next
  void next() async {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        currentSongIndex = 0;
      }
    }
  }

  // previous
  void previous() async {
    if (_currentDuration!.inSeconds > 3) {
      seek(Duration.zero);
    } else {
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        currentSongIndex = _playlist.length - 1;
      }
    }
  }

  // listen to duration
  void listenToDuration() {
    // listen for current duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    // listen for total duration

    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });
    // listen for the song completed

    _audioPlayer.onPlayerComplete.listen((event) {
      next();
    });
  }
  // dispose of audio player

  //getters

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration? get currentDuration => _currentDuration;
  Duration? get totalDuration => _totalDuration;

  //setters

  set currentSongIndex(int? index) {
    _currentSongIndex = index;

    if (index != null) {
      play();
    }
    notifyListeners();
  }
}
