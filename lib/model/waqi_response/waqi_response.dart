import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'waqi_response.g.dart';

@JsonSerializable()
class WaqiResponse {
  String? status;
  Data? data;

  WaqiResponse({this.status, this.data});

  @override
  String toString() => 'WaqiResponse(status: $status, data: $data)';

  factory WaqiResponse.fromJson(Map<String, dynamic> json) {
    return _$WaqiResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WaqiResponseToJson(this);
}
