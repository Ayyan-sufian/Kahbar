import 'package:dio/dio.dart';
import 'package:kabar/helpers/constants.dart';
import 'package:kabar/services/news_api.dart';

class NewsApiService {
  final Dio _dio = NewsApi().dio;
  static const String apiKey = Endpoints.apiKey;

  Future<Response> getNews() async {
    try {
      return await _dio.get(
        Endpoints.getNewsApiPath,
        queryParameters: {'apiKey': apiKey},
      );
    } on DioException catch (e) {
      throw Exception(_handleError(e));
    }
  }

  Future<Response> getArticles(Map<String,dynamic> query,String path) async {
    try {
     return _dio.get(
        path,
        queryParameters: query
      );
    } on DioException catch (e) {
      throw Exception(_handleError(e));
    }
  }

  String _handleError(DioException e) {
    if (e.response != null) {
      return e.response?.data.toString() ?? 'Server error';
    }
    return e.message ?? 'Unknown error';
  }
}
