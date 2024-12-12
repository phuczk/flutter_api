// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackResponse _$TrackResponseFromJson(Map<String, dynamic> json) =>
    TrackResponse(
      (json['id'] as num?)?.toInt(),
      json['title'] as String?,
      json['preview'] as String?,
      json['album'] == null
          ? null
          : MusicAlbumResponse.fromJson(json['album'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TrackResponseToJson(TrackResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'preview': instance.preview,
      'album': instance.album,
    };
