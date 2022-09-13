import '../../../../models/User.dart';

class LoginViewModelState {
  LoginViewModelState() {

  }

  String _email = "";
  String _password = "";

  bool userValidated = false;

  void setEmail(String email) => _email = email;

  void setPassword(String password) => _password = password;

  String getEmail() => _email;

  String getPassword() => _password;
}
