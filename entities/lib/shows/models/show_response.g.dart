// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowResponse _$ShowResponseFromJson(Map<String, dynamic> json) => ShowResponse(
      id: json['id'] as int,
      url: json['url'] as String?,
      name: json['name'] as String?,
      image: json['image'] == null
          ? null
          : ImageResponse.fromJson(json['image'] as Map<String, dynamic>),
      summary: json['summary'] as String?,
      schedule:
          ScheduleResponse.fromJson(json['schedule'] as Map<String, dynamic>),
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      type: json['type'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$ShowResponseToJson(ShowResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'image': instance.image,
      'summary': instance.summary,
      'schedule': instance.schedule,
      'genres': instance.genres,
      'type': instance.type,
      'status': instance.status,
    };
