import 'package:json_annotation/json_annotation.dart';

import 'attribution.dart';
import 'city.dart';
import 'debug.dart';
import 'forecast.dart';
import 'time.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  int? aqi;
  int? idx;
  List<Attribution>? attributions;
  City? city;
  String? dominentpol;
  Time? time;
  Forecast? forecast;
  Debug? debug;

  Data({
    this.aqi,
    this.idx,
    this.attributions,
    this.city,
    this.dominentpol,
    this.time,
    this.forecast,
    this.debug,
  });

  @override
  String toString() {
    return 'Data(aqi: $aqi, idx: $idx, attributions: $attributions, city: $city, dominentpol: $dominentpol, time: $time, forecast: $forecast, debug: $debug)';
  }

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
