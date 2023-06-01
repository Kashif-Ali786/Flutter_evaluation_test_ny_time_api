import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:newyork_times_assessment/models/article_model.dart';
import 'package:newyork_times_assessment/screens/article_list_page.dart';
import 'package:newyork_times_assessment/screens/home_page.dart';
import 'package:newyork_times_assessment/services/api_service.dart';

class MockAPIService extends Mock implements APIService {}

void main() {
  // late MockAPIService mockAPIService;
  //
  // setUp(() {
  //   mockAPIService = MockAPIService();
  // });
  //
  // final articlesFromService = [
  //   Article(title: 'Test 1', publishedDate: DateTime.now()),
  //   Article(title: 'Test 2', publishedDate: DateTime.now()),
  //   Article(title: 'Test 3', publishedDate: DateTime.now()),
  // ];
  //
  // void arrangeAPIServiceReturns3Articles() {
  //   when(() => mockAPIService.fetchMostPopularArticles("viewed")).thenAnswer(
  //     (_) async => articlesFromService,
  //   );
  // }

  Widget createWidgetUnderTest() {
    return GetMaterialApp(
        title: 'NYTimes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          iconTheme: const IconThemeData(color: Colors.black),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            elevation: .5,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            centerTitle: true,
          ),
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
        builder: (ctx, widget) {
          return MediaQuery(
              data: MediaQuery.of(ctx).copyWith(textScaleFactor: 1.0),
              child: widget!);
        });
  }

  testWidgets(
    "title and article categories are displayed",
    (WidgetTester tester) async {
      // arrangeAPIServiceReturns3Articles();
      await tester.pumpWidget(createWidgetUnderTest());
      expect(find.text('NYT'), findsOneWidget);
      expect(find.text('Most Viewed'), findsOneWidget);
      expect(find.text('Most Viewed'), findsOneWidget);
      expect(find.text('Most Shared'), findsOneWidget);
      expect(find.text('Most Emailed'), findsOneWidget);
    },
  );
}
