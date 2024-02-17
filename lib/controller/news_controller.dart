import 'dart:ui';

import 'package:air_pollution_application/model/news_model.dart';
import 'package:air_pollution_application/service/news_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

class NewsController extends GetxController {
  final NewsService newsService = NewsService();
  RxList<NewsModel> futureNews = <NewsModel>[].obs;
  RxList<NewsModel> filteredNews = <NewsModel>[].obs;
  RxString initialUrl = 'https://example.com'.obs;
  Rx<WebViewController> wvController = WebViewController().obs;

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

  void webViewNews(String url) {
    late final PlatformWebViewControllerCreationParams params;

    params = const PlatformWebViewControllerCreationParams();

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
          onUrlChange: (UrlChange change) {
            debugPrint('url change to ${change.url}');
          },
        ),
      )
      ..loadRequest(Uri.parse(url));

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    wvController.value = controller;
  }
}
