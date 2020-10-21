class News {
  static var TABLE_NAME = 'news';


  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  News(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  factory News.newsFromJson(dynamic article) => News(
        author: article['author'],
        title: article['title'],
        description: article['description'],
        url: article['url'],
        urlToImage: article['urlToImage'],
        publishedAt: article['publishedAt'],
        content: article['content'],
      );

  Map<String, dynamic> toMap() => {
        'author': this.author,
        'title': this.title,
        'description': this.description,
        'url': this.url,
        'urlToImage': this.urlToImage,
        'publishedAt': this.publishedAt,
        'content': this.content,
      };
}
