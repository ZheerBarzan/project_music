import "package:flutter/material.dart";

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            // logo
            DrawerHeader(
              child: Center(
                  child: Icon(
                Icons.music_note,
              )),
            )
            //home tile

            // setting tile

            //
          ],
        ));
  }
}
