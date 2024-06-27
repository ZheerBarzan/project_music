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

              NeuBox(child: Image.asset("assets/images/am.jpg")),

              // song duration process

              // controls
            ],
          ),
        ),
      ),
    );
  }
}
