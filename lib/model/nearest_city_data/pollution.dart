import 'package:json_annotation/json_annotation.dart';

part 'pollution.g.dart';

@JsonSerializable()
class Pollution {
  DateTime? ts;
  int? aqius;
  String? mainus;
  int? aqicn;
  String? maincn;

  Pollution({this.ts, this.aqius, this.mainus, this.aqicn, this.maincn});

  @override
  String toString() {
    return 'Pollution(ts: $ts, aqius: $aqius, mainus: $mainus, aqicn: $aqicn, maincn: $maincn)';
  }

  factory Pollution.fromJson(Map<String, dynamic> json) {
    return _$PollutionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PollutionToJson(this);
}
