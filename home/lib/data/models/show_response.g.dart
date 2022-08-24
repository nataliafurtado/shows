// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowResponse _$ShowResponseFromJson(Map<String, dynamic> json) => ShowResponse(
      id: json['id'] as int?,
      url: json['url'] as String?,
      name: json['name'] as String?,
      image: json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShowResponseToJson(ShowResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'image': instance.image,
    };
