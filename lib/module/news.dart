import 'package:air_pollution_application/controller/news_controller.dart';
import 'package:air_pollution_application/model/news_model.dart';
import 'package:air_pollution_application/router/route.dart';
import 'package:air_pollution_application/service/news_service.dart';
import 'package:air_pollution_application/widget/custom_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsScreen extends StatelessWidget {
  final NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                newsController.filterNews(value);
              },
              decoration: InputDecoration(
                labelText: 'Search News',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              return newsController.filteredNews.isNotEmpty
                  ? _buildNewsList(newsController.filteredNews)
                  : _buildNewsList(newsController.futureNews);
            }),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 2,
        onTap: (index) {
          handleNavigation(index);
        },
      ),
    );
  }

  void handleNavigation(int index) {
    // Handle navigation based on index
    switch (index) {
      case 0:
        Get.toNamed(RouteName.home);
        break;
      case 1:
        Get.toNamed(RouteName.maps);
        break;
      case 2:
        Get.toNamed(RouteName.news);
        break;
      case 3:
        Get.toNamed(RouteName.about);
        break;
    }
  }

  Widget _buildNewsList(List<NewsModel> newsList) {
    if (newsList.isEmpty) {
      return Center(child: Text('No news available.'));
    } else {
      return ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          NewsModel news = newsList[index];
          return Card(
            elevation: 2.0,
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: news.imageUrl != null
                        ? Image.network(
                            news.imageUrl!,
                            width: 200, // Adjust the width as needed
                            height: 200,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            (loadingProgress
                                                    .expectedTotalBytes ??
                                                1)
                                        : null,
                                  ),
                                );
                              }
                            }, // Adjust the height as needed
                          )
                        : Container(
                            // Placeholder or alternative content when imageUrl is null
                            width: 200,
                            height: 200,
                            color:
                                Colors.grey, // or any other placeholder content
                          ),
                  ),
                  Text(
                    news.title ?? 'null',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Published At: ${news.publishedAt ?? 'Unknown'}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    news.content ?? 'No content available.',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  GestureDetector(
                    onTap: () {
                      // Open the news article in a web browser or navigate to a WebView.
                      if (news.url != null) {
                        newsController.initialUrl.value = news.url!;
                        newsController.webViewNews(news.url!);
                        Get.toNamed(RouteName.newsd);
                      }
                    },
                    child: Text(
                      'Read more...',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }
}
