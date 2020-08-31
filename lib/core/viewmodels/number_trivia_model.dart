import 'package:flutter_provider_example_for_blog/core/enums/viewmodel_state.dart';

import '../models/number_trivia.dart';
import '../services/number_trivia_service.dart';
import 'base_model.dart';
import 'package:meta/meta.dart';

class NumberTriviaModel extends BaseModel {
  final NumberTriviaService numberTriviaService;

  NumberTriviaModel({@required this.numberTriviaService});

  NumberTrivia numberTrivia;

  Future getRandomNumberTrivia() async {
    setState(ViewModelState.Busy);

    final response = await numberTriviaService.getRandomNumberTrivia();
    response.fold(
      (failure) {
        numberTrivia = NumberTrivia(number: -1, text: '네트워크 에러가 발생하였습니다.');
      },
      (numberTriviaParam) {
        numberTrivia = numberTriviaParam;
      },
    );

    setState(ViewModelState.Idle);
  }
}
