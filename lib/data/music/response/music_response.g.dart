// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusicResponse _$MusicResponseFromJson(Map<String, dynamic> json) =>
    MusicResponse(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      preview: json['preview'] as String?,
      rank: (json['rank'] as num?)?.toInt(),
      duration: (json['duration'] as num?)?.toInt(),
      explicitLyrics: json['explicit_lyrics'] as bool?,
      link: json['link'] as String?,
      album: json['album'] == null
          ? null
          : MusicAlbumResponse.fromJson(json['album'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MusicResponseToJson(MusicResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'preview': instance.preview,
      'rank': instance.rank,
      'duration': instance.duration,
      'explicit_lyrics': instance.explicitLyrics,
      'link': instance.link,
      'album': instance.album,
    };
