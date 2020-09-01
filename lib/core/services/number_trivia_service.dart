import 'package:dartz/dartz.dart';
import 'package:flutter_provider_example_for_blog/core/services/api.dart';

import '../err/failure.dart';
import '../models/number_trivia.dart';

abstract class NumberTriviaService {
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}

class NumberTriviaServiceImpl {
  final Api api;

  NumberTriviaServiceImpl({
    this.api,
  });

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() {
    throw UnimplementedError();
  }
}
