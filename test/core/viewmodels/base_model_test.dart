import 'package:flutter_provider_example_for_blog/core/enums/viewmodel_state.dart';
import 'package:flutter_provider_example_for_blog/core/viewmodels/base_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  BaseModel baseModel;

  setUp(() {
    baseModel = BaseModel();
  });

  group('BaseModelTest', () {
    ViewModelState state = ViewModelState.Busy;

    test('BaseModel에서 setState의 동작 여부 테스트', () {
      // act
      baseModel.setState(state);
      final result = baseModel.state;

      // assert
      expect(state, result);
      expect(state, baseModel.state);
    });
  });
}
