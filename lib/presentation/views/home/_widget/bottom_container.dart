import 'package:flutter/material.dart';
import 'package:taxi_app/core/extension/for_context.dart';
import 'package:taxi_app/core/themes/colors.dart';
import 'package:taxi_app/core/themes/decoration.dart';
import 'package:taxi_app/core/themes/styles.dart';
import 'package:taxi_app/presentation/components/size_konfig.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: FloatingActionButton(
              backgroundColor: AppColors.instance.white,
              onPressed: () {},
              child: Icon(
                Icons.maps_ugc_rounded,
                color: AppColors.instance.black,
                size: he(33),
              )),
        ),
        Container(
          height: he(110),
          width: context.w,
          decoration: AppDecoration.instance.styleBoxShadowBorderRadiusAll20White,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Container(
                      height: he(8),
                      width: wi(40),
                      decoration: BoxDecoration(
                          color: AppColors.instance.greeySearch,
                          borderRadius: BorderRadius.circular(16)),
                    ),
                    SizedBox(height: he(12)),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: he(60),
                        decoration: BoxDecoration(
                            color: AppColors.instance.greeySearch,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: wi(12)),
                              child:  CircleAvatar(
                                  radius: 18,
                                  backgroundColor: AppColors.instance.gray,
                                  child: Icon(
                                    Icons.search,
                                    color: AppColors.instance.black,
                                  )),
                            ),
                            Text("Where to?",
                                style: AppTextStyle.styleW800S20Black)
                          ],
                        ),
                      ),
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
