import 'package:flutter/material.dart';
import 'package:taxi_app/core/themes/button_styles.dart';
import 'package:taxi_app/core/themes/colors.dart';
import 'package:taxi_app/core/themes/styles.dart';
import 'package:taxi_app/presentation/components/decoration.dart';
import 'package:taxi_app/presentation/components/size_konfig.dart';
import 'package:taxi_app/presentation/views/along_the_way/_widget/tapbar_item.dart';

class AlongTheWay extends StatelessWidget {
  const AlongTheWay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: he(100),
          leading: IconButton(
              splashRadius: 24,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_rounded)),
          title: Container(
            height: he(70),
            decoration: AppDecoration.instance.styleGreeySearchBorderRadius12,
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    SizedBox(width: wi(16)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Toshkent --> Samarqand",
                          style: AppTextStyle.instance.styleBlackW600S16,
                        ),
                        Text("Today, one passenger",
                            style: AppTextStyle.instance.styleBlackW500S14)
                      ],
                    )
                  ],
                )),
          ),
          bottom: TabBar(
            unselectedLabelColor: AppColors.instance.darkGrey,
            labelColor: AppColors.instance.primaryColor,
            indicatorColor: AppColors.instance.black35,
            labelStyle: TextStyle(fontSize: he(20)),
            tabs: const [
              Tab(text: "Car"),
              Tab(
                text: "Buss",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TapBarItem(
                avtoName: "Cobalt: ",
                avtoNumber: "01.A433.AA",
                coast: "27 min som",
                name: "Samandar",
                seats: "2 seats",
                timeToLive: "16 : 00", img: 'assets/img/bill.jpg',),
           TapBarItem(
                avtoName: "Mers Avtobus: ",
                avtoNumber: "01.A717.AA",
                coast: "1 400 som",
                name: "Jurabek",
                seats: "16 seats",
                timeToLive: "08 : 00", img: 'assets/img/Getty.webp',),
          ],
        ),
      ),
    );
  }
}
