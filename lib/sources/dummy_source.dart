import 'package:melon_app/models/song_meta.dart';
import 'package:melon_app/models/song.dart';
import 'package:melon_app/sources/abstract_source.dart';

final songs = [
  Song(
    "-dummy-1",
    titles: ["Piosenka"],
    parts: [
      Part(
        type: PartType.verse,
        lines: [
          Line("Ta piosenka będzie"),
          Line("bardzo prosta"),
          Line("Bo nie potrzebujemy tutaj dużo"),
          Line("Nie będzie nawet akordów"),
        ],
      ),
      Part(
        type: PartType.verse,
        lines: [
          Line("Będzie za to refren"),
          Line("Bo czemu nie"),
          Line("I damy mu też trzecią linijkę"),
        ],
      ),
    ],
  ),
  Song(
    "-dummy-2",
    titles: ["Główny tytuł", "Tytuł dodatkowy", "Tu nie będzie zawartości"],
  ),
  Song(
    "-dummy-3",
    titles: ["To będzie naprawde długi tytuł", "Introductory Piece"],
    parts: [
      // Note (Intro)
      Part(
        type: PartType.note,
        lines: [
          Line("This is an intro section", []),
          Line("Setting the mood for what's to come", []),
        ],
      ),
      // Verse
      Part(
        type: PartType.verse,
        lines: [
          Line("Morning breaks with golden light", [
            Chord.basic(RootNote.d, true),
            Chord.basic(RootNote.a, true),
          ]),
          Line("Birds are singing in the trees", [
            Chord.basic(RootNote.b, false),
            Chord.basic(RootNote.f, true),
          ]),
        ],
      ),
      // Chorus
      Part(
        type: PartType.chorus,
        lines: [
          Line("Oh how beautiful the day", [
            Chord.basic(RootNote.g, true),
            Chord.basic(RootNote.d, true),
          ]),
          Line("In this moment I can stay", [
            Chord.basic(RootNote.e, false),
            Chord.basic(RootNote.a, true),
          ]),
        ],
      ),
      // Verse to Chorus transition
      Part(
        type: PartType.verse,
        lines: [
          Line("Evening falls with gentle grace", [
            Chord.basic(RootNote.c, true),
            Chord.basic(RootNote.e, false),
          ]),
        ],
      ),
      Part(
        type: PartType.chorus,
        lines: [
          Line("Still I feel this peaceful place", [
            Chord.basic(RootNote.f, true),
            Chord.basic(RootNote.c, true),
          ]),
        ],
      ),
    ],
  ),
  Song(
    "-dummy-4",
    titles: ["The Complete Journey", "Full Spectrum"],
    parts: [
      // Note -> Verse (Opening)
      Part(
        type: PartType.note,
        lines: [
          Line("A new journey begins", []),
          Line("With hope in every heart", []),
        ],
      ),
      Part(
        type: PartType.verse,
        lines: [
          Line("In the quiet morning light", [
            Chord.basic(RootNote.c, true),
            Chord.basic(RootNote.e, false),
            Chord.basic(RootNote.f, true),
          ]),
          Line("We find our first steps forward", [
            Chord.basic(RootNote.g, true),
            Chord.basic(RootNote.a, false),
            Chord.basic(RootNote.f, true),
          ]),
        ],
      ),

      // Verse -> Chorus (Build-up)
      Part(
        type: PartType.verse,
        lines: [
          Line("Questions fill our minds", [
            Chord.basic(RootNote.d, true),
            Chord.basic(RootNote.b, false),
            Chord.basic(RootNote.g, true),
          ]),
          Line("But answers wait ahead", [
            Chord.basic(RootNote.e, false),
            Chord.basic(RootNote.c, true),
            Chord.basic(RootNote.g, true),
          ]),
        ],
      ),
      Part(
        type: PartType.chorus,
        lines: [
          Line("So we rise, we shine, we grow", [
            Chord.basic(RootNote.f, true),
            Chord.basic(RootNote.c, true),
            Chord.basic(RootNote.d, true),
          ]),
          Line("Through the storms and sun we go", [
            Chord.basic(RootNote.g, true),
            Chord.basic(RootNote.e, false),
            Chord.basic(RootNote.c, true),
          ]),
        ],
      ),

      // Chorus -> Note (Reflection)
      Part(
        type: PartType.chorus,
        lines: [
          Line("Our voices lift in harmony", [
            Chord.basic(RootNote.a, true),
            Chord.basic(RootNote.e, true),
            Chord.basic(RootNote.f, true),
          ]),
        ],
      ),
      Part(
        type: PartType.note,
        lines: [
          Line("A moment of contemplation", []),
          Line("Between the peaks and valleys", []),
          Line("We breathe and find our center", []),
        ],
      ),

      // Note -> Chorus (Renewed energy)
      Part(
        type: PartType.note,
        lines: [Line("In this pause we gather strength", [])],
      ),
      Part(
        type: PartType.chorus,
        lines: [
          Line("Now we know which path to take", [
            Chord.basic(RootNote.d, true),
            Chord.basic(RootNote.a, true),
            Chord.basic(RootNote.b, false),
          ]),
          Line("With courage for our hearts", [
            Chord.basic(RootNote.g, true),
            Chord.basic(RootNote.d, true),
            Chord.basic(RootNote.a, true),
          ]),
        ],
      ),

      // Chorus -> Verse (New perspective)
      Part(
        type: PartType.chorus,
        lines: [
          Line("Our spirits soar with music", [
            Chord.basic(RootNote.e, false),
            Chord.basic(RootNote.c, true),
            Chord.basic(RootNote.g, true),
          ]),
        ],
      ),
      Part(
        type: PartType.verse,
        lines: [
          Line("With clearer sight we see", [
            Chord.basic(RootNote.f, true),
            Chord.basic(RootNote.c, true),
            Chord.basic(RootNote.a, false),
          ]),
          Line("The beauty all around", [
            Chord.basic(RootNote.d, true),
            Chord.basic(RootNote.g, true),
            Chord.basic(RootNote.e, false),
          ]),
        ],
      ),

      // Verse -> Note (Concluding thought)
      Part(
        type: PartType.verse,
        lines: [
          Line("As the day draws to a close", [
            Chord.basic(RootNote.c, true),
            Chord.basic(RootNote.f, true),
            Chord.basic(RootNote.g, true),
          ]),
        ],
      ),
      Part(
        type: PartType.note,
        lines: [
          Line("We've traveled through the music", []),
          Line("Explored each chord and phrase", []),
          Line("Found the transitions that bind", []),
          Line("Verse to chorus, note to phrase", []),
        ],
      ),

      // Note -> Note (Final reflection)
      Part(
        type: PartType.note,
        lines: [
          Line("In these quiet moments", []),
          Line("All the transitions make sense", []),
          Line("Each part connects to form", []),
          Line("A complete musical sentence", []),
        ],
      ),
    ],
  ),
];

class DummySource extends AbstractSource {
  @override
  Future<List<SongMeta>> listSongs() async {
    return songs;
  }

  @override
  Future<Song?> getSong(String id) async {
    return songs.firstWhere((song) => song.id == id);
  }
}
