import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dialog extends StatelessWidget {
  const Dialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('SnackBar',
          style: TextStyle(color: Colors.amberAccent, fontSize: 30)),
    );
  }
}

showDialogBox() {
  return Get.defaultDialog(
      title: 'hello friens',
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [CircularProgressIndicator(), Text('wait..')],
      ));
}
