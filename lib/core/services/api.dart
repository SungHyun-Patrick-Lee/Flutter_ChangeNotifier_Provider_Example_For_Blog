import 'dart:convert';

import 'package:flutter_provider_example_for_blog/core/err/exception.dart';
import 'package:flutter_provider_example_for_blog/core/models/number_trivia.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

const jsonHeader = {"Content-Type": "application/json"};

abstract class Api {
  /*
   * url : http://numbersapi.com/random?json
   * header : {Content-Type : application/json}
   * success code : 200
   * fail code : 400
   * response example : test/fixtures/random_trivia.json
   */
  Future<NumberTrivia> getRandomNumberTriviaFromServer();
}

class ApiImpl extends Api {
  final http.Client httpClient;

  ApiImpl({
    @required this.httpClient,
  });

  @override
  Future<NumberTrivia> getRandomNumberTriviaFromServer() async {
    final response = await httpClient.get(
      'http://numbersapi.com/random?json',
      headers: jsonHeader,
    );

    if (response.statusCode == 200) {
      final result = NumberTrivia.fromJson(jsonDecode(response.body));
      return result;
    } else {
      throw ServerException();
    }
  }
}
