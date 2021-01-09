import 'package:covac_information/utils/routes/router.dart' as OnRouter;
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid Vaccine',
      initialRoute: '/home',
      onGenerateRoute: OnRouter.Router.generateRoute,
    );
  }
}

