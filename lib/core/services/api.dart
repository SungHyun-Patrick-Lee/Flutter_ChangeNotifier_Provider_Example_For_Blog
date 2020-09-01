import 'package:flutter_provider_example_for_blog/core/models/number_trivia.dart';

abstract class Api {
  Future<NumberTrivia> getRandomNumberTriviaFromServer();
}
