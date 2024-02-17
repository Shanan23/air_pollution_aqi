import 'package:json_annotation/json_annotation.dart';

part 'pm10.g.dart';

@JsonSerializable()
class Pm10 {
  double? avg;
  String? day;
  double? max;
  double? min;

  Pm10({this.avg,this.day,this.max,this.min});

  @override
  String toString() => 'Pm10(avg: $avg, day: $day, max: $max, min: $min,)';

  factory Pm10.fromJson(Map<String, dynamic> json) => _$Pm10FromJson(json);

  Map<String, dynamic> toJson() => _$Pm10ToJson(this);
}
