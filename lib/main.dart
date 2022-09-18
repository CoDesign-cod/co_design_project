import 'package:codesign_app/screens/splash_screen.dart';
import 'package:codesign_app/shared/resources/routes_maneger.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      // initialRoute: Routes.splashRout,
      home: const SplashPage(),
    );
  }
}
