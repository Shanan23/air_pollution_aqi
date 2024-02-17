// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pm10.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pm10 _$Pm10FromJson(Map<String, dynamic> json) => Pm10(
      avg: (json['avg'] as num?)?.toDouble(),
      day: json['day'] as String?,
      max: (json['max'] as num?)?.toDouble(),
      min: (json['min'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$Pm10ToJson(Pm10 instance) => <String, dynamic>{
      'avg': instance.avg,
      'day': instance.day,
      'max': instance.max,
      'min': instance.min,
    };
