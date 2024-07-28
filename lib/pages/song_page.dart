import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_music/components/neu_box.dart';
import 'package:project_music/models/playlist_provider.dart';
import 'package:project_music/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  String timeFormat(Duration duration) {
    String twoDigits =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    String formattedTime = "${duration.inMinutes}:$twoDigits";
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {
        // get the playlist
        final playlist = value.playlist;
        // get the current song
        final currentSong = playlist[value.currentSongIndex ?? 0];
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // app bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // back button
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),

                      // title

                      const Text("Now Playing"),

                      // menu button
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.menu),
                      ),
                    ],
                  ),

                  // album artwork

                  NeuBox(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(currentSong.albumArtImagePath,
                              height: 300, width: 300, fit: BoxFit.fill),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    currentSong.songName,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(currentSong.artistName),
                                ],
                              ),

                              //heart Icon

                              const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // song duration process
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // start and end time
                            Text(timeFormat(value.currentDuration!)),

                            // shuffle and repeat button
                            const Icon(Icons.shuffle),

                            const Icon(Icons.repeat),

                            // end time
                            Text(timeFormat(value.totalDuration!)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 7),
                    ),
                    child: Slider(
                      min: 0,
                      max: value.totalDuration!.inSeconds.toDouble(),
                      activeColor: Provider.of<ThemeProvider>(context)
                          .themeData
                          .colorScheme
                          .outline,
                      value: value.currentDuration!.inSeconds.toDouble(),
                      onChanged: (double double) {},
                      onChangeEnd: (double double) {
                        value.seek(Duration(seconds: double.toInt()));
                      },
                    ),
                  ),
                  // controls
                  const SizedBox(
                    height: 25,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // previous button
                      GestureDetector(
                        onTap: value.previous,
                        child: const NeuBox(
                          child: Icon(
                            Icons.skip_previous,
                            size: 50,
                          ),
                        ),
                      ),

                      // play button
                      GestureDetector(
                        onTap: value.togglePlay,
                        child: NeuBox(
                          child: Icon(
                            value.isPlaying ? Icons.pause : Icons.play_arrow,
                            size: 50,
                          ),
                        ),
                      ),

                      // next button
                      GestureDetector(
                        onTap: value.next,
                        child: const NeuBox(
                          child: Icon(
                            Icons.skip_next,
                            size: 50,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
