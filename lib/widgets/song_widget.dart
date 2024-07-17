import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/sound_player.widget.dart';

class SongWidget extends StatefulWidget {
  final Audio audio;
  const SongWidget({required this.audio, super.key});

  @override
  State<SongWidget> createState() => _SongWidgetState();
}

class _SongWidgetState extends State<SongWidget> {
  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    assetsAudioPlayer.open(widget.audio, autoStart: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: StreamBuilder(
          stream: assetsAudioPlayer.realtimePlayingInfos,
          builder: (ctx, snapshots) {
            if (snapshots.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (snapshots.data == null) {
              return const SizedBox.shrink();
            }
            return Text(
                convertSeconds(snapshots.data?.duration.inSeconds ?? 0));
          }),
      leading: CircleAvatar(
        child: Center(
          child: Text(
            "${widget.audio.metas.artist?.split(' ').first[0].toUpperCase()}${widget.audio.metas.artist?.split(' ').last[0].toUpperCase()}",
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
      title: Text(widget.audio.metas.title ?? 'No Title'),
      subtitle: Text(widget.audio.metas.artist ?? 'No Title'),
      onTap: () async {
        showDialog(
            context: context,
            builder: (ctx) {
              return AlertDialog(
                  title: Text('Play/Pause'),
                  content: Container(
                      constraints:
                          BoxConstraints(maxWidth: 450, maxHeight: 550),
                      child: SoundPlayerWidget(
                        triggerFn: () {
                          Navigator.pop(ctx);
                        },
                        playlist: Playlist(audios: [widget.audio]),
                      )));
            });
      },
    );
  }

  String convertSeconds(int seconds) {
    String minutes = (seconds ~/ 60).toString();
    String secondsStr = (seconds % 60).toString();
    return '${minutes.padLeft(2, '0')}:${secondsStr.padLeft(2, '0')}';
  }
}
