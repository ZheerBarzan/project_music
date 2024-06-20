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
            const DrawerHeader(
              child: Center(
                  child: Icon(
                Icons.music_note,
              )),
            ),
            //home tile
            ListTile(
              title: const Row(
                children: [
                  Text('H O M E'),
                  Spacer(),
                  Icon(Icons.home),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            // setting tile
            ListTile(
              title: const Row(
                children: [
                  Text('S E T T I N G S'),
                  Spacer(),
                  Icon(Icons.settings),
                ],
              ),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),

            //
          ],
        ));
  }
}
