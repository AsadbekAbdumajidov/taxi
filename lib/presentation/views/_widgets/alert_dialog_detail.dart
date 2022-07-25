import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/core/themes/button_styles.dart';
import 'package:taxi_app/core/themes/colors.dart';
import 'package:taxi_app/core/themes/styles.dart';
import 'package:taxi_app/presentation/components/size_konfig.dart';

class CupertinoShowDialogIcDetail {
  static void showDialog({context, name, img, avtoName, coast, seat}) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Theme(
          data: ThemeData(
              scaffoldBackgroundColor: AppColors.instance.transparent),
          child: Scaffold(
            body: Stack(
              children: [
                Positioned(
                  bottom: he(200),
                  left: wi(45),
                  child: Container(
                      width: wi(250),
                      height: he(450),
                      decoration: BoxDecoration(
                          color: AppColors.instance.backgroundColor,
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Where are you going?",
                                style: AppTextStyle.instance.stylegreenW600S16),
                            SizedBox(height: he(16)),
                            Row(
                              children: [
                                Container(
                                  height: he(60),
                                  width: he(60),
                                  decoration: BoxDecoration(
                                      color: AppColors.instance.red,
                                      borderRadius: BorderRadius.circular(40),
                                      image: DecorationImage(
                                          image: AssetImage(img),
                                          fit: BoxFit.cover)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: wi(12)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(name,
                                          style: AppTextStyle
                                              .instance.styleBlackW600S16),
                                      Text(avtoName,
                                          style: AppTextStyle
                                              .instance.styleBlackW500S14),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: he(16)),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Icon(Icons.donut_large,
                                          color:
                                              AppColors.instance.primaryColor,
                                          size: he(30)),
                                      SizedBox(height: he(12)),
                                      Icon(Icons.home,
                                          color: AppColors.instance.yellow,
                                          size: he(30))
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: wi(30)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Where",
                                            style: AppTextStyle
                                                .instance.styleBlackW500S14),
                                        Text("Toshkent",
                                            style: AppTextStyle
                                                .instance.styleBlackW600S16),
                                        SizedBox(height: he(8)),
                                        Text("To where",
                                            style: AppTextStyle
                                                .instance.styleBlackW500S14),
                                        Text("Samarqand",
                                            style: AppTextStyle
                                                .instance.styleBlackW600S16),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Icon(Icons.date_range, size: he(30)),
                                    SizedBox(height: he(12)),
                                    Icon(Icons.av_timer, size: he(30))
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: wi(30)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("day",
                                          style: AppTextStyle
                                              .instance.styleBlackW500S14),
                                      Text("24.06.2022",
                                          style: AppTextStyle
                                              .instance.styleBlackW600S16),
                                      SizedBox(height: he(8)),
                                      Text("Time",
                                          style: AppTextStyle
                                              .instance.styleBlackW500S14),
                                      Text("22:00",
                                          style: AppTextStyle
                                              .instance.styleBlackW600S16),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: he(16)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Coast",
                                          style: AppTextStyle
                                              .instance.styleBlackW500S14),
                                      Text(coast,
                                          style: AppTextStyle
                                              .instance.styleBlackW600S16),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Seats",
                                          style: AppTextStyle
                                              .instance.styleBlackW500S14),
                                      Text(seat,
                                          style: AppTextStyle
                                              .instance.styleBlackW600S16),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  splashRadius: 24,
                                    onPressed: () {},
                                    icon: const Icon(Icons.chat_outlined)),
                                ElevatedButton(
                                    style: AppButtonStyle.instance
                                        .buttonStyleBorder8ColorPrimaryHe36Wi100,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Leave",
                                        style: AppTextStyle
                                            .instance.styleWhiteW600S16)),
                              ],
                            )
                          ],
                        ),
                      )),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
