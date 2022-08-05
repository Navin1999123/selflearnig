import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxlern/validation/form.dart';

import 'login_view.dart';

class AppPages {
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: HomeBinding(),
    ),
  ];
}

// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
}

abstract class _Paths {
  static const HOME = '/home';

  static const LOGIN = '/login';
}
