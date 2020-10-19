class News {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  static movieFromJson(Map<String, dynamic> map) {
    News news = News();
    news.author = map['author'];
    news.title = map['title'];
    news.description = map['description'];
    news.url = map['url'];
    news.urlToImage = map['urlToImage'];
    news.publishedAt = map['publishedAt'];
    news.content = map['content'];
  }
}
