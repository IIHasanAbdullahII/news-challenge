import 'package:clean_architecture_2/core/errors/failures.dart';
import 'package:clean_architecture_2/features/news_app/data/datasources/remote_data_source.dart';
import 'package:clean_architecture_2/features/news_app/data/models/news_response.dart';
import 'package:clean_architecture_2/features/news_app/domain/entity/news_entity.dart';
import 'package:clean_architecture_2/features/news_app/domain/repositories/news_repository.dart';
import 'package:dartz/dartz.dart';




class NewsRepositoryImpl extends NewsRepository{
  final NewsRemoteDataSource newsRemoteDataSource;

  NewsRepositoryImpl(this.newsRemoteDataSource);
  
  @override
  Future<Either<Failure, NewsEntity>> getNews() async{
    final response = await newsRemoteDataSource.news();

    return response.fold(
      (failure) => Left(failure), 
      (newsResponse) {
        return Right(toEntity(newsResponse));
      });
  }

  NewsEntity toEntity(NewsResponse data) {
    final listNews = News(
      status: data.status,
      totalResults: data.totalResults,
      articles: data.articles
    );
    return NewsEntity(news: listNews);

  }

}

