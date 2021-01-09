import 'package:covac_information/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(builder: (_) =>
          Scaffold(
            body: Center(child: Text('No Defined Routes'))
          )
        );
    }
  }
}