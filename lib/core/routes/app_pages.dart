
import 'package:flutter/material.dart';
import 'package:taxi_app/core/routes/app_routes.dart';
import 'package:taxi_app/presentation/views/choose_location.dart/choose_location_page.dart';
import 'package:taxi_app/presentation/views/home/home_page.dart';
import 'package:taxi_app/presentation/views/profile/profile_page.dart';
import 'package:taxi_app/presentation/views/splash/splash_page.dart';

class RouteGenerate {
  Route? generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return simpleRoute(const SplashPage());
      case AppRoutes.mapViews:
        return simpleRoute(const MapViews());
      case AppRoutes.chooseLocation:
        return simpleRoute(const ChooseLocation());
      case AppRoutes.profile:
        return simpleRoute(const ProfilePage());
    }
    return null;
  }

  simpleRoute(Widget route) => MaterialPageRoute(builder: (context) => route);
}
