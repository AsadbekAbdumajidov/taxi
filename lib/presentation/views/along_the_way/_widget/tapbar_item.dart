import 'package:flutter/material.dart';
import 'package:taxi_app/core/themes/button_styles.dart';
import 'package:taxi_app/core/themes/colors.dart';
import 'package:taxi_app/core/themes/styles.dart';
import 'package:taxi_app/presentation/components/decoration.dart';
import 'package:taxi_app/presentation/components/size_konfig.dart';

class TapBarItem extends StatelessWidget {
  const TapBarItem(
      {Key? key,
      required this.name,
      required this.avtoName,
      required this.avtoNumber,
      required this.coast,
      required this.seats,
      required this.timeToLive,
      required this.img, required this.onTap})
      : super(key: key);
  final String name;
  final String avtoName;
  final String avtoNumber;
  final String coast;
  final String seats;
  final String timeToLive;
  final String img;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Today", style: AppTextStyle.instance.styleBlackW600S16),
            SizedBox(height: he(16)),
            Container(
                height: he(220),
                width: double.infinity,
                decoration: AppDecoration.instance.styleWhiteBorderRadius12,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: he(80),
                            width: he(80),
                            decoration: BoxDecoration(
                                color: AppColors.instance.red,
                                borderRadius: BorderRadius.circular(40),
                                image: DecorationImage(
                                    image: AssetImage(img), fit: BoxFit.cover)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: wi(12)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(name,
                                    style:
                                        AppTextStyle.instance.styleBlackW600S16),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: he(4)),
                                  child: Row(
                                    children: [
                                      Text(avtoName,
                                          style: AppTextStyle
                                              .instance.styleBlackW600S16),
                                      Text(avtoNumber,
                                          style: AppTextStyle
                                              .instance.styleBlackW500S14),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text("Coast: ",
                                        style: AppTextStyle
                                            .instance.styleBlackW600S16),
                                    Text(coast,
                                        style: AppTextStyle
                                            .instance.styleBlackW500S14),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: he(16)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Seats: ",
                                  style: AppTextStyle.instance.styleBlackW600S16,
                                ),
                                Text(
                                  seats,
                                  style: AppTextStyle.instance.styleBlackW500S14,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Time to leave: ",
                                  style: AppTextStyle.instance.styleBlackW600S16,
                                ),
                                Text(
                                  timeToLive,
                                  style: AppTextStyle.instance.styleBlackW500S14,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      ElevatedButton(
                          style: AppButtonStyle
                              .instance.buttonStyleBorder8ColorPrimaryHe36Wi320,
                          onPressed: onTap,
                          child: Text("See",
                              style: AppTextStyle.instance.styleWhiteW600S16))
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
