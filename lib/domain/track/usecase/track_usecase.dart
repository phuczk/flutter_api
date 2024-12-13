import 'package:api_flutter/data/track/response/track_response.dart';
import 'package:api_flutter/domain/track/repositories/track_repositories.dart';

class TrackUsecase {
  final TrackRepository _trackRepository;

  TrackUsecase(this._trackRepository);

  Future<TrackResponse> getTrack(String id) async {
    try {
      return _trackRepository.getTrack(id);
    } catch (e) {
      rethrow;
    }
  }
}
