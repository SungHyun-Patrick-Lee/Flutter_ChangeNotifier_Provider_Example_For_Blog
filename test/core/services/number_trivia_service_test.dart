import 'package:dartz/dartz.dart';
import 'package:flutter_provider_example_for_blog/core/err/failure.dart';
import 'package:flutter_provider_example_for_blog/core/models/number_trivia.dart';
import 'package:flutter_provider_example_for_blog/core/network/network_info.dart';
import 'package:flutter_provider_example_for_blog/core/services/api.dart';
import 'package:flutter_provider_example_for_blog/core/services/number_trivia_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockApi extends Mock implements Api {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

main() {
  NumberTriviaServiceImpl triviaService;
  MockApi mockApi;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockApi = MockApi();
    mockNetworkInfo = MockNetworkInfo();
    triviaService = NumberTriviaServiceImpl(
      api: mockApi,
      networkInfo: mockNetworkInfo,
    );
  });

  group('NumberTriviaService', () {
    test(
      'getRandomNumberTrivia() 가 성공했을 때 테스트',
      () async {
        // arrange
        final testTrivia = NumberTrivia(number: 1, text: 'test');

        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        when(mockApi.getRandomNumberTriviaFromServer())
            .thenAnswer((_) async => testTrivia);
        // act
        final result = await triviaService.getRandomNumberTrivia();
        // assert
        verify(mockApi.getRandomNumberTriviaFromServer());
        expect(result, Right(testTrivia));
      },
    );

    test(
      'getRandomNumberTrivia() 에서 Network가 연결되지 않았을때 NetworkFailure반환 테스트',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        // act
        final result = await triviaService.getRandomNumberTrivia();
        // assert
        verify(mockNetworkInfo.isConnected);
        expect(result, Left(NetworkFailure()));
      },
    );
  });
}
