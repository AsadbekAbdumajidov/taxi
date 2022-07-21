import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/core/routes/app_routes.dart';
import 'package:taxi_app/core/themes/button_styles.dart';
import 'package:taxi_app/core/themes/colors.dart';
import 'package:taxi_app/core/themes/styles.dart';
import 'package:taxi_app/presentation/components/size_konfig.dart';
import 'package:taxi_app/presentation/views/_widgets/text_field_widget.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);
  final controller = TextEditingController();

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
            Column(
              children: [
                SizedBox(height: he(80)),
                Text(
                  "Enter your number",
                  style: AppTextStyle.instance.styleBlackW600S20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: he(20)),
                  child: CustomPrefixTextField(
                      textEditingController: controller,
                      onChange: (v) {},
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
                        .instance.buttonStyleBorder8ColorPrimaryHe36Wi101,
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.verifyPage,
                          arguments: controller.text.toString());
                    },
                    child: Text("Sign in",
                        style: AppTextStyle.instance.styleWhiteW600S16)),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: he(21)),
                  child: Text(
                      "_________________________  OR  _________________________",
                      style: AppTextStyle.instance.styleBlackW500S14),
                ),
                OutlinedButton(
                    style: AppButtonStyle.instance.buttonStyleBorder8He36Wi101,
                    onPressed: () {},
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
