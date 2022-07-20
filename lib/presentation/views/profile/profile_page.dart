import 'package:flutter/material.dart';
import 'package:taxi_app/core/themes/colors.dart';
import 'package:taxi_app/core/themes/styles.dart';
import 'package:taxi_app/presentation/components/logout_snacbar.dart';
import 'package:taxi_app/presentation/components/size_konfig.dart';
import 'package:taxi_app/presentation/views/home/_widget/drawer_title.dart';
import 'package:taxi_app/presentation/views/home/_widget/item_driwer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.instance.backgroundColor,
      appBar: appBar(context),
      body: Column(
        children: [
          SizedBox(height: he(10)),
          TitleDriwer(
              title: "Asadbek Abdumajidov",
              subtitle: "+998339540690",
              ontap: () {}),
          SizedBox(height: he(12)),
          Card(
            elevation: 0,
            child: ItemDriwer(
                title: "AsadbekAbdumajidov7@gmail.com",
                ontap: () {},
                icon: Icons.mail),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: he(6)),
            child: Card(
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: he(12), left: wi(14)),
                    child: Text(
                      "Favourite destination",
                      style: AppTextStyle.instance.styleBlackW600S16,
                    ),
                  ),
                  ItemDriwer(
                      title: "Enter home location",
                      ontap: () {},
                      icon: Icons.home_outlined),
                  ItemDriwer(
                      title: "Enter home location",
                      ontap: () {},
                      icon: Icons.work_outline_outlined)
                ],
              ),
            ),
          ),
          Card(
              elevation: 0,
              child: Column(
                children: [
                  ListTile(
                    onTap: () {},
                    title: Text(
                      "Language",
                      style: AppTextStyle.instance.styleBlackW600S16,
                    ),
                    subtitle: Text(
                      "English-US",
                      style: AppTextStyle.instance.styleBlackW500S14,
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text(
                      "communication prefrences",
                      style: AppTextStyle.instance.styleBlackW600S16,
                    ),
                  ),
                ],
              )),
          SizedBox(height: he(4)),
          Card(
              elevation: 0,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.logout, color: AppColors.instance.red),
                    onTap: () {
                      ServiceSnackBar.showMyDialog(context);
                    },
                    title: Text(
                      "Log out",
                      style: AppTextStyle.instance.styleBlackW600S16,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
        title: Text(
          "Profile",
          style: AppTextStyle.instance.styleW800S20Black,
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: wi(5)),
          child: IconButton(
            iconSize: 30,
            splashRadius: 24,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: wi(5)),
            child: IconButton(
                iconSize: 30,
                splashRadius: 24,
                onPressed: () {},
                icon: const Icon(Icons.edit_location_alt_outlined)),
          )
        ]);
  }
}
