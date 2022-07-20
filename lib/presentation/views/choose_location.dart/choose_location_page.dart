import 'package:flutter/material.dart';
import 'package:taxi_app/core/themes/colors.dart';
import 'package:taxi_app/core/themes/styles.dart';
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
        padding: EdgeInsets.symmetric(horizontal: wi(16)),
        child: Column(
          children: [
            const SizedBox(height: 12),
            TextField(
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
                    child: Icon(Icons.search,
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
            onPressed: () {},
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
