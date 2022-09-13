import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:traderstats_app/feature/login/viewmodel/login_viewmodel.dart';
import 'package:traderstats_app/feature/login/viewmodel/states/login_state.dart';
import 'package:traderstats_app/widgets/navigation_bar/navigation_bar.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  LoginViewModel? _viewModel;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // ignore unneccsary cast
      create: (context) => LoginViewModelImpl() as LoginViewModel,
      child: Consumer<LoginViewModel>(
        builder: (context, viewModel, child) {
          _viewModel = viewModel;
          return Scaffold(
            backgroundColor: const Color(0xff0D0638),
            body: SingleChildScrollView(
                child: Column(
              children: [
                const Navbar(),
                Row(
                  children: [
                    const Text('Some Image', style: TextStyle(color: Colors.white)),
                    Container(decoration: const BoxDecoration(color: Colors.grey), height: 300, width: 600, child: _loginForm(context))
                  ],
                )
              ],
            )),
          );
        },
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    LoginViewModelState _state = _viewModel!.getState();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                hintText: "Email",
              ),
              onSaved: (val) => _state.setEmail(val!),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            TextFormField(
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
                hintText: "Password",
              ),
              onSaved: (val) => _state.setPassword(val!),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _viewModel!.loginUser();
                    if (_viewModel!.getState().userValidated) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('validation')));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('validation failed')));
                    }
                  }
                },
                child: const Text('Login'))
          ],
        ),
      ),
    );
  }
}
