import 'package:clean_architecture_2/core/api/dio_client.dart';
import 'package:clean_architecture_2/core/api/list_api.dart';
import 'package:clean_architecture_2/features/news_app/data/models/news_response.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class NewsRemoteDataSource {
  Future<Either<Failure, NewsResponse>> news();
}

class NewsRemoteDataSourceImpl extends NewsRemoteDataSource{
  final DioClient _client;

  NewsRemoteDataSourceImpl(this._client);

  @override
  Future<Either<Failure, NewsResponse>> news() async{
   final response = await _client.getRequest(
    ListApi.baseUrl + ListApi.additionalUrl, 
   converter: (response) {
     return NewsResponse.fromJson(response);
   });
   return response;
  }

}







// abstract class RemoteDataSources {
//   Future<List<NewsModel>> getNews({required NoParams params});
// }



// class RemoteDataSourcesImpl implements RemoteDataSources {
//   final Dio dio;

//   RemoteDataSourcesImpl({required this.dio});

//   @override
//   Future<List<NewsModel>> getNews({required NoParams params}) async {
//     try {
//       final response = await dio.get(
//         'https://newsapi.org/v2/top-headlines?country=us&apiKey=b35c944014de4ca0b451134e7c0fe4b3',
//       );

//       if (response.statusCode == 200) {
//         final List<dynamic> newsListData = response.data['articles'];
//         final List<NewsModel> newsList = newsListData.map((e) => NewsModel.fromJson(e)).toList();
         
//         return newsList;
//       } else {
//         throw ServerException();
//       }
//     } catch (e) {
//       throw ServerException();
//     }
//   }
// }


