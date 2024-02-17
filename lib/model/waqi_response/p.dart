import 'package:json_annotation/json_annotation.dart';

part 'p.g.dart';

@JsonSerializable()
class P {
  int? v;

  P({this.v});

  @override
  String toString() => 'P(v: $v)';

  factory P.fromJson(Map<String, dynamic> json) => _$PFromJson(json);

  Map<String, dynamic> toJson() => _$PToJson(this);
}
