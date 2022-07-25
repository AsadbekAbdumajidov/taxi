import 'package:flutter/material.dart';
import 'package:taxi_app/core/themes/button_styles.dart';
import 'package:taxi_app/core/themes/colors.dart';
import 'package:taxi_app/core/themes/styles.dart';
import 'package:taxi_app/presentation/components/size_konfig.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

final TextEditingController nameF = TextEditingController();
final TextEditingController nameL = TextEditingController();
final TextEditingController phone = TextEditingController();

class _EditProfileState extends State<EditProfile> {
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
        ),
        title: Text("Edit Profile",
            style: AppTextStyle.instance.styleBlackW600S16),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [Stack(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColors.instance.greeySearch,
                  child: Icon(
                    Icons.person,
                    size: he(35),
                    color: AppColors.instance.darkGrey,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: AppColors.instance.primaryColor,
                    child: Icon(
                      Icons.photo_camera_outlined,
                      size: he(15),
                      color: AppColors.instance.white,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: he(20)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "First name",
                  style: AppTextStyle.instance.styleBlackW600S16,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: he(8)),
                    child: TExtFieldWidget(
                        controller: nameF,
                        hinTex: "Enter first name",
                        icon: Icons.person)),
                SizedBox(height: he(8)),
                Text("Last name",
                    style: AppTextStyle.instance.styleBlackW600S16),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: he(8)),
                    child: TExtFieldWidget(
                        controller: nameL,
                        hinTex: "Enter last name",
                        icon: Icons.person)),
                SizedBox(height: he(8)),
                Text("Phone number",
                    style: AppTextStyle.instance.styleBlackW600S16),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: he(8)),
                    child: TExtFieldWidget(
                        controller: phone,
                        hinTex: "Enter phone number",
                        icon: Icons.phone)),
                SizedBox(height: he(16)),
                Text(
                    "Your phone number can't be changed. If you want to link your account to another phone number, please contact",
                    style: AppTextStyle.instance.styleBlackW500S14)
              ],
            ),
            ],),
            ElevatedButton(
                style: AppButtonStyle
                    .instance.buttonStyleBorder8ColorPrimaryHe36Wi101,
                onPressed: () {},
                child: Text("Upload",
                    style: AppTextStyle.instance.styleWhiteW600S16))
          ],
        ),
      ),
    );
  }
}

class TExtFieldWidget extends StatefulWidget {
  const TExtFieldWidget(
      {Key? key,
      required this.controller,
      required this.hinTex,
      required this.icon})
      : super(key: key);
  final TextEditingController controller;
  final String hinTex;
  final IconData icon;
  @override
  State<TExtFieldWidget> createState() => _TExtFieldWidgetState();
}

class _TExtFieldWidgetState extends State<TExtFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {},
      textInputAction: TextInputAction.done,
      controller: widget.controller,
      readOnly: false,
      autofocus: false,
      onChanged: (words) {},
      decoration: InputDecoration(
        hintText: widget.hinTex,
        prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(widget.icon, color: AppColors.instance.primaryColor)),
        contentPadding: EdgeInsets.zero,
        filled: true,
        fillColor: AppColors.instance.white,
        border: inputBorderActive(),
        focusedBorder: inputBorderActive(),
        enabledBorder: inputBorderPassive(),
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
