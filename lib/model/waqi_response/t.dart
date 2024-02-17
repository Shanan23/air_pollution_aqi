import 'package:json_annotation/json_annotation.dart';

part 't.g.dart';

@JsonSerializable()
class T {
  int? v;

  T({this.v});

  @override
  String toString() => 'T(v: $v)';

  factory T.fromJson(Map<String, dynamic> json) => _$TFromJson(json);

  Map<String, dynamic> toJson() => _$TToJson(this);
}
