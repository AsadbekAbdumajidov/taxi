
import 'package:flutter/material.dart';
import 'package:taxi_app/core/routes/app_routes.dart';
import 'package:taxi_app/presentation/views/splash/splash_page.dart';

class RouteGenerateKit {
  Route? generateKit(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return simpleRoute(const SplashPage());
      
      
      
    }
    return null;
  }

  simpleRoute(Widget route) => MaterialPageRoute(builder: (context) => route);
}
