// To parse this JSON data, do
//
//     final newsResponse = newsResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'news_response.freezed.dart';
part 'news_response.g.dart';

NewsResponse newsResponseFromJson(String str) => NewsResponse.fromJson(json.decode(str));

String newsResponseToJson(NewsResponse data) => json.encode(data.toJson());

@freezed
class NewsResponse with _$NewsResponse {
    const factory NewsResponse({
        String? status,
        int? totalResults,
        List<dynamic>? articles,
    }) = _NewsResponse;

    factory NewsResponse.fromJson(Map<String, dynamic> json) => _$NewsResponseFromJson(json);
}

@freezed
class Article with _$Article {
    const factory Article({
        Source? source,
        String? author,
        String? title,
        String? description,
        String? url,
        String? urlToImage,
        DateTime? publishedAt,
        String? content,
    }) = _Article;

    factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
}

@freezed
class Source with _$Source {
    const factory Source({
        String? id,
        String? name,
    }) = _Source;

    factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
