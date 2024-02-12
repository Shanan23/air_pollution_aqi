import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'nearest_city_data.g.dart';

@JsonSerializable()
class NearestCityData {
  String? status;
  Data? data;

  NearestCityData({this.status, this.data});

  @override
  String toString() => 'NearestCityData(status: $status, data: $data)';

  factory NearestCityData.fromJson(Map<String, dynamic> json) {
    return _$NearestCityDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NearestCityDataToJson(this);
}
