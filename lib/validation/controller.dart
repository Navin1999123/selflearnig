import 'package:flutter/material.dart';
import 'package:get/get.dart';

class formController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController emailController, passwordController;
  var email = '';
  var password = '';
  @override
  void onInit() {
    emailController = TextEditingController();

    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void OnClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  String? validateEmail(String value) {
    debugPrint('Is Email :: ${value.isEmail}');
    if (!value.isEmail) {
      return 'please Enter your email';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 8) {
      return ' password must be of 8 charecters';
    }
    return null;
  }

  void checkLogin() {
    if (loginFormKey.currentState!.validate()) {
      return;
    }
    loginFormKey.currentState!.save();
  }
}
