import 'dart:convert';

import 'package:flutter_provider_example_for_blog/core/err/exception.dart';
import 'package:flutter_provider_example_for_blog/core/models/number_trivia.dart';
import 'package:flutter_provider_example_for_blog/core/services/api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import '../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

main() {
  ApiImpl apiImpl;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    apiImpl = ApiImpl(httpClient: mockHttpClient);
  });

  group('Api', () {
    final testJson = getFixutre('random_trivia.json');
    final testTrivia = NumberTrivia.fromJson(jsonDecode(testJson));
    test(
      'getRandomNumberTriviaFromServer() 에서 코드 200이 뜨고 성공하였을 때 테스트',
      () async {
        // arrange
        when(mockHttpClient.get(
          'http://numbersapi.com/random?json',
          headers: anyNamed('headers'),
        )).thenAnswer((_) async => http.Response(testJson, 200));
        // act
        final result = await apiImpl.getRandomNumberTriviaFromServer();
        // assert
        verify(mockHttpClient.get(
          'http://numbersapi.com/random?json',
          headers: jsonHeader,
        ));
        expect(result, equals(testTrivia));
      },
    );

    test(
      'getRandomNumberTriviaFromServer() 에서 코드 400이 뜨면 ServerException 을 throw 하는지 테스트',
      () async {
        // arrange
        when(mockHttpClient.get(
          'http://numbersapi.com/random?json',
          headers: anyNamed('headers'),
        )).thenAnswer((_) async => http.Response(testJson, 400));
        // act
        final call = apiImpl.getRandomNumberTriviaFromServer();
        // assert
        expect(call, throwsA(isInstanceOf<ServerException>()));
      },
    );
  });
}
