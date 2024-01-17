import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_entity.freezed.dart';

@freezed 
class NewsEntity with _$NewsEntity {
  const factory NewsEntity ({
    News? news,
  }) = _NewsEntity;
}

@freezed
class News with _$News {
    const factory News({
        String? status,
        int? totalResults,
        List<dynamic>? articles,
    }) = _News;
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
}

@freezed
class Source with _$Source {
    const factory Source({
        String? id,
        String? name,
    }) = _Source;
}
