// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Daily _$DailyFromJson(Map<String, dynamic> json) => Daily(
      o3: (json['o3'] as List<dynamic>?)
          ?.map((e) => O3.fromJson(e as Map<String, dynamic>))
          .toList(),
      pm10: (json['pm10'] as List<dynamic>?)
          ?.map((e) => Pm10.fromJson(e as Map<String, dynamic>))
          .toList(),
      pm25: (json['pm25'] as List<dynamic>?)
          ?.map((e) => Pm25.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DailyToJson(Daily instance) => <String, dynamic>{
      'o3': instance.o3,
      'pm10': instance.pm10,
      'pm25': instance.pm25,
    };
