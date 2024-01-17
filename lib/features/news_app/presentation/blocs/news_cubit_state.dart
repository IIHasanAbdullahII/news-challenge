part of 'news_cubit_event_bloc.dart';

@freezed
class NewsState with _$NewsState{
  const factory NewsState.loading() = _Loading;
  const factory NewsState.success(NewsEntity data) = _Success;
  const factory NewsState.failure(String message) = _Failure;  
}
