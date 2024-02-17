import 'package:json_annotation/json_annotation.dart';

part 'dew.g.dart';

@JsonSerializable()
class Dew {
  int? v;

  Dew({this.v});

  @override
  String toString() => 'Dew(v: $v)';

  factory Dew.fromJson(Map<String, dynamic> json) => _$DewFromJson(json);

  Map<String, dynamic> toJson() => _$DewToJson(this);
}
