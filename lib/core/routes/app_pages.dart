
import 'package:flutter/material.dart';
import 'package:taxi_app/core/routes/app_routes.dart';
import 'package:taxi_app/presentation/views/home/home_page.dart';
import 'package:taxi_app/presentation/views/splash/splash_page.dart';

class RouteGenerate {
  Route? generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return simpleRoute(const SplashPage());
      case AppRoutes.mapViews:
        return simpleRoute(const MapViews());
      
      
    }
    return null;
  }

  simpleRoute(Widget route) => MaterialPageRoute(builder: (context) => route);
}
