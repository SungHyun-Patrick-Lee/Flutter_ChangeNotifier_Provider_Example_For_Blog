import 'package:flutter/cupertino.dart';
import 'package:flutter_provider_example_for_blog/core/enums/viewmodel_state.dart';

class BaseModel extends ChangeNotifier {
  ViewModelState _state = ViewModelState.Idle;

  ViewModelState get state => _state;

  void setState(ViewModelState state) {
    _state = state;
    notifyListeners();
  }
}
