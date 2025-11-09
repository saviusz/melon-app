import 'package:melon_app/models/song_meta.dart';

abstract class AbstractSource {
  Future<List<SongMeta>> listSongs();
}
