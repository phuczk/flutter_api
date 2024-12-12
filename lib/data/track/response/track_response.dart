import 'package:api_flutter/data/album/response/music_album_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'track_response.g.dart';

@JsonSerializable()
class TrackResponse {
  final int? id;
  final String? title;
  final String? preview;
  final MusicAlbumResponse? album;

  TrackResponse(this.id, this.title, this.preview, this.album);

  factory TrackResponse.fromJson(Map<String, dynamic> json) =>
      _$TrackResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TrackResponseToJson(this);
}
