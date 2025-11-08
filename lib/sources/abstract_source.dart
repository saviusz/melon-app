import 'package:melon_app/models/song.dart';

abstract class AbstractSource {
  Future<Song?> getSong(String id);
}
