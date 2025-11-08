import 'package:melon_app/models/song_meta.dart';
import 'package:melon_app/models/song.dart';
import 'package:melon_app/sources/abstract_source.dart';

final songs = [
  Song("-dummy-1", titles: ["Piosenka"]),
  Song("-dummy-2", titles: ["Główny tytuł", "Tytuł dodatkowy"]),
  Song("-dummy-3", titles: ["To będzie naprawde długi tytuł"]),
  Song("-dummy-4", titles: ["Piosenka pisana nocą"]),
];

class DummySource extends AbstractSource {
  @override
  Future<List<SongMeta>> listSongs() async {
    return songs;
  }
}
