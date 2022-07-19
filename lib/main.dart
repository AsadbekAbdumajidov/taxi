import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taxi_app/core/routes/app_pages.dart';
import 'package:taxi_app/core/themes/app_theme.dart';
import 'package:taxi_app/presentation/views/splash/splash_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taxi app',
      // theme: appThemeData,
      onGenerateRoute: RouteGenerate().generate,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child!,
        );
      },
      home: const SplashPage(),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const ClampingScrollPhysics();
}

