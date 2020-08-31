import 'package:flutter_provider_example_for_blog/core/viewmodels/base_model.dart';
import 'package:meta/meta.dart';

class NumberTriviaModel extends BaseModel {
  final NumberTriviaService numberTriviaService;

  NumberTriviaModel({@required this.numberTriviaService});
}
