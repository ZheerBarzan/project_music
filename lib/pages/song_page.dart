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
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "505",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text("Arctic Monkeys"),
                              ],
                            ),

                            //heart Icon

                            Icon(
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
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      const Row(
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
                      Slider(
                        min: 0,
                        max: 100,
                        activeColor: Provider.of<ThemeProvider>(context)
                            .themeData
                            .colorScheme
                            .outline,
                        value: 50,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),

                // controls
              ],
            ),
          ),
        ),
      ),
    );
  }
}
