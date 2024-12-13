import 'package:api_flutter/data/track/response/track_response.dart';

abstract class TrackRepository {
  Future<TrackResponse> getTrack(String id);
}
