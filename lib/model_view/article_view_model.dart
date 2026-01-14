import 'package:flutter/cupertino.dart';
import 'package:kabar/helpers/constants.dart';
import 'package:kabar/models/artical_model.dart';
import 'package:kabar/services/news_api_service.dart';

class ArticleViewModel extends ChangeNotifier{
  List<ArticleModel> _articles = [];
  bool _isLoading = false;

  List<ArticleModel> get articles => _articles;
  bool get isLoading => _isLoading;


  Future<void> fetchArticles() async {
    try {
      _isLoading = true;
      notifyListeners();

      final Map<String, dynamic> query = {
        'country': 'us',
        'apiKey': Endpoints.apiKey,
      };
      final response = await NewsApiService().getArticles(query, Endpoints.articleApiPath);
      final List articlesList = response.data['articles'];

      _articles =
          articlesList.map((json) => ArticleModel.fromJson(json)).toList();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      debugPrint("Error fetching articles: $e");
    }
  }
}