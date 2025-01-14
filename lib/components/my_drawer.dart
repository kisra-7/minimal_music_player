import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:music_player/pages/settings.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child: Icon(
              Icons.music_note,
              size: 50,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const ListTile(
              title: Text('H O M E'),
              leading: Icon(Icons.home),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(Settings());
            },
            child: const ListTile(
              title: Text('S E T T I N G S'),
              leading: Icon(Icons.settings),
            ),
          ),
        ],
      ),
    );
  }
}
