import 'package:melon_app/models/song_meta.dart';
import 'package:melon_app/models/song.dart';

abstract class AbstractSource {
  Future<List<SongMeta>> listSongs();
  Future<Song?> getSong(String id);
}
