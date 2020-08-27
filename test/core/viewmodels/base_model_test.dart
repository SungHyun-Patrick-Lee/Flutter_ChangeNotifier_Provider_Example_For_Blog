import 'package:flutter_provider_example_for_blog/core/enums/viewmodel_state.dart';
import 'package:flutter_provider_example_for_blog/core/viewmodels/base_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBaseModel extends Mock implements BaseModel {}

void main() {
  BaseModel baseModel;

  setUp(() {
    baseModel = BaseModel();
  });

  test('BaseModel에서 setState의 동작 여부 테스트', () {
    // arrange
    final state = ViewModelState.Idle;
    // act
    baseModel.setState(ViewModelState.Idle);
    final result = baseModel.state;
    // assert
    expect(state, result);
  });
}
