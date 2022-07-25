import 'package:flutter/material.dart';
import 'package:taxi_app/core/routes/app_routes.dart';
import 'package:taxi_app/presentation/views/along_the_way/along_the_way.dart';
import 'package:taxi_app/presentation/views/auth/auth_page.dart';
import 'package:taxi_app/presentation/views/choose_location.dart/choose_location_page.dart';
import 'package:taxi_app/presentation/views/edit_mail/edit_mail_page.dart';
import 'package:taxi_app/presentation/views/edit_profile/edit_profile.dart';
import 'package:taxi_app/presentation/views/home/home_page.dart';
import 'package:taxi_app/presentation/views/profile/profile_page.dart';
import 'package:taxi_app/presentation/views/splash/splash_page.dart';
import 'package:taxi_app/presentation/views/verify/verify_page.dart';

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
      case AppRoutes.editMail:
        return simpleRoute(const EditMail());
      case AppRoutes.editProfile:
        return simpleRoute(const EditProfile());
      case AppRoutes.auth:
        return simpleRoute(const AuthPage());
      case AppRoutes.verifyPage:
        return simpleRoute(const VerifyPage());
      case AppRoutes.alongTheWay:
        return simpleRoute(const AlongTheWay());
    }
    return null;
  }

  simpleRoute(Widget route) => MaterialPageRoute(builder: (context) => route);
}
