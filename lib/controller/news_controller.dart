import 'package:air_pollution_application/model/news_model.dart';
import 'package:air_pollution_application/service/news_service.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {
  final NewsService newsService = NewsService();
  RxList<NewsModel> futureNews = <NewsModel>[].obs;
  RxList<NewsModel> filteredNews = <NewsModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadNewsData();
  }

  Future<void> _loadNewsData() async {
    try {
      List<NewsModel> newsData = await newsService.getPollutionNews();
      futureNews.assignAll(newsData);
    } catch (error) {
      print('Error fetching news data: $error');
    }
  }

  void filterNews(String query) {
    filteredNews.assignAll(futureNews
        .where(
            (news) => news.title!.toLowerCase().contains(query.toLowerCase()))
        .toList());
  }
}
