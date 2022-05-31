import 'package:connection_verify/connection_verify.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newyork_times_assessment/models/article_model.dart';
import 'package:newyork_times_assessment/services/api_service.dart';
import 'package:newyork_times_assessment/utils/view_utils.dart';

class ArticleController extends GetxController {
  final APIService _apiService;
  ArticleController(this._apiService);
  final Rx<bool> _showProgress = false.obs;
  bool get showProgress => _showProgress.value;
  final Rx<bool> _showMoreLoadingProgress = false.obs;
  bool get showMoreLoadingProgress => _showMoreLoadingProgress.value;

  final Rx<bool> _isMoreDataAvailable = true.obs;
  bool get isMoreDataAvailable => _isMoreDataAvailable.value;

  final RxInt _page = 1.obs;
  int get page => _page.value;

  final RxList<Article> _articles = <Article>[].obs;
  List<Article> get articles => _articles.toList();

  Future<void> getArticles({String? query, category}) async {
    List<Article>? articles;
    _showProgress.value = true;

    try {
      if (await ConnectionVerify.connectionStatus()) {
        if (query != null) {
          articles = await _apiService.search(query, page);
        } else {
          articles = await _apiService.fetchMostPopularArticles(category!);
        }
        _articles.value = articles!;
        await GetStorage().write("article", _articles.value);
      } else {
        showSnackbar(
            "Device is offline. Please check your internet connection and try again later!");
        var localArticle = await GetStorage().read("article") as List<Article>;
        _articles.value = localArticle;
      }
    } catch (error) {
      showSnackbar(error.toString());
    } finally {
      _showProgress.value = false;
    }
  }

  void loadMoreArticles(query) async {
    try {
      if (query != null) {
        _page.value++;
        _showMoreLoadingProgress.value = true;
        var res = await _apiService.search(query!, _page.value);
        if (res!.length < 10) {
          _isMoreDataAvailable.value = false;
        }
        _articles.addAll(res);
        _articles.refresh();
      }
    } catch (e) {
      showSnackbar(e.toString());
    } finally {
      _showMoreLoadingProgress.value = false;
    }
  }
}
