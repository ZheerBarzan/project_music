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
  ];
}
