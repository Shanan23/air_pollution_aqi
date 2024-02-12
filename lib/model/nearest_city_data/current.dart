import 'package:json_annotation/json_annotation.dart';

import 'pollution.dart';
import 'weather.dart';

part 'current.g.dart';

@JsonSerializable()
class Current {
  Pollution? pollution;
  Weather? weather;

  Current({this.pollution, this.weather});

  @override
  String toString() => 'Current(pollution: $pollution, weather: $weather)';

  factory Current.fromJson(Map<String, dynamic> json) {
    return _$CurrentFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}
