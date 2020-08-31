import '../models/number_trivia.dart';
import '../services/number_trivia_service.dart';
import 'base_model.dart';
import 'package:meta/meta.dart';

class NumberTriviaModel extends BaseModel {
  final NumberTriviaService numberTriviaService;

  NumberTriviaModel({@required this.numberTriviaService});

  NumberTrivia numberTrivia;

  Future getRandomNumberTrivia() async {
    numberTrivia = await numberTriviaService.getRandomNumberTrivia();
  }
}
