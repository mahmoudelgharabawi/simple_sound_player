import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/song_widget.dart';

class PlayListPage extends StatefulWidget {
  final Playlist playlist;
  const PlayListPage({required this.playlist, super.key});

  @override
  State<PlayListPage> createState() => _PlayListPageState();
}

class _PlayListPageState extends State<PlayListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PlayList Page'),
      ),
      body: ListView(
        children: [
          for (var song in widget.playlist.audios) SongWidget(audio: song)
        ],
      ),
    );
  }
}
