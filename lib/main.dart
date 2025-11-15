import 'package:flutter/material.dart';
import 'package:melon_app/components/song_component.dart';
import 'package:melon_app/components/song_list.dart';
import 'package:melon_app/sources/abstract_source.dart';
import 'package:melon_app/sources/dummy_source.dart';

void main() {
  runApp(MainApp(source: DummySource()));
}

class MainApp extends StatelessWidget {
  final AbstractSource source;

  const MainApp({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) {
            return SongList(
              songs: source.listSongs(),
              onSongSelection: (songId) {
                final song = source.getSong(songId);
                final navigator = Navigator.of(context);
                navigator.push(
                  MaterialPageRoute(
                    builder: (context) =>
                        Scaffold(body: SongComponent(song: song)),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
