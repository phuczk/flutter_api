import 'package:json_annotation/json_annotation.dart';
import 'music_response.dart';

part 'music_api_response.g.dart';

@JsonSerializable()
class MusicApiResponse {
  final List<MusicResponse> data;
  final int? total;
  final String? next;

  MusicApiResponse({required this.data, this.total, this.next});

  factory MusicApiResponse.fromJson(Map<String, dynamic> json) =>
      _$MusicApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MusicApiResponseToJson(this);
}
