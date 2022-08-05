import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxlern/counter_Controller.dart';

import '../bottemSheet.dart';
import '../dialog/dialog.dart';
import '../main.dart';
import '../pagination.dart';
import '../snackbar/snackbar.dart';
import 'approute.dart';

class LoginView extends StatelessWidget {
  // const LoginView({Key? key}) : super(key: key);
  CounterController controller = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Obx(
              () => Center(
                  child: Text(
                "${controller.counter}",
                // 'Hello',
                style: TextStyle(fontSize: 30),
              )),
            ),
            Wrap(
              children: [
                ElevatedButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      controller.increment();
                    }),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    child: Icon(Icons.remove),
                    onPressed: () {
                      controller.decrement();
                    }),
              ],
            ),
            // Spacer(),

            SizedBox(
              height: 50,
            ),
            Container(
              color: Colors.blue,
              child: InkWell(
                child: Text('Next Page '),
                onTap: () {
                  Get.to(NextScreen(), arguments: 'hello friends');
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: InkWell(
                child: Text('Second Page '),
                onTap: () {
                  Get.to(ScrollControllerDemo());
                  // Get.toNamed<void>(
                  //   "/scrollControllerDemo",
                  // );
                },
              ),
              color: Colors.blue,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.blue,
              child: InkWell(
                  child: Text('SnackBar'),
                  onTap: (() {
                    getSnackBar();
                  })),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.blue,
              child: InkWell(
                child: Text('Dialog'),
                onTap: (() {
                  showDialogBox();
                }),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: InkWell(
                child: Text('BottemSheet '),
                onTap: () {
                  Get.bottomSheet(
                    BottemSheet(),
                    enableDrag: true,
                    barrierColor: Colors.amberAccent.shade100,
                    backgroundColor: Colors.purpleAccent,
                    isDismissible: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                },
              ),
              color: Colors.blue,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.blue,
              child: InkWell(
                  child: Text('Validtion'),
                  onTap: (() {
                    Get.toNamed(Routes.HOME, arguments: 'Form Validation');
                  })),
            )
          ],
        ),
      ),
    );
  }
}
