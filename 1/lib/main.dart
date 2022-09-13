import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:traderstats_app/feature/landing_page/landing_page.dart';
import 'package:traderstats_app/utilities/routes.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      title: 'Trader Stats',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LandingPage(),
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (context) => makeRoute(context: context, routeName: settings.name!, arguments: settings.arguments ?? false),
            maintainState: true,
            fullscreenDialog: false);
      },
    );
  }
}
