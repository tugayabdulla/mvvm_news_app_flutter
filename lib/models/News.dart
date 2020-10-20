class News {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  static newsFromJson(dynamic article) {
    News news = News();
    news.author = article['author'];
    news.title = article['title'];
    news.description = article['description'];
    news.url = article['url'];
    news.urlToImage = article['urlToImage'];
    news.publishedAt = article['publishedAt'];
    news.content = article['content'];
    return news;
  }
}
