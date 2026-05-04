import 'package:dio/dio.dart';
import 'package:kabar/helpers/constants.dart';

class NewsInterceptor extends Interceptor{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    options.queryParameters['apiKey'] = Endpoints.apiKey;

    print('🚀 REQUEST: ${options.method} → ${options.uri}');
    print('🚀 REQUEST: ${options.headers} → ${options.uri}');

    handler.next(options);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {

    print('✅ RESPONSE [${response.statusCode}]: ${response.requestOptions.path}');

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {

    switch (err.response?.statusCode) {
      case 401:
        print('🔒 Invalid API Key!');
        break;
      case 429:
        print('⛔ Too many requests! Rate limit hit.');
        break;
      case 500:
        print('💥 News server error!');
        break;
      default:
        print('⚠️ Error: ${err.message}');
    }

    handler.next(err);
  }
}