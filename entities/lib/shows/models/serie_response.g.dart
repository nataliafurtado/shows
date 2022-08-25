// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SerieResponse _$SerieResponseFromJson(Map<String, dynamic> json) =>
    SerieResponse(
      id: json['id'] as int,
      url: json['url'] as String?,
      name: json['name'] as String?,
      image: json['image'] == null
          ? null
          : ImageResponse.fromJson(json['image'] as Map<String, dynamic>),
      summary: json['summary'] as String?,
    );

Map<String, dynamic> _$SerieResponseToJson(SerieResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'image': instance.image,
      'summary': instance.summary,
    };
