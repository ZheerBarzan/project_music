import "package:flutter/material.dart";
import "package:project_music/pages/settings_page.dart";

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
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
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: ListTile(
                title: const Text("H O M E"),
                leading: const Icon(
                  Icons.home,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            // setting tile
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: ListTile(
                title: const Text("S E T T I N G S"),
                leading: const Icon(Icons.settings),
                onTap: () {
                  Navigator.pop(context);

                  // navigate to setting page
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsPage()));
                },
              ),
            ),

            //
          ],
        ));
  }
}
