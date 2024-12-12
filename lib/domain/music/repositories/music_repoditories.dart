import 'package:api_flutter/data/music/response/music_response.dart';

abstract class MusicRepository {
  Future<List<MusicResponse>> fetchMusic(String name);
  Future<List<MusicResponse>> searchMusic(String name);
}
