import 'package:flutter_provider_example_for_blog/core/models/number_trivia.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

abstract class Api {
  Future<NumberTrivia> getRandomNumberTriviaFromServer();
}

class ApiImpl extends Api {
  final http.Client httpClient;

  ApiImpl({
    @required this.httpClient,
  });

  @override
  Future<NumberTrivia> getRandomNumberTriviaFromServer() {
    throw UnimplementedError();
  }
}
