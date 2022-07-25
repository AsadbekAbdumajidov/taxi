import 'package:flutter/material.dart';
import 'package:taxi_app/core/routes/app_routes.dart';
import 'package:taxi_app/core/themes/button_styles.dart';
import 'package:taxi_app/core/themes/colors.dart';
import 'package:taxi_app/core/themes/styles.dart';
import 'package:taxi_app/presentation/components/decoration.dart';
import 'package:taxi_app/presentation/components/size_konfig.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.instance.backgroundColor,
      appBar: appBar(),
      body: Padding(
        padding: EdgeInsets.only(top: he(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: wi(16)),
              child: TextField(
                onTap: () {},
                textInputAction: TextInputAction.done,
                controller: controller,
                readOnly: false,
                autofocus: false,
                onChanged: (words) {},
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Icon(Icons.location_pin,
                          color: AppColors.instance.primaryColor)),
                  contentPadding: EdgeInsets.zero,
                  suffixIcon: IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      controller.clear();
                    },
                    icon: Center(
                      child: Icon(Icons.close,
                          color: AppColors.instance.primaryColor),
                    ),
                  ),
                  filled: true,
                  fillColor: AppColors.instance.white,
                  border: inputBorder(),
                  focusedBorder: inputBorder(),
                  enabledBorder: inputBorder(),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: he(8)),
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                  itemBuilder: (_, __) {
                    return Padding(
                      padding:  EdgeInsets.symmetric(horizontal: wi(6)),
                      child: Column(
                        children: [
                          ListTile(
                            onTap: (){},
                            leading: const Icon(Icons.location_pin),
                            title: Text("Chilonzor",
                                style: AppTextStyle.instance.styleBlackW600S16),
                            subtitle: Text("Uzbekistan",
                                style: AppTextStyle.instance.styleBlackW500S14),
                            trailing: const Icon(Icons.call_missed_outlined),
                          ),
                          const Divider()
                        ],
                      ),
                    );
                  }),
            ),
            Container(
              height: he(210),
              decoration:
                  AppDecoration.instance.styleBoxShadowBorderRadiusAll20White,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                        height: he(50),
                        decoration: AppDecoration
                            .instance.styleGreeySearchBorderRadius12,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: const [
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration.collapsed(
                                      hintText: 'Where to ?'),
                                ),
                              ),
                              Icon(Icons.map)
                            ],
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: he(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: he(50),
                            width: wi(140),
                            decoration: AppDecoration
                                .instance.styleGreeySearchBorderRadius12,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.data_saver_off,
                                  size: he(30),
                                ),
                                Text("Data",
                                    style: AppTextStyle
                                        .instance.styleW800S20Black),
                              ],
                            ),
                          ),
                          Text("|",
                              style: AppTextStyle.instance.styleW800S20Black),
                          Row(
                            children: [
                              const Icon(Icons.person),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove)),
                              Text("1",
                                  style:
                                      AppTextStyle.instance.styleW800S20Black),
                              IconButton(
                                  onPressed: () {}, icon: const Icon(Icons.add))
                            ],
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                        style: AppButtonStyle
                            .instance.buttonStyleBorder8ColorPrimaryHe36Wi320,
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.alongTheWay);
                        },
                        child: Text("Search",
                            style: AppTextStyle.instance.styleWhiteW600S16))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: Text(
          "You route",
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
            icon: const Icon(Icons.highlight_remove),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: wi(5)),
            child: IconButton(
                iconSize: 30,
                splashRadius: 24,
                onPressed: () {},
                icon: const Icon(Icons.add)),
          )
        ]);
  }

  OutlineInputBorder inputBorder() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.white, width: 0),
      );
}
