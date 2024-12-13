import 'package:api_flutter/core/constant/api_app.dart';
import 'package:api_flutter/core/exception/api_exception.dart';
import 'package:api_flutter/data/music/api/music/music_api_service.dart';
import 'package:api_flutter/data/music/response/music_response.dart';
import 'package:api_flutter/domain/music/repositories/music_repoditories.dart';

class MusicRepositoriesImpl implements MusicRepository {
  final MusicApiService _musicApiService;

  MusicRepositoriesImpl(this._musicApiService);

  @override
  Future<List<MusicResponse>> fetchMusic(String name) async {
    try {
      final musicApiResponse = await _musicApiService.fetchMusics(
        name,
        rapidKey,
        rapidHost,
      );

      return musicApiResponse.data;
    } catch (e) {
      throw ApiException(message: "Failed to fetch Musics: $e");
    }
  }

  @override
  Future<List<MusicResponse>> searchMusic(String name) async {
    try {
      final musicApiResponse = await _musicApiService.searchMusics(
        name,
        rapidKey,
        rapidHost,
      );

      return musicApiResponse.data;
    } catch (e) {
      throw ApiException(message: "Failed to fetch Musics: $e");
    }
  }
}
