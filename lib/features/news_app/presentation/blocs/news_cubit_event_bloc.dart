import 'package:clean_architecture_2/core/params/params.dart';
import 'package:clean_architecture_2/features/news_app/domain/usecases/get_news.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/news_entity.dart';

part 'news_cubit_state.dart';
part 'news_cubit_event_bloc.freezed.dart';

class ShowNewsCubit extends Cubit<NewsState> {
  ShowNewsCubit(this._getNews) : super(const NewsState.loading());
   final GetNews _getNews;


     Future<void> fetchNews() async {
    await _fetchData();
  }

  Future<void> refreshNews() async {
    emit(_Loading());
    await _fetchData();
  }


  Future<void> _fetchData() async{

    final data = await _getNews.call(NoParams());
   

    data.fold(
      (newFailure){
        emit(_Failure(newFailure.errorMessage));
      },
      (newNews){
        emit(_Success(newNews));
      }
      
    );
  }


}