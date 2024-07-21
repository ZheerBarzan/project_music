import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_music/components/neu_box.dart';
import 'package:project_music/models/playlist_provider.dart';
import 'package:project_music/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

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

                      const Text("P L A Y L I S T"),

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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // start and end time
                            Text("0:00"),

                            // shuffle and repeat button
                            Icon(Icons.shuffle),

                            Icon(Icons.repeat),

                            // end time
                            Text("3:00"),
                          ],
                        ),
                      ],
                    ),
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
                        child: NeuBox(
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.skip_previous,
                            ),
                          ),
                        ),
                      ),

                      // play button
                      GestureDetector(
                        onTap: value.togglePlay,
                        child: NeuBox(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              value.isPlaying ? Icons.pause : Icons.play_arrow,
                            ),
                          ),
                        ),
                      ),

                      // next button
                      GestureDetector(
                        onTap: value.next,
                        child: NeuBox(
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.skip_next,
                            ),
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
