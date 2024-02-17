// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pm25.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pm25 _$Pm25FromJson(Map<String, dynamic> json) => Pm25(
      avg: (json['avg'] as num?)?.toDouble(),
      day: json['day'] as String?,
      max: (json['max'] as num?)?.toDouble(),
      min: (json['min'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$Pm25ToJson(Pm25 instance) => <String, dynamic>{
      'avg': instance.avg,
      'day': instance.day,
      'max': instance.max,
      'min': instance.min,
    };
