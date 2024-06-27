import 'package:flutter/material.dart';
import 'package:project_music/components/neu_box.dart';
import 'package:project_music/models/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
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

                    Text("P L A Y L I S T"),

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
                        child: Image.asset("assets/images/am.jpg"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Text("505"),
                                Text("Arctic Monkeys"),
                              ],
                            ),

                            //heart Icon
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                // song duration process

                // controls
              ],
            ),
          ),
        ),
      ),
    );
  }
}
