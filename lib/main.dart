import 'package:flutter/material.dart';
import 'package:melon_app/components/song_component.dart';
import 'package:melon_app/components/song_list.dart';
import 'package:melon_app/layouts/wide.dart';
import 'package:melon_app/models/song.dart';
import 'package:melon_app/sources/abstract_source.dart';
import 'package:melon_app/sources/dummy_source.dart';

void main() {
  runApp(MainApp(source: DummySource()));
}

class MainApp extends StatefulWidget {
  final AbstractSource source;

  const MainApp({super.key, required this.source});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Future<Song?>? _song;

  @override
  Widget build(BuildContext context) {
    Widget body = Center(child: Text("There's nothing to display"));
    if (_song != null) {
      body = SongComponent(song: _song!);
    }

    return MaterialApp(
      home: Material(
        child: WideLayout(
          compressed: true,
          body: body,
          sidebar: SongList(
            songs: widget.source.listSongs(),
            onSongSelection: (songId) {
              setState(() {
                _song = widget.source.getSong(songId);
              });
            },
          ),
        ),
      ),
    );
  }
}
