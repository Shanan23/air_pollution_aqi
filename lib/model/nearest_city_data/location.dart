import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class Location {
  String? type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  @override
  String toString() => 'Location(type: $type, coordinates: $coordinates)';

  factory Location.fromJson(Map<String, dynamic> json) {
    return _$LocationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
