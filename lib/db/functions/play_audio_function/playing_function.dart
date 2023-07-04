import 'package:assets_audio_player/assets_audio_player.dart';

List<Audio> playinglistAudio = [];

// List<Audio> favlistAudio = [];

// List<Audio> searchAudio = [];

// List<Audio> recentAudio = [];

AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

playAudio(var listSongs, int index) async {
  playinglistAudio.clear();
  for (var item in listSongs) {
    playinglistAudio.add(
      Audio.file(
        item.uri!,
        metas: Metas(
          image: const MetasImage.asset('path'),
          title: item.title,
          artist: item.artist,
          id: item.id.toString(),
        ),
      ),
    );
  }
  await assetsAudioPlayer.open(
    Playlist(audios: playinglistAudio, startIndex: index),
    showNotification: true,
    notificationSettings: const NotificationSettings(stopEnabled: false),
  );
  assetsAudioPlayer.setLoopMode(LoopMode.playlist);
}

// playFavAudio(List<Favsongs> listSongs, int index) async {
//   for (var song in listSongs) {
//     favlistAudio.add(Audio.file(
//       song.uri!,
//       metas: Metas(
//         image: const MetasImage.asset('path'),
//         title: song.title,
//         artist: song.artist,
//         id: song.id.toString(),
//       ),
//     ));
//   }
//   await assetsAudioPlayer.open(
//     Playlist(audios: favlistAudio, startIndex: index),
//     showNotification: true,
//     notificationSettings: const NotificationSettings(stopEnabled: false),
//   );
//   assetsAudioPlayer.setLoopMode(LoopMode.playlist);
// }

// playSearchAudio(List<dynamic> listSongs, int index) async {
//   for (var song in listSongs) {
//     searchAudio.add(Audio.file(
//       song.uri!,
//       metas: Metas(
//         image: const MetasImage.asset('path'),
//         title: song.title,
//         artist: song.artist,
//         id: song.id.toString(),
//       ),
//     ));
//   }
//   await assetsAudioPlayer.open(
//     Playlist(audios: searchAudio, startIndex: index),
//     showNotification: true,
//     notificationSettings: const NotificationSettings(stopEnabled: false),
//   );
//   assetsAudioPlayer.setLoopMode(LoopMode.playlist);
// }

// playrecentAudio(List<dynamic> listSongs, int index) async {
//   recentAudio.clear();
//   for (var song in listSongs) {
//     recentAudio.add(Audio.file(
//       song.uri!,
//       metas: Metas(
//         image: const MetasImage.asset('path'),
//         title: song.title,
//         artist: song.artist,
//         id: song.id.toString(),
//       ),
//     ));
//   }
//   await assetsAudioPlayer.open(
//     Playlist(audios: recentAudio, startIndex: index),
//     showNotification: true,
//     notificationSettings: const NotificationSettings(stopEnabled: false),
//   );
//   assetsAudioPlayer.setLoopMode(LoopMode.playlist);
// }
