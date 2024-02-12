import 'dart:convert';
import 'package:air_pollution_application/model/nearest_city_data/nearest_city_data.dart';
import 'package:air_pollution_application/model/news_model.dart';
import 'package:http/http.dart' as http;

class AqiService {
  final String apiKey = '669f2f70-3a41-4a4a-b382-6a96c3f6cd06';
  final String baseUrl = 'http://api.airvisual.com/v2/nearest_city';
  final String country = 'id'; // Replace with your country code

  Future<NearestCityData> getAqiNearest(String lat, String long) async {
    final Uri uri = Uri.parse('$baseUrl?lat=$lat&lon=$long&key=$apiKey');
    print('Request getAqiNearest : ${uri.query}');

    final response = await http.get(
      uri,
    );

    if (response.statusCode == 200) {
      print('Response getAqiNearest : ${response.body}');
      final Map<String, dynamic> data = json.decode(response.body);
      return NearestCityData.fromJson(data);
    }

    throw Exception('Failed to load aqi data');
  }
}
