import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/play_list.page.dart';
import 'package:flutter_application_1/widgets/sound_player.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final playListEx = Playlist(
    audios: [
      Audio(
        'assets/1.mp3',
        metas: Metas(title: 'Song 1', artist: 'Artist 1'),
      ),
      Audio(
        'assets/2.mp3',
        metas: Metas(title: 'Song 2', artist: 'Artist 2'),
      ),
      Audio(
        'assets/3.mp3',
        metas: Metas(title: 'Song 3', artist: 'Artist 3'),
      ),
      Audio(
        'assets/4.mp3',
        metas: Metas(title: 'Song 4', artist: 'Artist 4'),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => PlayListPage(
                                playlist: playListEx,
                              )));
                },
                icon: const Icon(Icons.playlist_add_check_circle_sharp))
          ],
        ),
        body: SoundPlayerWidget(
          playlist: playListEx,
        ));
  }
}
