import 'package:api_flutter/data/music/response/music_response.dart';
import 'package:api_flutter/domain/music/entity/music_entity.dart';

import '../repositories/music_repoditories.dart';

class MusicUsecase {
  final MusicRepository _musicRepository;

  MusicUsecase(this._musicRepository);

  Future<List<MusicResponse>> fetchMusics(String name) async {
    try {
      return _musicRepository.fetchMusic(name);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MusicEntity>> searchMusics(String name) async {
    try {
      return _musicRepository.searchMusic(name);
    } catch (e) {
      rethrow;
    }
  }
}
