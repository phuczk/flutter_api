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
        "b2fd2ef69emsh1bb0c506a6e52d9p145a41jsna65651cd5d00",
        "deezerdevs-deezer.p.rapidapi.com",
      );

      print(musicApiResponse.toJson());
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
        "b2fd2ef69emsh1bb0c506a6e52d9p145a41jsna65651cd5d00",
        "deezerdevs-deezer.p.rapidapi.com",
      );

      return musicApiResponse.data;
    } catch (e) {
      throw ApiException(message: "Failed to fetch Musics: $e");
    }
  }
}
