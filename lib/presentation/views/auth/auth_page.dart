import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/core/routes/app_routes.dart';
import 'package:taxi_app/core/services/firebase_auth.dart';
import 'package:taxi_app/core/themes/button_styles.dart';
import 'package:taxi_app/core/themes/colors.dart';
import 'package:taxi_app/core/themes/styles.dart';
import 'package:taxi_app/presentation/components/controller.dart';
import 'package:taxi_app/presentation/components/size_konfig.dart';
import 'package:taxi_app/presentation/views/_widgets/text_field_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);
  static var formKey = GlobalKey<FormState>();

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.instance.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: AuthPage.formKey,
              child: Column(
                children: [
                  SizedBox(height: he(80)),
                  Text(
                    "Enter your number",
                    style: AppTextStyle.instance.styleBlackW600S20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: he(20)),
                    child: CustomPrefixTextField(
                        textEditingController: Controller.phone,
                        onChange: (v) {},
                        validator: (value) {
                          if (Controller.phone.text.isEmpty) {
                            return "Do not leave a Phone Number!";
                          } else if (Controller.phone.text.length != 9) {
                            return "Error number entered !";
                          }
                          return null;
                        },
                        hintText: "Enter Phone number",
                        prefixIcon: CountryCodePicker(
                          onChanged: (code) {},
                          initialSelection: 'IT',
                          favorite: const ['+39', 'FR'],
                          showFlag: false,
                          onInit: (code) {},
                        ),
                        textInputType: TextInputType.number),
                  ),
                  ElevatedButton(
                      style: AppButtonStyle
                          .instance.buttonStyleBorder8ColorPrimaryHe36Wi320,
                      onPressed: () {
                        if (AuthPage.formKey.currentState!.validate()) {
                          debugPrint(Controller.phone.text);
                          Navigator.pushNamed(context, AppRoutes.verifyPage);
                        }
                      },
                      child: Text("Send code",
                          style: AppTextStyle.instance.styleWhiteW600S16)),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: he(21)),
                    child: Text(
                        "_________________________  OR  _________________________",
                        style: AppTextStyle.instance.styleBlackW500S14),
                  ),
                  OutlinedButton(
                      style:
                          AppButtonStyle.instance.buttonStyleBorder8He36Wi101,
                      onPressed: () {
                        FirebaseService().signInWithGoogle().then((value) =>
                            Navigator.pushNamed(context, AppRoutes.mapViews));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/png/google_logo.png",
                            height: he(25),
                          ),
                          SizedBox(width: wi(21)),
                          Text("Sign in with Google",
                              style: AppTextStyle.instance.styleBlackW600S16),
                        ],
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: he(20)),
              child: Text(
                  "If you are creating a new account, Terms & Conditions and Privacy Policy will aply",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.instance.styleBlackW500S14),
            ),
          ],
        ),
      ),
    );
  }
}
