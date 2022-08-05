import 'package:get/state_manager.dart';

class CounterController extends GetxController {
  RxInt counter = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void increment() {
    counter = counter++;
    print(counter);
    update();
  }

  decrement() {
    if (counter > 0) {
      return counter--;
    } else {
      counter;
      update();
    }
  }
}
