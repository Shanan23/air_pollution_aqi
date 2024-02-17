import 'package:json_annotation/json_annotation.dart';

part 'o3.g.dart';

@JsonSerializable()
class O3 {
  double? avg;
  String? day;
  double? max;
  double? min;

  O3({this.avg, this.day, this.max, this.min});

  @override
  String toString() => 'O3(avg: $avg, day: $day, max: $max, min: $min)';

  factory O3.fromJson(Map<String, dynamic> json) => _$O3FromJson(json);

  Map<String, dynamic> toJson() => _$O3ToJson(this);
}
