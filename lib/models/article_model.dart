// class Article {
//   Article({
//     this.status,
//     this.copyright,
//     this.section,
//     this.lastUpdated,
//     this.numResults,
//     this.results,
//   });
//
//   String? status;
//   String? copyright;
//   String? section;
//   DateTime? lastUpdated;
//   int? numResults;
//   List<Result>? results;
//
//   factory Article.fromJson(Map<String, dynamic> json) => Article(
//         status: json["status"] == null ? null : json["status"],
//         copyright: json["copyright"] == null ? null : json["copyright"],
//         section: json["section"] == null ? null : json["section"],
//         lastUpdated: json["last_updated"] == null
//             ? null
//             : DateTime?.parse(json["last_updated"]),
//         numResults: json["num_results"] == null ? null : json["num_results"],
//         results: json["results"] == null
//             ? null
//             : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
//       );
// }

class Article {
  Article({
    this.title,
    this.url,
    this.publishedDate,
  });

  String? title;
  String? url;
  DateTime? publishedDate;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        title: json["title"],
        url: json["url"] == null ? null : json["url"],
        publishedDate: json["published_date"] == null
            ? null
            : DateTime?.parse(json["published_date"]),
      );
  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "url": url == null ? null : url,
        "published_date":
            publishedDate == null ? null : publishedDate?.toIso8601String(),
      };
}
