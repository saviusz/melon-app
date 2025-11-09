import 'package:melon_app/models/song_meta.dart';

class Song extends SongMeta {
  final List<Part> parts;

  Song(super.id, {required super.titles, this.parts = const []});
}

enum PartType { note, /* bridge, */ verse, chorus /* , ornament  */ }

class Part {
  Part({required this.type, required this.lines});

  final PartType type;
  final List<Line> lines;
}

class Line {
  Line(this.text, [this.chords = const []]);

  final String text;
  final List<Chord> chords;
}

enum RootNote { a, b, c, d, e, f, g, h }

enum ChordQuality { maj, min /* aug, dim, hdim, dom  */ }

class Chord {
  final RootNote rootNote;
  final ChordQuality quality;

  Chord({required this.rootNote, required this.quality});

  factory Chord.basic(RootNote note, bool isMajor) => Chord(
    rootNote: note,
    quality: isMajor ? ChordQuality.maj : ChordQuality.min,
  );
}
