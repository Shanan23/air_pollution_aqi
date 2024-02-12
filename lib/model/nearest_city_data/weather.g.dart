// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      ts: json['ts'] == null ? null : DateTime.parse(json['ts'] as String),
      tp: json['tp'] as int?,
      pr: json['pr'] as int?,
      hu: json['hu'] as int?,
      ws: (json['ws'] as num?)?.toDouble(),
      wd: json['wd'] as int?,
      ic: json['ic'] as String?,
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'ts': instance.ts?.toIso8601String(),
      'tp': instance.tp,
      'pr': instance.pr,
      'hu': instance.hu,
      'ws': instance.ws,
      'wd': instance.wd,
      'ic': instance.ic,
    };
