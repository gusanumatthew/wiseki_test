// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    required this.status,
    required this.totalResults,
    required this.results,
    required this.nextPage,
  });

  String status;
  int totalResults;
  List<Result> results;
  String nextPage;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json["status"],
        totalResults: json["totalResults"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        nextPage: json["nextPage"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "nextPage": nextPage,
      };
}

class Result {
  Result({
    required this.title,
    required this.link,
    this.keywords,
    this.creator,
    this.videoUrl,
    required this.description,
    required this.content,
    required this.pubDate,
    this.imageUrl,
    required this.sourceId,
    // required this.category,
    //required this.country,
    required this.language,
  });

  String title;
  String link;
  List<String>? keywords;
  List<String>? creator;
  dynamic videoUrl;
  String description;
  String content;
  DateTime pubDate;
  String? imageUrl;
  String sourceId;
  // List<Category> category;
  // List<Country> country;
  Language language;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json["title"],
        link: json["link"],
        keywords: json["keywords"] == null
            ? []
            : List<String>.from(json["keywords"]!.map((x) => x)),
        creator: json["creator"] == null
            ? []
            : List<String>.from(json["creator"]!.map((x) => x)),
        videoUrl: json["video_url"],
        description: json["description"],
        content: json["content"],
        pubDate: DateTime.parse(json["pubDate"]),
        imageUrl: json["image_url"],
        sourceId: json["source_id"],
        // category: json["category"] !=null ?
        //     List<Category>.from(
        //         json["category"].map((x) => categoryValues.map[x]!)),
        // country: List<Country>.from(
        //  json["country"].map((x) => countryValues.map[x]!)),
        language: languageValues.map[json["language"]]!,
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "link": link,
        "keywords":
            keywords == null ? [] : List<dynamic>.from(keywords!.map((x) => x)),
        "creator":
            creator == null ? [] : List<dynamic>.from(creator!.map((x) => x)),
        "video_url": videoUrl,
        "description": description,
        "content": content,
        "pubDate": pubDate.toIso8601String(),
        "image_url": imageUrl,
        "source_id": sourceId,
        // "category":
        //     List<dynamic>.from(category.map((x) => categoryValues.reverse[x])),
        // "country":
        //    List<dynamic>.from(country.map((x) => countryValues.reverse[x])),
        "language": languageValues.reverse[language],
      };
}

enum Category { TOP, WORLD }

final categoryValues =
    EnumValues({"top": Category.TOP, "world": Category.WORLD});

enum Country { UNITED_STATES_OF_AMERICA }

final countryValues =
    EnumValues({"united states of america": Country.UNITED_STATES_OF_AMERICA});

enum Language { ENGLISH }

final languageValues = EnumValues({"english": Language.ENGLISH});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
