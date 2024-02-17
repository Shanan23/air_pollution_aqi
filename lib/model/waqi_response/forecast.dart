import 'package:json_annotation/json_annotation.dart';

import 'daily.dart';

part 'forecast.g.dart';

@JsonSerializable()
class Forecast {
  Daily? daily;

  Forecast({this.daily});

  @override
  String toString() => 'Forecast(daily: $daily)';

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return _$ForecastFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}
