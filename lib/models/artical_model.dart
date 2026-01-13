class ArticleModel {
  final String id;
  final String name;
  final String title;
  final String description;
  final String urlToImage;
  final String url;
  final String author;
  final String content;
  final String publishedAt;
  bool isSelected;

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
    this.isSelected = false
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
      isSelected: false
    );
  }
}
