import 'package:json_annotation/json_annotation.dart';

part 'h.g.dart';

@JsonSerializable()
class H {
  int? v;

  H({this.v});

  @override
  String toString() => 'H(v: $v)';

  factory H.fromJson(Map<String, dynamic> json) => _$HFromJson(json);

  Map<String, dynamic> toJson() => _$HToJson(this);
}
