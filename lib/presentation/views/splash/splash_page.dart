import 'package:flutter/material.dart';
import 'package:taxi_app/core/routes/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.mapViews, (route) => false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Center(
        child: Image.asset("assets/png/ic_logo.png"),
      ),
    );
  }
}
