import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newyork_times_assessment/models/article_model.dart';

class APIService {
  final String _baseUrl = 'api.nytimes.com';
  static const String API_KEY = 'kAs7gCtSVjvLNlIrXLXdC2wvgCvXZpVf';
  static const String PERIOD = '30'; //(1 day, 7 days, or 30 days).
  // static const String secret = 'ELfd9NZr35SaoCai';

  Future<List<Article>> fetchMostPopularArticles(String cat) async {
    Map<String, String> parameters = {'api-key': API_KEY};
    var endpoint =
        cat.contains("shared") ? "$cat/$PERIOD/facebook.json" : "$cat/$PERIOD.json";
    var url = '/svc/mostpopular/v2/$endpoint';
    Uri uri = Uri.https(_baseUrl, url, parameters);
    try {
      var response = await http.get(uri);
      Map<String, dynamic> data = json.decode(response.body);

      List<Article> _list = [];
      data["results"].forEach(
        (res) => _list.add(Article.fromJson(res)),
      );

      return _list;
    } catch (err) {
      throw err.toString();
    }
  }

  Future<List<Article>?> search(String query, int page) async {
    Map<String, String> parameters = {
      'api-key': API_KEY,
      'q': query,
      "page": page.toString()
    };
    Uri uri =
        Uri.https(_baseUrl, "/svc/search/v2/articlesearch.json", parameters);
    try {
      var response = await http.get(uri);
      Map<String, dynamic> data = json.decode(response.body);

      List<Article> _list = [];
      data["response"]["docs"].forEach(
        (doc) => _list.add(Article(
            title: doc["abstract"] ?? "",
            publishedDate: DateTime.parse(doc["pub_date"]))),
      );

      return _list;
    } catch (err) {
      throw err.toString();
    }
  }
}
