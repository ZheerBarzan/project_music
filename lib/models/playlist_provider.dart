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
  bool _isPlaying = false;

  // play
  void play() async {
    final String Path = _playlist[_currentSongIndex!].songPath;

    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(Path));

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

  //puase or resume

  void togglePlay() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }

    notifyListeners();
  }

  // seek

  void seek(Duration duration) async {
    await _audioPlayer.seek(duration);
  }

  //next
  void next() async {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        _currentSongIndex = _currentSongIndex! + 1;
      } else {
        _currentSongIndex = 0;
      }
    }
  }

  // previous
  void previous() async {
    if (_currentDuration!.inSeconds > 3) {
    } else {
      if (_currentSongIndex != null) {
        if (_currentSongIndex! > 0) {
          _currentSongIndex = _currentSongIndex! - 1;
        } else {
          _currentSongIndex = _playlist.length - 1;
        }
      }
    }
  }

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
  Duration? get totalDuration => _toatalDuration;

  //setters

  set currentSongIndex(int? index) {
    _currentSongIndex = index;

    if (index != null) {
      play();
    }
    notifyListeners();
  }
}
