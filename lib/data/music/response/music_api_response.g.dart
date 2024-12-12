// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusicApiResponse _$MusicApiResponseFromJson(Map<String, dynamic> json) =>
    MusicApiResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => MusicResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
      next: json['next'] as String?,
    );

Map<String, dynamic> _$MusicApiResponseToJson(MusicApiResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
      'next': instance.next,
    };
