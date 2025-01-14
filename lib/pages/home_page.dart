import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/components/my_drawer.dart';
import 'package:music_player/components/song_tile.dart';
import 'package:music_player/controllers/playlist_controller.dart';
import 'package:music_player/models/song.dart';
import 'package:music_player/pages/song_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.put(PlaylistController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('P L A Y L I S T'),
      ),
      body: ListView.builder(
        itemCount: controller.playlist.length,
        itemBuilder: (BuildContext context, int index) {
          Song song = controller.playlist[index];
          return SongTile(
            song: song,
            onTap: () {
              controller.currentSongIndex = index.obs;
              // ignore: unnecessary_null_comparison
              if (index != null) {
                controller.play();
              }
              Get.to(SongPage());
            },
          );
        },
      ),
    );
  }
}
