import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../errors/failures.dart';

typedef ResponseConverter<T> = T Function(dynamic response);

class DioClient{
  Dio dio = Dio();

  Future<Either<Failure, T>> getRequest<T>(String url,
  {
    required ResponseConverter<T> converter
  }) async{
    
    try{
      final response = await dio.get(url);
      if((response.statusCode ?? 0) < 200 ||
      (response.statusCode ?? 0) > 201)
      {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
      return Right(converter(response.data));
    }on DioException catch (e){
      return Left(
        ServerFailure(
          serverFailureErrorMessage: e.response?.data['detail'] as String? ?? e.message,));
    }
  }
}