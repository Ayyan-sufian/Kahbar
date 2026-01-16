part of 'articles_bloc.dart';

@immutable
abstract class ArticlesState {}

class ArticlesInitial extends ArticlesState {}

class ArticleLoading extends ArticlesState {}

class ArticleLoaded extends ArticlesState{
  final List<ArticleModel> articles;

  ArticleLoaded({required this.articles});

}

class ArticleError extends ArticlesState{
  final String? message;

  ArticleError({this.message});

}