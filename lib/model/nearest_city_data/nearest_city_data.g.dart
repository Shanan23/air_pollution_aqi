// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearest_city_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NearestCityData _$NearestCityDataFromJson(Map<String, dynamic> json) =>
    NearestCityData(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NearestCityDataToJson(NearestCityData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
