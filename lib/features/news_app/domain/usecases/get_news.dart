import 'package:clean_architecture_2/core/errors/failures.dart';
import 'package:clean_architecture_2/core/params/params.dart';
import 'package:clean_architecture_2/features/news_app/domain/entity/news_entity.dart';
import 'package:clean_architecture_2/features/news_app/domain/repositories/news_repository.dart';
import 'package:dartz/dartz.dart';

class GetNews extends UseCase<NewsEntity, NoParams>{
  final NewsRepository _repo;

  GetNews(this._repo);
  
  @override
  Future<Either<Failure, NewsEntity>> call(NoParams params) {
    return _repo.getNews();

  }

}