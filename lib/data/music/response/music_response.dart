import 'package:api_flutter/data/album/response/music_album_response.dart';
import 'package:api_flutter/domain/music/entity/music_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'music_response.g.dart';

@JsonSerializable()
class MusicResponse extends MusicEntity {
  @override
  @JsonKey(name: "id")
  final int? id;

  @JsonKey(name: "title")
  final String? title;

  @JsonKey(name: "preview")
  final String? preview;

  @JsonKey(name: "rank")
  final int? rank;

  @JsonKey(name: "duration")
  final int? duration;

  @JsonKey(name: "explicit_lyrics")
  final bool? explicitLyrics;

  @JsonKey(name: "link")
  final String? link;

  @JsonKey(name: "album")
  final MusicAlbumResponse? album;

  const MusicResponse(
      {this.id,
      this.title,
      this.preview,
      this.rank,
      this.duration,
      this.explicitLyrics,
      this.link,
      this.album})
      : super(0, '', 0, '');

  factory MusicResponse.fromJson(Map<String, dynamic> json) =>
      _$MusicResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MusicResponseToJson(this);
}
