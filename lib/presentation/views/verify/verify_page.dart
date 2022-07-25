import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:taxi_app/core/routes/app_routes.dart';
import 'package:taxi_app/core/services/firebase_auth.dart';
import 'package:taxi_app/core/themes/button_styles.dart';
import 'package:taxi_app/core/themes/colors.dart';
import 'package:taxi_app/core/themes/styles.dart';
import 'package:taxi_app/presentation/components/controller.dart';
import 'package:taxi_app/presentation/components/size_konfig.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({Key? key}) : super(key: key);

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  final focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    FirebaseService.verifySms();
  }

  @override
  Widget build(BuildContext context) {
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
              "+998${Controller.phone.text}",
              style: AppTextStyle.instance.styleBlackW500S14
                  .copyWith(color: AppColors.instance.black),
            ),
            SizedBox(height: he(32)),
            Pinput(
              length: 6,
              // androidSmsAutofillMethod:
              //     AndroidSmsAutofillMethod.smsUserConsentApi,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              textInputAction: TextInputAction.next,
              focusNode: focusNode,
              autofocus: true,
              controller: Controller.sms,
              onChanged: (code) {},
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              onCompleted: (pin) => debugPrint(pin),
            ),
            SizedBox(height: he(32)),
            ElevatedButton(
                style: AppButtonStyle
                    .instance.buttonStyleBorder8ColorPrimaryHe36Wi320,
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
                  onTap: () async {
                    await FirebaseAuth.instance.signInWithCredential(
                      PhoneAuthProvider.credential(
                        verificationId: FirebaseService.id,
                        smsCode: Controller.sms.text,
                      ),
                    );
                    
                    Controller.sms.clear();
                    focusNode.unfocus();
                    Navigator.pushNamed(context, AppRoutes.mapViews);
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
