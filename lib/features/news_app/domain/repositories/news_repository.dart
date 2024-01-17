import 'package:clean_architecture_2/core/errors/failures.dart';
import 'package:clean_architecture_2/features/news_app/domain/entity/news_entity.dart';
import 'package:dartz/dartz.dart';


abstract class NewsRepository{
  Future<Either<Failure, NewsEntity>> getNews();
}