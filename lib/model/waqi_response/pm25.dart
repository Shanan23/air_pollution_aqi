import 'package:json_annotation/json_annotation.dart';

part 'pm25.g.dart';

@JsonSerializable()
class Pm25 {
  double? avg;
  String? day;
  double? max;
  double? min;

  Pm25({this.avg, this.day, this.max, this.min});

  @override
  String toString() => 'Pm25(avg: $avg, day: $day, max: $max, min: $min)';

  factory Pm25.fromJson(Map<String, dynamic> json) => _$Pm25FromJson(json);

  Map<String, dynamic> toJson() => _$Pm25ToJson(this);
}
