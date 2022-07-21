import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:taxi_app/core/routes/app_routes.dart';
import 'package:taxi_app/core/themes/button_styles.dart';
import 'package:taxi_app/core/themes/colors.dart';
import 'package:taxi_app/core/themes/styles.dart';
import 'package:taxi_app/presentation/components/size_konfig.dart';

class VerifyPage extends StatelessWidget {
  VerifyPage({Key? key}) : super(key: key);
  final textController = TextEditingController();
  final focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final phone = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: AppColors.instance.white,
      appBar: AppBar(
        backgroundColor: AppColors.instance.white,
        centerTitle: true,
        title:
            Text("Enter code", style: AppTextStyle.instance.styleBlackW600S20),
      ),
      body: SafeArea(
        
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: wi(20)),
          children: [
            SizedBox(height: he(30)),
            Text(
              "An SMS code was sent to",
              style: AppTextStyle.instance.styleBlackW600S16,
            ),
            SizedBox(height: he(4)),
            Text(
              phone.toString(),
              style: AppTextStyle.instance.styleBlackW500S14
                  .copyWith(color: AppColors.instance.black),
            ),
            SizedBox(height: he(32)),
            Pinput(
              androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              textInputAction: TextInputAction.next,
              focusNode: focusNode,
              autofocus: true,
              controller: textController,
              onChanged: (code) {},
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              onCompleted: (pin) => debugPrint(pin),
            ),
            SizedBox(height: he(32)),
            ElevatedButton(
                style: AppButtonStyle
                    .instance.buttonStyleBorder8ColorPrimaryHe36Wi101,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.mapViews);
                },
                child: Text("Sending",
                    style: AppTextStyle.instance.styleWhiteW600S16)),
            SizedBox(height: he(24)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didnt receive the code",
                  style: AppTextStyle.instance.styleBlackW600S16
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                SizedBox(width: wi(4)),
                GestureDetector(
                  onTap: () {
                    textController.text = '';
                    focusNode.unfocus();
                  },
                  child: Text(
                    "Resend",
                    style: AppTextStyle.instance.styleBlackW500S14
                        .copyWith(color: AppColors.instance.primaryColor),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  final defaultPinTheme = PinTheme(
    width: he(56),
    height: he(56),
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(8),
    ),
  );

  final focusedPinTheme = PinTheme(
    width: he(56),
    height: he(56),
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.instance.primaryColor),
      borderRadius: BorderRadius.circular(8),
    ),
  );

  final submittedPinTheme = PinTheme(
    width: he(56),
    height: he(56),
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.instance.primaryColor),
      borderRadius: BorderRadius.circular(8),
    ),
  );
}
