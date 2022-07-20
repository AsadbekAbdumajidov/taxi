import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/core/themes/colors.dart';
import 'package:taxi_app/presentation/components/size_konfig.dart';

class DrawerComp extends StatelessWidget {
  const DrawerComp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SlideInLeft(
      child: Stack(
        children: [
          Drawer(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      color: AppColors.instance.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: const Offset(0, 5),
                        ),
                      ],
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child:  Image.asset("assets/img/splesh_foto.png"),
                  ),
                  Card(
                    color: AppColors.instance.white,
                    elevation: 10,
                    child: ListTile(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      leading: Icon(Icons.home_max_rounded,
                          color: AppColors.instance.black, size: 27),
                      title: Text(
                        "Asosiy",
                        style: TextStyle(
                            color: AppColors.instance.black, fontSize: 16),
                      ),
                    ),
                  ),
                  Card(
                    color: AppColors.instance.white,
                    elevation: 10,
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, "/tarix");
                      },
                      leading: Icon(Icons.history,
                          color: AppColors.instance.black, size: 27),
                      title: Text(
                        "Ispaniya tarixi",
                        style: TextStyle(
                            color: AppColors.instance.black, fontSize: 16),
                      ),
                    ),
                  ),
                  Card(
                    color: AppColors.instance.white,
                    elevation: 10,
                    child: ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, "/about");
                      },
                      leading: Icon(Icons.warning_amber_outlined,
                          color: AppColors.instance.black, size: 27),
                      title: Text(
                        "Biz haqimizda",
                        style: TextStyle(
                            color: AppColors.instance.black, fontSize: 16),
                      ),
                    ),
                  ),
                  Card(
                    color: AppColors.instance.white,
                    elevation: 10,
                    child: ListTile(
                      onTap: () {
                        // ServiceSnackBar.showMyDialog(context);
                      },
                      leading: Icon(Icons.output_sharp,
                          color: AppColors.instance.black, size: 27),
                      title: Text(
                        "Chiqish",
                        style: TextStyle(
                            color: AppColors.instance.black, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
