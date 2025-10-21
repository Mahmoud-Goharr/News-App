class ArticleModel {
  final String? image;
  final String title;
  final String? subTitle;
  final String url;

  ArticleModel(
      {required this.image,
      required this.title,
      required this.subTitle,
      required this.url});

  factory ArticleModel.fromjosn(josn) {
    return ArticleModel(
        image: josn['image'],
        title: josn['title'],
        subTitle: josn['description'],
        url: josn['url']);
  }
}
