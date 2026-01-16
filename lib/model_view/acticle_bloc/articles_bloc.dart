import 'package:bloc/bloc.dart';
import 'package:kabar/models/artical_model.dart';
import 'package:meta/meta.dart';

import '../../helpers/constants.dart';
import '../../services/news_api_service.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  ArticlesBloc() : super(ArticlesInitial()) {
    on<FetchArticlesEvent>(_fetchArticles);
  }

  Future<void> _fetchArticles(
      FetchArticlesEvent event,
      Emitter<ArticlesState> emit,
      ) async {
    try {

      final query = {
        'country': 'us',
        'apiKey': Endpoints.apiKey,
      };

      final response = await NewsApiService()
          .getArticles(query, Endpoints.articleApiPath);

      final List articlesList = response.data['articles'];

      final articles = articlesList
          .map((json) => ArticleModel.fromJson(json))
          .toList();

      emit(ArticleLoaded(articles: articles));
    } catch (e) {
      print(e);
    }
  }
}
