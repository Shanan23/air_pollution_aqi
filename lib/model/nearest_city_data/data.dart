import 'package:json_annotation/json_annotation.dart';

import 'current.dart';
import 'location.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? city;
  String? state;
  String? country;
  Location? location;
  Current? current;

  Data({this.city, this.state, this.country, this.location, this.current});

  @override
  String toString() {
    return 'Data(city: $city, state: $state, country: $country, location: $location, current: $current)';
  }

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
