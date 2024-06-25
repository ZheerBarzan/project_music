import 'package:flutter/material.dart';
import 'package:project_music/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  // playlist of songs
  final List<Song> _playlist = [
    Song(
      songName: "505",
      artistName: "Arctic Monkeys",
      albumArtImagePath: "assets/images/am.jpg",
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

  //getters

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;

  //setters
}
