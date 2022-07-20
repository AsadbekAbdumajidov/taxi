import 'package:flutter/material.dart';
import 'package:taxi_app/core/themes/styles.dart';

class ChooseLocation extends StatelessWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "You route",
            style: AppTextStyle.instance.styleW800S20Black,
          ),
          leading: IconButton(
            splashRadius: 24,
            onPressed: () {},
            icon: const Icon(Icons.highlight_remove),
          ),
          actions: [
            IconButton(
                splashRadius: 24, onPressed: () {}, icon: const Icon(Icons.add))
          ]),
      body: Column(
        children: [],
      ),
    );
  }
}
