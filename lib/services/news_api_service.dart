import 'package:dio/dio.dart';
import 'package:kabar/services/news_api.dart';

class NewsApiService {
  final NewsApi _newsApi = NewsApi();
  static const String apiKey = 'c440e5e558544b739cf4f6546604c475';

  Future<Response> getNews() async {
    try {
      final response = await _newsApi.dio.get(
        '/top-headlines/sources',
        queryParameters: {'apiKey': apiKey},
      );
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? e.message);
    }
  }

  Future<Response> getArticles() async {
    try {
      final response = await _newsApi.dio.get(
        '/top-headlines',
        queryParameters: {
          'country': 'us',
          'apiKey': apiKey,
        },
      );
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? e.message);
    }
  }
}
