import 'package:dio/dio.dart';
import 'package:kabar/helpers/constants.dart';
import 'package:kabar/helpers/news_interceptor.dart';

class NewsApi {
  static final NewsApi _instance = NewsApi._internal();
  late final Dio dio;

  factory NewsApi() {
    return _instance;
  }

  NewsApi._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: Endpoints.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.add(NewsInterceptor());
  }
}