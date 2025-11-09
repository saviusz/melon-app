import 'package:flutter/material.dart';
import 'package:melon_app/models/song_meta.dart';

class SongList extends StatelessWidget {
  final Future<List<SongMeta>> songs;

  const SongList({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: songs,
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (data != null) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 4.0,
              children: [
                for (final song in data)
                  SongListItem(key: Key(song.id), song: song),
              ],
            ),
          );
        }
        return Center(child: Text("No data"));
      },
    );
  }
}

class SongListItem extends StatelessWidget {
  const SongListItem({super.key, required this.song});

  final SongMeta song;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(color: Colors.black26),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(song.titles[0]),
          Row(
            spacing: 4.0,
            children: [
              Text("Utwór"),
              if (song.titles.length > 1) ...[
                SizedBox.square(
                  dimension: 5.0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                for (final title in song.titles.skip(1)) ...[Text(title)],
              ],
            ],
          ),
        ],
      ),
    );
  }
}
