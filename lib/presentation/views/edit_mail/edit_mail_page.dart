import 'package:flutter/material.dart';
import 'package:taxi_app/core/themes/button_styles.dart';
import 'package:taxi_app/core/themes/colors.dart';
import 'package:taxi_app/core/themes/styles.dart';
import 'package:taxi_app/presentation/components/size_konfig.dart';

class EditMail extends StatefulWidget {
  const EditMail({Key? key}) : super(key: key);

  @override
  State<EditMail> createState() => _EditMailState();
}

TextEditingController controller = TextEditingController();

class _EditMailState extends State<EditMail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.instance.backgroundColor,
        leading: IconButton(
          splashRadius: 24,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.instance.black,
          ),
          
        ),title: Text("Edit Email",
            style: AppTextStyle.instance.styleBlackW600S16),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email for receipts",
                  style: AppTextStyle.instance.styleBlackW600S20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: he(16)),
                  child: TextField(
                    onTap: () {},
                    textInputAction: TextInputAction.done,
                    controller: controller,
                    readOnly: false,
                    autofocus: false,
                    onChanged: (words) {},
                    decoration: InputDecoration(
                      hintText: "AsadbekAbdumajidov7@gmail.com",
                      prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(Icons.mail,
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
                      border: inputBorderActive(),
                      focusedBorder: inputBorderActive(),
                      enabledBorder: inputBorderPassive(),
                    ),
                  ),
                ),
                Text(
                  "We sent an email to verify this address. Please check your inbox.",
                  style: AppTextStyle.instance.styleBlackW500S14,
                ),
              ],
            ),
            ElevatedButton(
                style: AppButtonStyle
                    .instance.buttonStyleBorder8ColorPrimaryHe36Wi320,
                onPressed: () {},
                child: Text("Upload",
                    style: AppTextStyle.instance.styleWhiteW600S16))
          ],
        ),
      ),
    );
  }

  OutlineInputBorder inputBorderActive() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide:
            BorderSide(color: AppColors.instance.primaryColor, width: 0),
      );
  OutlineInputBorder inputBorderPassive() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.instance.white, width: 0),
      );
}
