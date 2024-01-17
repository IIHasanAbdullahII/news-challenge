abstract class Failure{
  final String errorMessage;

  Failure({required this.errorMessage});
}

class ServerFailure extends Failure{
  ServerFailure({required serverFailureErrorMessage}) : super(errorMessage: serverFailureErrorMessage.toString());
  }

class CacheFailure extends Failure{
  CacheFailure({required cacheFailureErrorMessage}) : super(errorMessage: cacheFailureErrorMessage);
  
}