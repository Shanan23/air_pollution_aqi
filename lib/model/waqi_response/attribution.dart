import 'package:json_annotation/json_annotation.dart';

part 'attribution.g.dart';

@JsonSerializable()
class Attribution {
  String? url;
  String? name;
  String? logo;

  Attribution({this.url, this.name, this.logo});

  @override
  String toString() => 'Attribution(url: $url, name: $name, logo: $logo)';

  factory Attribution.fromJson(Map<String, dynamic> json) {
    return _$AttributionFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AttributionToJson(this);
}
