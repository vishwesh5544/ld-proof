import 'package:flutter/material.dart';
import 'package:traderstats_app/feature/login/viewmodel/states/login_state.dart';

abstract class LoginViewModel with ChangeNotifier {
  LoginViewModelState getState();

  loginUser();
}

class LoginViewModelImpl with ChangeNotifier implements LoginViewModel {
  late LoginViewModelState _vmState;

  LoginViewModelImpl() {
    _vmState = LoginViewModelState();
  }

  @override
  LoginViewModelState getState() {
    // TODO: implement getState
    return _vmState;
  }

  @override
  loginUser() {
    print("*** state email = ${_vmState.getEmail()}");
    if (_vmState.getEmail() == "***TEST CASE") {
      _vmState.userValidated = true;
      notifyListeners();
    } else {
      _vmState.userValidated = false;
      notifyListeners();
    }
  }
}
