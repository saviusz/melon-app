import 'package:flutter/material.dart';
import 'package:melon_app/models/song.dart';

class SongComponent extends StatelessWidget {
  final Future<Song?> song;

  const SongComponent({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: song,
      builder: (context, snap) {
        final song = snap.data;
        if (snap.hasData && song != null) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SongHeader(
                  mainTitle: song.titles.first,
                  alternativeTitles: [...song.titles.skip(1)],
                ),
              ],
            ),
          );
        }
        return Center(child: Text("No song"));
      },
    );
  }
}

class SongHeader extends StatelessWidget {
  final String mainTitle;
  final List<String> alternativeTitles;

  const SongHeader({
    super.key,
    required this.mainTitle,
    this.alternativeTitles = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(color: Colors.black26),
      ),
      child: Column(
        children: [
          Text(mainTitle),
          if (alternativeTitles.isNotEmpty) Text(alternativeTitles.join("; ")),
        ],
      ),
    );
  }
}
