import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxlern/validation/controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<formController>(
      () => formController(),
    );
  }
}

class HomeView extends GetView<formController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('  ${Get.arguments}')),
      body: Form(
        key: controller.loginFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller.emailController,
                onSaved: (value) {
                  controller.email = value!;
                },
                validator: (value) {
                  return controller.validateEmail(value!);
                },
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    hintText: 'Enter Your Email ',
                    labelText: 'Email*'),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controller.passwordController,
                onSaved: (value) {
                  controller.password = value!;
                },
                validator: (value) {
                  return controller.validatePassword(value!);
                },
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    hintText: 'Enter Your Password ',
                    labelText: 'Password*'),
              ),
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  controller.checkLogin();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.greenAccent),
                  child: Text('Submit'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
