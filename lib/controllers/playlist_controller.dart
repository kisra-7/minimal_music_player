import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:music_player/models/song.dart';

class PlaylistController extends GetxController {
  // ignore: unused_field

  @override
  void onInit() {
    super.onInit();
    listenToDuration();
  }

  final List<Song> _playlist = [
    Song(
        songName: 'ACID RAP',
        artitst: 'Chance The Rapper',
        albumImagePath: 'assets/images/chance.jpg',
        audiPath: 'audios/travis.mp3'),
    Song(
        songName: 'AMARI',
        artitst: 'j-Cole',
        albumImagePath: 'assets/images/cole.jpg',
        audiPath: 'audios/travis.mp3'),
    Song(
        songName: 'BELIE JAINE',
        artitst: 'MJ',
        albumImagePath: 'assets/images/mj.jpg',
        audiPath: 'audios/travis.mp3'),
    Song(
        songName: 'DUCATI',
        artitst: 'Montiyago',
        albumImagePath: 'assets/images/monti.jpg',
        audiPath: 'audios/travis.mp3'),
    Song(
        songName: 'HAGEEGA',
        artitst: 'Soulja',
        albumImagePath: 'assets/images/soulja.jpeg',
        audiPath: 'audios/travis.mp3'),
    Song(
        songName: 'STARGAZING',
        artitst: 'Travis Scott',
        albumImagePath: 'assets/images/travis.jpg',
        audiPath: 'audios/travis.mp3'),
    Song(
        songName: 'CHROMKOPIA',
        artitst: 'Tyler the creator',
        albumImagePath: 'assets/images/tyler.jpg',
        audiPath: 'audios/travis.mp3'),
    Song(
        songName: 'NO ROLE MODELZ',
        artitst: 'j.Cole',
        albumImagePath: 'assets/images/forest.jpeg',
        audiPath: 'audios/travis.mp3'),
    Song(
        songName: 'GRADUATION',
        artitst: 'Kanye West',
        albumImagePath: 'assets/images/grad.jpg',
        audiPath: 'audios/travis.mp3'),
    Song(
        songName: 'THE PARTY NEVER ENDS',
        artitst: 'Juice wrld',
        albumImagePath: 'assets/images/juice.png',
        audiPath: 'audios/travis.mp3'),
    Song(
        songName: 'G.O.M.D',
        artitst: 'j.Cole',
        albumImagePath: 'assets/images/kod.jpg',
        audiPath: 'audios/travis.mp3'),
  ];

  RxInt? currentSongIndex;

  List get playlist => _playlist;

  final AudioPlayer _audioPlayer = AudioPlayer();

  final Rx<Duration> _currentDuration = Duration.zero.obs;
  final Rx<Duration> _totalDuration = Duration.zero.obs;
  final RxBool _isPlaying = false.obs;

  void play() async {
    final String path = _playlist[currentSongIndex!.value].audiPath;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying.value = true;
  }

  void pause() async {
    await _audioPlayer.stop();
    _isPlaying.value = false;
  }

  void resume() async {
    await _audioPlayer.resume();
    _isPlaying.value = true;
  }

  void pauseOrResume() async {
    if (_isPlaying.value == true) {
      pause();
    } else {
      resume();
    }
  }

  void seek(Duration pos) async {
    await _audioPlayer.seek(pos);
  }

  void playNextSong() {
    if (currentSongIndex?.value != null) {
      if (currentSongIndex!.value < _playlist.length - 1) {
        currentSongIndex!.value = currentSongIndex!.value + 1;
      }
    } else {
      currentSongIndex!.value = 0;
    }
  }

  void playPreviosSong() {
    if (_currentDuration.value.inSeconds > 2) {
      seek(Duration.zero);
    } else {
      if (currentSongIndex!.value > 0) {
        currentSongIndex!.value = currentSongIndex!.value - 1;
      } else {
        currentSongIndex!.value = _playlist.length - 1;
      }
    }
  }

  void listenToDuration() {
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration.value = newDuration;
    });

    _audioPlayer.onPositionChanged.listen((newPos) {
      _currentDuration.value = newPos;
    });

    _audioPlayer.onPlayerComplete.listen((val) {
      playNextSong();
    });
  }

  bool get isPlaying => _isPlaying.value;
  Duration get currentDuration => _currentDuration.value;
  Duration get totalDuration => _totalDuration.value;
}
