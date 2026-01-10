class NewsModel {
  final String id;
  final String name;
  final String description;
  final String url;
  final String category;
  final String language;
  final String country;
  bool isSelected;

  NewsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
    required this.language,
    required this.country,
     this.isSelected = false,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'] ?? "",
      name: json['name'] ??'',
      description: json['description']??'',
      url: json['url'] ??'',
      category: json['category'] ??'',
      language: json['language'] ??'',
      country: json['country'] ??'',
    );
  }
}
