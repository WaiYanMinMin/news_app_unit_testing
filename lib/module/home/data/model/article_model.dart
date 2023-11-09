class Article {
  String? title;
  String? author;
  String? description;
  String? urlToImage;
  String? publishedAt;
  String? content;
  String? articleUrl;

  Article(
      {this.title,
      this.description,
      this.author,
      this.content,
      this.publishedAt,
      this.urlToImage,
      this.articleUrl});

  fromJson(List<dynamic> jsonList) {
    List<Article> articles = [];
    for (var jsonData in jsonList) {
      articles.add(Article(
        title: jsonData['title'],
        description: jsonData['description'],
        content: jsonData['content'],
        author: jsonData['author'],
        publishedAt: jsonData['publishedAt'],
        urlToImage: jsonData['urlToImage'],
        articleUrl: jsonData['url'],
      ));
    }
    return articles;
  }
}
