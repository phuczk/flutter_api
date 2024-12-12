// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_album_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusicAlbumResponse _$MusicAlbumResponseFromJson(Map<String, dynamic> json) =>
    MusicAlbumResponse(
      (json['id'] as num?)?.toInt(),
      json['title'] as String?,
      json['cover'] as String?,
    );

Map<String, dynamic> _$MusicAlbumResponseToJson(MusicAlbumResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'cover': instance.cover,
    };
