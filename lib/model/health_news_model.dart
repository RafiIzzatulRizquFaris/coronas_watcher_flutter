class HealthNewsModel {
  final String status;
  final int totalResults;
  final List<Article> article;

  HealthNewsModel({this.status, this.totalResults, this.article});

  factory HealthNewsModel.mapping(Map<String, dynamic> obj) {
    return HealthNewsModel(
        status: obj['status'],
        article:
            (obj['articles'] as List).map((e) => Article.mapping(e)).toList(),
        totalResults: obj['totalResults']);
  }
}

class Article {
  final String author;
  final String content;
  final String description;
  final String publishedAt;
  final Source source;
  final String title;
  final String url;
  final String urlToImage;

  Article(
      {this.author,
      this.content,
      this.description,
      this.publishedAt,
      this.source,
      this.title,
      this.url,
      this.urlToImage});

  factory Article.mapping(Map<String, dynamic> obj) {
    return Article(
        author: obj['author'],
        content: obj['content'],
        description: obj['description'],
        publishedAt: obj['publishedAt'],
        source: Source.mapping(obj['source']),
        title: obj['title'],
        url: obj['url'],
        urlToImage: obj['urlToImage']);
  }
}

class Source {
  final String id;
  final String name;

  Source({this.id, this.name});

  factory Source.mapping(Map<String, dynamic> obj) {
    return Source(id: obj['id'], name: obj['name']);
  }
}
