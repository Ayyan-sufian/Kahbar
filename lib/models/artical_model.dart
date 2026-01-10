class ArticleModel {
  final String id;           // unique id for the article or source
  final String name;         // source name
  final String title;
  final String description;
  final String urlToImage;
  final String url;
  final String author;
  final String content;
  final String publishedAt;

  ArticleModel({
    required this.id,
    required this.name,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.url,
    required this.author,
    required this.content,
    required this.publishedAt,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['source'] != null ? (json['source']['id'] ?? '') : '',
      name: json['source'] != null ? (json['source']['name'] ?? '') : '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      url: json['url'] ?? '',
      author: json['author'] ?? '',
      content: json['content'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
    );
  }
}
