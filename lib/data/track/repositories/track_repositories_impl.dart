import 'package:api_flutter/core/exception/api_exception.dart';
import 'package:api_flutter/data/track/api/track_api_service.dart';
import 'package:api_flutter/data/track/response/track_response.dart';
import 'package:api_flutter/domain/track/repositories/track_repositories.dart';

class TrackRepositoriesImpl implements TrackRepository {
  final TrackApiService _trackApiService;

  TrackRepositoriesImpl(this._trackApiService);

  @override
  Future<TrackResponse> getTrack(String id) async {
    try {
      final trackApiResponse = await _trackApiService.getTrack(
        id,
        "b2fd2ef69emsh1bb0c506a6e52d9p145a41jsna65651cd5d00",
        "deezerdevs-deezer.p.rapidapi.com",
      );
      return trackApiResponse;
    } catch (e) {
      throw ApiException(message: "Failed to fetch Musics: $e");
    }
  }
}
