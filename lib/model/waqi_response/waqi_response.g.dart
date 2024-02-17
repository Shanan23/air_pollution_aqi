// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waqi_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WaqiResponse _$WaqiResponseFromJson(Map<String, dynamic> json) => WaqiResponse(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WaqiResponseToJson(WaqiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
