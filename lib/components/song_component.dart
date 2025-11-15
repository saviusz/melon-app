import 'package:flutter/material.dart';
import 'package:melon_app/models/song.dart';

class SongComponent extends StatelessWidget {
  final Future<Song?> song;

  const SongComponent({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 450),
        child: FutureBuilder(
          future: song,
          builder: (context, snap) {
            final song = snap.data;
            if (snap.hasData && song != null) {
              return SingleChildScrollView(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  spacing: 8.0,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SongHeader(
                      mainTitle: song.titles.first,
                      alternativeTitles: [...song.titles.skip(1)],
                    ),
                    SongContent(parts: song.parts),
                  ],
                ),
              );
            }
            return Center(child: Text("No song"));
          },
        ),
      ),
    );
  }
}

class SongContent extends StatelessWidget {
  final List<Part> parts;

  const SongContent({super.key, required this.parts});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 4.0,
      children: [
        for (final part in parts)
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (final line in part.lines)
                      switch (part.type) {
                        PartType.note => Text(
                          line.text,
                          style: TextStyle(
                            color: Colors.blueGrey[700],
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        PartType.chorus => Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            line.text,
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                        _ => Text(line.text),
                      },
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.blueGrey[200],
                ),
                child: Column(
                  children: [
                    for (final line in part.lines)
                      Text(line.chords.map((x) => x.rootNote.name).join(" ")),
                  ],
                ),
              ),
            ],
          ),
      ],
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
