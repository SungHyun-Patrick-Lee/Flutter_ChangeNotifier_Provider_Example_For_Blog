import 'package:dartz/dartz.dart';

import '../err/failure.dart';
import '../models/number_trivia.dart';

abstract class NumberTriviaService {
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}

class NumberTriviaServiceImpl extends NumberTriviaService {
  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() {
    throw UnimplementedError();
  }
}
