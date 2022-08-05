import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SnackBar extends StatelessWidget {
  const SnackBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('SnackBar',
          style: TextStyle(color: Colors.amberAccent, fontSize: 30)),
    );
  }
}

getSnackBar() {
  Get.snackbar('hello friens', 'i am snackBar',
      backgroundColor: Colors.orangeAccent,
      colorText: Colors.red,
      duration: Duration(seconds: 1),
      isDismissible: true,
      dismissDirection: DismissDirection.vertical,
      snackPosition: SnackPosition.BOTTOM,
      showProgressIndicator: true);
}
