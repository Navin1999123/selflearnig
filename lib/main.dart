import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxlern/bottemSheet.dart';
import 'package:getxlern/counter_Controller.dart';
import 'package:getxlern/pagination.dart';
import 'package:getxlern/validation/approute.dart';
import 'package:getxlern/validation/form.dart';
import 'package:getxlern/validation/login_view.dart';

import 'dialog/dialog.dart';
import 'snackbar/snackbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  CounterController controller = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.INITIAL,
        // getPages: [
        //   GetPage(name: '/nextScreen', page: () => NextScreen()),
        //   GetPage(
        //       name: '/scrollControllerDemo', page: () => ScrollControllerDemo()),
        // ],
        getPages: AppPages.routes,
        title: 'name',
        home: LoginView());
  }
}

class Model {
  String name;
  Model({required this.name});
}

class HomePageController extends GetxController {
  List<Model> list = [];
  ScrollController controller = ScrollController();
  int listLength = 6;
  void onInit() {
    generateList();
    addItems();
    super.onInit();
  }

  addItems() async {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        for (int i = 0; i < 2; i++) {
          listLength++;
          list.add(Model(name: (listLength).toString()));

          update();
        }
      }
    });
  }

  generateList() {
    list = List.generate(
        listLength, (index) => Model(name: (index + 1).toString()));
    print('######3' + listLength.toString());
  }
}

class SecondPage extends StatelessWidget {
  SecondPage({Key? key}) : super(key: key);

  HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<HomePageController>(
      init: homePageController,
      builder: (value) => ListView.builder(
        controller: value.controller,
        itemCount: value.list.length,
        itemBuilder: (context, index) {
          if (index == homePageController) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Color.fromARGB(255, 54, 244, 235),
              height: 100,
              child: Center(
                child: Text(value.list[index].name),
              ),
            ),
          );
        },
      ),
    ));
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListDataList data = Get.put(ListDataList());

    return Scaffold(
        appBar: AppBar(
          title: Text('${Get.arguments}'),
        ),
        body: Center(
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                ),
                child: Column(children: [
                  Expanded(
                    flex: 8,
                    child: GetBuilder<ListDataList>(
                      builder: (_dx) => ListView.builder(
                          itemCount: data.numbers.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text('Number: ${data.numbers[index]}'),
                            );
                          }),
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RaisedButton(
                            child: Text('Data Request'),
                            onPressed: data.httpCall,
                          ),
                          RaisedButton(
                            child: Text('Reset'),
                            onPressed: data.reset,
                          )
                        ],
                      ))
                ]))));
  }
}

class ListDataList extends GetxController {
  List<int> numbers = List<int>.from([0, 1, 2, 3, 4]);

  void httpCall() async {
    await Future.delayed(
        Duration(seconds: 1), () => numbers.add(numbers.last + 1));
    update();
  }

  void reset() {
    numbers = numbers.sublist(0, 4);
    update();
  }
}
