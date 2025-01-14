import 'package:flutter/material.dart';
import 'package:music_player/models/song.dart';

// ignore: must_be_immutable
class SongTile extends StatelessWidget {
  final Song song;
  void Function()? onTap;
  SongTile({super.key, required this.song, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(song.songName),
      subtitle: Text(song.artitst),
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(song.albumImagePath)),
    );
  }
}
