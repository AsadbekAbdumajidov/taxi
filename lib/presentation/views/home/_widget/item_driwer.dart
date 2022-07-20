import 'package:flutter/material.dart';
import 'package:taxi_app/core/themes/styles.dart';
import 'package:taxi_app/presentation/components/size_konfig.dart';

class ItemDriwer extends StatelessWidget {
   const ItemDriwer(
      { Key? key, required this.title, required this.ontap, required this.icon})
      : super(key: key);
  final String title;
  final IconData icon;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: wi(8)),
      child: ListTile(
          onTap: ontap,
          title: Text(title, style: AppTextStyle.instance.styleBlackW700S14),
          
          leading: Icon(
            icon,
            size: he(30),
          )),
    );
  }
}
