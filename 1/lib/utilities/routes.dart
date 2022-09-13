import 'package:traderstats_app/main.dart';
import 'package:flutter/material.dart';
import 'package:traderstats_app/feature/signup/signup_page.dart';
import 'package:traderstats_app/feature/login/login_page.dart';


Widget makeRoute({required BuildContext context, required String routeName, required Object arguments}) {
  final Widget child = _buildRoute(context: context, routeName: routeName, arguments: arguments);
  return child;
}

Widget _buildRoute({
  required BuildContext context,
  required String routeName,
  required Object arguments,
}) {

  switch (routeName) {
    case '/':
      return const MyApp();
    case '/signup':
      return Signup();
    case '/login':
      return Login();
    default:
      throw 'Route $routeName is not defined';
  }
}
