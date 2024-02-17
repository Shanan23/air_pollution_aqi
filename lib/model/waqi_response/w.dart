import 'package:json_annotation/json_annotation.dart';

part 'w.g.dart';

@JsonSerializable()
class W {
  double? v;

  W({this.v});

  @override
  String toString() => 'W(v: $v)';

  factory W.fromJson(Map<String, dynamic> json) => _$WFromJson(json);

  Map<String, dynamic> toJson() => _$WToJson(this);
}
