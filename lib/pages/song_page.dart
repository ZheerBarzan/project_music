import 'package:flutter/material.dart';
import 'package:project_music/components/neu_box.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Song Page'),
      ),
      body: const Center(
        child: NeuBox(child: Icon(Icons.abc)),
      ),
    );
  }
}
