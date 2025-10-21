import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsServices {
  final Dio dio;

  NewsServices(this.dio);

  Future<List<ArticleModel>> getNews({required String catagory}) async {
    try {
      Response response = await dio.get(
          'https://gnews.io/api/v4/top-headlines?category=$catagory&lang=ar&country=eg&max=10&apikey=3a6b2d4546b947eb6ecd1c7692836470');
      Map<String, dynamic> josnData = response.data;
      List<dynamic> articles = josnData['articles'];
      List<ArticleModel> articlesModel = [];
      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromjosn(article);
        articlesModel.add(articleModel);
      }
      return articlesModel;
    } catch (e) {
      return [];
    }
  }
}
