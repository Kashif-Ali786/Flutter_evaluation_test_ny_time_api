import 'package:connection_verify/connection_verify.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:newyork_times_assessment/controllers/article_list_controller.dart';
import 'package:newyork_times_assessment/models/article_model.dart';
import 'package:newyork_times_assessment/services/api_service.dart';

class MockAPIService extends Mock implements APIService {}

void main() {
  late ArticleController sut;
  late MockAPIService mockAPIService;

  setUp(() {
    mockAPIService = MockAPIService();
    sut = ArticleController(mockAPIService);
  });

  test(
    "initial values are correct",
    () {
      expect(sut.articles, []);
      expect(sut.showProgress, false);
    },
  );

  group('getArticles', () {
    final articlesFromService = [
      Article(title: 'Article 1', publishedDate: DateTime.now()),
      Article(title: 'Article 2', publishedDate: DateTime.now()),
      Article(title: 'Article 3', publishedDate: DateTime.now()),
    ];

    void arrangeAPIServiceReturns3Articles() {
      when(() => mockAPIService.fetchMostPopularArticles("viewed")).thenAnswer(
        (_) async => articlesFromService,
      );
    }

    test(
      "gets popular articles using the APIService",
      () async {
        arrangeAPIServiceReturns3Articles();
        await sut.getArticles(category: "viewed");
        if (await ConnectionVerify.connectionStatus()) {
          verify(() => mockAPIService.fetchMostPopularArticles("viewed"))
              .called(1);
        }
      },
    );

    test(
      """indicates loading of data,
      sets articles to the ones from the service,
      indicates that data is not being loaded anymore""",
      () async {
        arrangeAPIServiceReturns3Articles();
        final future = sut.getArticles(category: "viewed");
        expect(sut.showProgress, true);
        await future;
        expect(sut.articles, articlesFromService);
        expect(sut.showProgress, false);
      },
    );
  });
}
