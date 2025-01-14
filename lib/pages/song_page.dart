import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/components/image_box.dart';
import 'package:music_player/controllers/playlist_controller.dart';
import 'package:music_player/models/song.dart';

class SongPage extends StatelessWidget {
  SongPage({super.key});
  final controller = Get.put(PlaylistController());

  String formatTime(Duration duration) {
    String secondsDigits =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    String time = '${duration.inMinutes}:$secondsDigits';
    return time;
  }

  @override
  Widget build(BuildContext context) {
    final playList = controller.playlist;

    Song song = playList[controller.currentSongIndex!.value];
    return Obx(
      () => Scaffold(
          body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Text('P L A Y L I S T'),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ImageBox(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        song.albumImagePath,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                song.songName,
                                style: TextStyle(
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                              Text(
                                song.artitst,
                                style: const TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 33,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatTime(controller.currentDuration),
                      style: const TextStyle(fontSize: 15),
                    ),
                    const Icon(
                      Icons.shuffle,
                      size: 27,
                    ),
                    const Icon(
                      Icons.repeat,
                      size: 27,
                    ),
                    Text(
                      formatTime(controller.totalDuration),
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 0)),
                child: Slider(
                  thumbColor: Colors.green,
                  activeColor: Colors.green,
                  min: 0,
                  max: controller.totalDuration.inSeconds.toDouble(),
                  value: controller.currentDuration.inSeconds.toDouble(),
                  onChanged: (val) {},
                  onChangeEnd: (double val) {
                    controller.seek(Duration(seconds: val.toInt()));
                  },
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Expanded(
                    child: ImageBox(
                      onTap: controller.playPreviosSong,
                      child: const Icon(Icons.skip_previous),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ImageBox(
                      onTap: controller.pauseOrResume,
                      child: controller.isPlaying
                          ? const Icon(Icons.pause)
                          : const Icon(Icons.play_arrow),
                    ),
                  ),
                  Expanded(
                    child: ImageBox(
                      onTap: controller.playNextSong,
                      child: const Icon(Icons.skip_next),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      )),
    );
  }
}
