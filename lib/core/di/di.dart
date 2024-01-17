import 'package:clean_architecture_2/core/api/dio_client.dart';
import 'package:clean_architecture_2/features/news_app/data/datasources/remote_data_source.dart';
import 'package:clean_architecture_2/features/news_app/data/repositories/news_repository_imp.dart';
import 'package:clean_architecture_2/features/news_app/domain/repositories/news_repository.dart';
import 'package:clean_architecture_2/features/news_app/domain/usecases/get_news.dart';
import 'package:clean_architecture_2/features/news_app/presentation/blocs/news_cubit_event_bloc.dart';
import 'package:get_it/get_it.dart';


GetIt sl = GetIt.instance;

Future<void> serviceLocator() async{
  sl.registerSingleton<DioClient>(DioClient());
  _dataSources();
  _repositories();
  _useCase();
  _cubit();
}

/// Register repositories
void _repositories() {
  sl.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(sl()));

}

/// Register dataSources
void _dataSources() {
  sl.registerLazySingleton<NewsRemoteDataSource>(
        () => NewsRemoteDataSourceImpl(sl()),
  );

}

/// usecase
void _useCase() {  
  sl.registerLazySingleton(() => GetNews(sl()));

}

/// cubit
void _cubit() {
  sl.registerFactory(() => ShowNewsCubit(sl()));

}