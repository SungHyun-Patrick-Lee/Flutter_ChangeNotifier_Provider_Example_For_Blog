import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaService extends Mock implements NumberTriviaService {}

main() {
  NumberTriviaModel numberTriviaModel;
  MockNumberTriviaService mockNumberTriviaService;

  setUp(() {
    mockNumberTriviaService = MockNumberTriviaService();
    numberTriviaModel = numberTriviaModel(mockNumberTriviaService);
  });
}
