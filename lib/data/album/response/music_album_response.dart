import 'package:json_annotation/json_annotation.dart';

part 'music_album_response.g.dart';

@JsonSerializable()
class MusicAlbumResponse {
  final int? id;
  final String? title;
  final String? cover;

  MusicAlbumResponse(this.id, this.title, this.cover);

  factory MusicAlbumResponse.fromJson(Map<String, dynamic> json) =>
      _$MusicAlbumResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MusicAlbumResponseToJson(this);
}
