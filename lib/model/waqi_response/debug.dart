import 'package:json_annotation/json_annotation.dart';

part 'debug.g.dart';

@JsonSerializable()
class Debug {
  String? sync;

  Debug({this.sync});

  @override
  String toString() => 'Debug(sync: $sync)';

  factory Debug.fromJson(Map<String, dynamic> json) => _$DebugFromJson(json);

  Map<String, dynamic> toJson() => _$DebugToJson(this);
}
