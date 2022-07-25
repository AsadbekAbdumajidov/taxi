import 'package:flutter/material.dart';
import 'package:taxi_app/core/extension/for_context.dart';
import 'package:taxi_app/core/routes/app_routes.dart';
import 'package:taxi_app/core/themes/colors.dart';
import 'package:taxi_app/presentation/components/decoration.dart';
import 'package:taxi_app/core/themes/styles.dart';
import 'package:taxi_app/presentation/components/size_konfig.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({Key? key, required this.onTap}) : super(key: key);
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.instance.backgroundColor,
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                    onTap: onTap,
                    child: Icon(
                      Icons.near_me_outlined,
                      color: AppColors.instance.primaryColor,
                      size: he(32),
                    )),
              ),
            )),
        Container(
          height: he(180),
          width: context.w,
          decoration:
              AppDecoration.instance.styleBoxShadowBorderRadiusAll20White,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Container(
                      height: he(8),
                      width: wi(40),
                      decoration:
                          AppDecoration.instance.styleGreeySearchBorderRadius16,
                    ),
                    
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: he(12)),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.chooseLocation);
                        },
                        child: Container(
                          height: he(60),
                          decoration: AppDecoration
                              .instance.styleGreeySearchBorderRadius12,
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: wi(12)),
                                child: CircleAvatar(
                                    radius: 18,
                                    backgroundColor: AppColors.instance.primary20,
                                    child: Icon(
                                      Icons.search,
                                      color: AppColors.instance.black,
                                    )),
                              ),
                              Text("Where to?",
                                  style: AppTextStyle.instance.styleW800S20Black)
                            ],
                          ),
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: he(60),
                          width: wi(150),
                          decoration: AppDecoration
                              .instance.styleGreeySearchBorderRadius12,
                          child: InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, AppRoutes.chooseLocation);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.map_outlined,
                                  size: he(30),
                                ),
                                Text("along the way",
                                    style:
                                        AppTextStyle.instance.styleW800S20Black)
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: he(60),
                          width: wi(150),
                          decoration: AppDecoration
                              .instance.styleGreeySearchBorderRadius12,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.no_food_outlined,
                                  size: he(30),
                                  color: AppColors.instance.yellow),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Chikki food",
                                      style:
                                          AppTextStyle.instance.styleW800S20Black),
                                          Text("fast delivery",
                                      style:
                                          AppTextStyle.instance.styleBlackW500S14),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
