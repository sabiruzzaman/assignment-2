import 'dart:convert';
import 'package:http/http.dart';
import '../models/news_model.dart';

class NewsRepository {
  String ednPoint = "https://newsapi.org/v2/top-headlines?country=us&apiKey=39a7657faa7f43d8bfa31229208147d0";

  Future<List<NewsModel>> getArticles() async {
    Response response = await get(Uri.parse(ednPoint));
    if ((response.statusCode == 200)) {
      final List result = jsonDecode(response.body)['articles'];
      return result.map((e) => NewsModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
