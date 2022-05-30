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
    this.section,
    this.subsection,
    this.title,
    this.resultAbstract,
    this.url,
    this.uri,
    this.byline,
    this.itemType,
    this.updatedDate,
    this.createdDate,
    this.publishedDate,
    this.shortUrl,
  });

  String? section;
  String? subsection;
  String? title;
  String? resultAbstract;
  String? url;
  String? uri;
  String? byline;
  String? itemType;
  DateTime? updatedDate;
  DateTime? createdDate;
  DateTime? publishedDate;
  String? shortUrl;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        section: json["section"] == null ? null : json["section"],
        subsection: json["subsection"] == null ? null : json["subsection"],
        title: json["title"] == null ? null : json["title"],
        resultAbstract: json["abstract"] == null ? null : json["abstract"],
        url: json["url"] == null ? null : json["url"],
        uri: json["uri"] == null ? null : json["uri"],
        byline: json["byline"] == null ? null : json["byline"],
        itemType: json["item_type"] == null ? null : json["item_type"],
        updatedDate: json["updated_date"] == null
            ? null
            : DateTime?.parse(json["updated_date"]),
        createdDate: json["created_date"] == null
            ? null
            : DateTime?.parse(json["created_date"]),
        publishedDate: json["published_date"] == null
            ? null
            : DateTime?.parse(json["published_date"]),
        shortUrl: json["short_url"] == null ? null : json["short_url"],
      );
  Map<String, dynamic> toJson() => {
        "section": section == null ? null : section,
        "subsection": subsection == null ? null : subsection,
        "title": title == null ? null : title,
        "abstract": resultAbstract == null ? null : resultAbstract,
        "url": url == null ? null : url,
        "uri": uri == null ? null : uri,
        "byline": byline == null ? null : byline,
        "item_type": itemType == null ? null : itemType,
        "updated_date":
            updatedDate == null ? null : updatedDate?.toIso8601String(),
        "created_date":
            createdDate == null ? null : createdDate?.toIso8601String(),
        "published_date":
            publishedDate == null ? null : publishedDate?.toIso8601String(),
        "short_url": shortUrl == null ? null : shortUrl,
      };
}
