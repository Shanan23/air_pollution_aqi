import 'dart:convert';
import 'package:air_pollution_application/model/news_model.dart';
import 'package:http/http.dart' as http;

class NewsService {
  final String apiKey = '5b03a96327ca4656b9853b1e86477abf';
  final String baseUrl = 'https://newsapi.org/v2/everything';
  final String country = 'id'; // Replace with your country code

  NewsService();

  Future<List<NewsModel>> getPollutionNews() async {
    final Uri uri =
        Uri.parse('$baseUrl?q=polusi&searchIn=title,content&apiKey=$apiKey');
    // final Uri uri = Uri.parse('https://saurav.tech/NewsAPI/top-headlines/category/health/us.json');

    final response = await http.get(
      uri,
    );

    if (response.statusCode == 200) {
      print('Response getPollutionNews : ${response.body}');
      final Map<String, dynamic> data = json.decode(response.body);

      if (data['status'] == 'ok') {
        final List<dynamic> articles = data['articles'];
        return articles
            .map((article) => NewsModel(
                  title: article['title'],
                  description: article['description'],
                  url: article['url'],
                  imageUrl: article['urlToImage'],
                  publishedAt: article['publishedAt'],
                  content: article['content'],
                ))
            .toList();
      }
    }

    throw Exception('Failed to load pollution news');
  }
}
