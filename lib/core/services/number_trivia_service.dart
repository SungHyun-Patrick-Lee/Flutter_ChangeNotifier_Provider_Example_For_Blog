import 'package:dartz/dartz.dart';
import 'package:flutter_provider_example_for_blog/core/err/exception.dart';
import 'package:meta/meta.dart';

import 'package:flutter_provider_example_for_blog/core/network/network_info.dart';
import 'package:flutter_provider_example_for_blog/core/services/api.dart';

import '../err/failure.dart';
import '../models/number_trivia.dart';

abstract class NumberTriviaService {
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}

class NumberTriviaServiceImpl implements NumberTriviaService {
  final Api api;
  final NetworkInfo networkInfo;

  NumberTriviaServiceImpl({
    @required this.api,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await api.getRandomNumberTriviaFromServer();
        return Right(result);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
