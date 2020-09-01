import 'package:flutter_provider_example_for_blog/core/services/api.dart';
import 'package:flutter_provider_example_for_blog/core/services/number_trivia_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockApi extends Mock implements Api {}

main() {
  NumberTriviaServiceImpl triviaService;
  MockApi mockApi;

  setUp(() {
    mockApi = MockApi();
    triviaService = NumberTriviaServiceImpl(api: mockApi);
  });

  group('NumberTriviaService', () {
    test(
      'getRandomNumberTrivia() 가 성공했을 때 테스트',
      () async {
        // arrange

        // act

        // assert
      },
    );
  });
}
