import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:melon_app/models/song_meta.dart';

class SongList extends StatelessWidget {
  final Future<List<SongMeta>> songs;
  final Function(String songId) onSongSelection;

  const SongList({
    super.key,
    required this.songs,
    required this.onSongSelection,
  });

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
                  SongListItem(
                    key: Key(song.id),
                    song: song,
                    onTap: () => onSongSelection(song.id),
                  ),
              ],
            ),
          );
        }
        return Center(child: Text("No data"));
      },
    );
  }
}

class SongListItem extends StatefulWidget {
  const SongListItem({super.key, required this.song, this.onTap});

  final SongMeta song;
  final VoidCallback? onTap;

  @override
  State<SongListItem> createState() => _SongListItemState();
}

class _SongListItemState extends State<SongListItem> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (value) {
        setState(() {
          isFocused = value;
        });
      },
      onKeyEvent: (node, event) {
        switch (event.logicalKey) {
          case LogicalKeyboardKey.enter:
          case LogicalKeyboardKey.space:
            if (widget.onTap != null) widget.onTap!();
            return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          decoration: BoxDecoration(
            color: isFocused ? Colors.black12 : null,
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(color: Colors.black26),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(widget.song.titles[0]),
              Row(
                spacing: 4.0,
                children: [
                  Text("Utwór"),
                  if (widget.song.titles.length > 1) ...[
                    SizedBox.square(
                      dimension: 5.0,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    for (final title in widget.song.titles.skip(1)) ...[
                      Text(title),
                    ],
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
