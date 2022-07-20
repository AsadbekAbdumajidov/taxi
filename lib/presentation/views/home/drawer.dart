import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/core/routes/app_routes.dart';
import 'package:taxi_app/presentation/components/size_konfig.dart';
import 'package:taxi_app/presentation/views/home/_widget/drawer_title.dart';
import 'package:taxi_app/presentation/views/home/_widget/item_driwer.dart';

class DrawerComp extends StatelessWidget {
  const DrawerComp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SlideInLeft(
      child: Drawer(
        child: Column(
          children: [
            SizedBox(height: he(40)),
            TitleDriwer(
                title: "Asadbek Abdumajidov",
                subtitle: "Edit profile",
                ontap: () {
                  Navigator.pushNamed(context, AppRoutes.profile);
                }),
            const Divider(height: 0),
            Padding(
              padding:  EdgeInsets.only(left: wi(8)),
              child: Column(
                children: [
                  ItemDriwer(title: "Payment", ontap: () {}, icon: Icons.payment),
                  ItemDriwer(
                      title: "Promotions",
                      ontap: () {},
                      icon: Icons.perm_device_information_sharp),
                  ItemDriwer(
                      title: "My Rides",
                      ontap: () {},
                      icon: Icons.access_time_sharp),
                  ItemDriwer(
                      title: "Work Rides", ontap: () {}, icon: Icons.card_travel),
                  ItemDriwer(
                      title: "Support", ontap: () {}, icon: Icons.support_agent),
                  ItemDriwer(
                      title: "About",
                      ontap: () {},
                      icon: Icons.warning_amber_outlined)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
// 