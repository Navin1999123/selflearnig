import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottemSheet extends StatelessWidget {
  const BottemSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text('data'),
        ),
        ListTile(
          leading: Icon(Icons.wb_sunny_outlined),
          title: Text('Light'),
          onTap: () => {Get.changeTheme(ThemeData.light())},
        ),
        ListTile(
            leading: Icon(Icons.wb_sunny),
            title: Text('Dark'),
            onTap: () => {Get.changeTheme(ThemeData.dark())}),
      ]),
    );
  }
}
