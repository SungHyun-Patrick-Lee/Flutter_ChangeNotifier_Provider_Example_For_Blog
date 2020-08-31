import 'package:flutter_provider_example_for_blog/core/models/number_trivia.dart';

abstract class NumberTriviaService {
  Future<NumberTrivia> getRandomNumberTrivia();
}

class NumberTriviaServiceImpl extends NumberTriviaService {
  @override
  Future<NumberTrivia> getRandomNumberTrivia() {
    throw UnimplementedError();
  }
}
