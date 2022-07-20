import 'package:flutter/material.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:taxi_app/core/themes/colors.dart';

class ServiceSnackBar {
  static showMyDialog(context) {
    return showDialog(
        barrierDismissible: false, // ekranni chetiga bosilganda ochiradi.
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Log out ?",
              style: TextStyle(
                  color: AppColors.instance.black),
            ),
           
            backgroundColor: AppColors.instance.white,
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: OutlinedButton.styleFrom(
                      fixedSize: const Size(100, 35),
                      backgroundColor: AppColors.instance.red,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: Text(
                      "No",
                      style: TextStyle(color: AppColors.instance.white),
                    ),
                    onPressed: () {
                      Navigator.pop(
                          context); // Buttonga bosilganda orqaga qaytadi
                    },
                  ),
                  ElevatedButton(
                    style: OutlinedButton.styleFrom(
                      fixedSize: const Size(100, 35),
                      backgroundColor: AppColors.instance.primaryColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    child: Text(
                      "Yes",
                      style: TextStyle(color: AppColors.instance.white),
                    ),
                    onPressed: () {
                      FlutterExitApp.exitApp();
                    },
                  ),
                ],
              )
            ],
          );
        });
  }
}
