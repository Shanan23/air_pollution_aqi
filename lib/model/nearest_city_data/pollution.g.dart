// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pollution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pollution _$PollutionFromJson(Map<String, dynamic> json) => Pollution(
      ts: json['ts'] == null ? null : DateTime.parse(json['ts'] as String),
      aqius: json['aqius'] as int?,
      mainus: json['mainus'] as String?,
      aqicn: json['aqicn'] as int?,
      maincn: json['maincn'] as String?,
    );

Map<String, dynamic> _$PollutionToJson(Pollution instance) => <String, dynamic>{
      'ts': instance.ts?.toIso8601String(),
      'aqius': instance.aqius,
      'mainus': instance.mainus,
      'aqicn': instance.aqicn,
      'maincn': instance.maincn,
    };
