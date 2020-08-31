import 'package:flutter_provider_example_for_blog/core/models/number_trivia.dart';
import 'package:flutter_provider_example_for_blog/core/services/number_trivia_service.dart';
import 'package:flutter_provider_example_for_blog/core/viewmodels/number_trivia_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaService extends Mock implements NumberTriviaService {}

main() {
  NumberTriviaModel numberTriviaModel;
  MockNumberTriviaService mockNumberTriviaService;

  setUp(() {
    mockNumberTriviaService = MockNumberTriviaService();
    numberTriviaModel =
        NumberTriviaModel(numberTriviaService: mockNumberTriviaService);
  });

  group(
    'NumberTriviaModel 에서 getRandomNumberTrivia() 작동 여부 테스트',
    () {
      test(
        'getRandomNumberTrivia() 가 성공했을때의 테스트 ',
        () async {
          // arrange
          final testNumberTrivia = NumberTrivia(text: 'test', number: 1);
          mockNumberTriviaService
              .getRandomNumberTrivia()
              .then((value) => testNumberTrivia);
          // act
          await numberTriviaModel.getRandomNumberTrivia();
          // assert
          verify(mockNumberTriviaService.getRandomNumberTrivia());
          expect(testNumberTrivia, numberTriviaModel.numberTrivia);
        },
      );
    },
  );
}
