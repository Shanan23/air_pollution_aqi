import 'package:json_annotation/json_annotation.dart';

import 'o3.dart';
import 'pm10.dart';
import 'pm25.dart';

part 'daily.g.dart';

@JsonSerializable()
class Daily {
  List<O3>? o3;
  List<Pm10>? pm10;
  List<Pm25>? pm25;

  Daily({this.o3, this.pm10, this.pm25});

  @override
  String toString() => 'Daily(o3: $o3, pm10: $pm10, pm25: $pm25)';

  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);

  Map<String, dynamic> toJson() => _$DailyToJson(this);
}
