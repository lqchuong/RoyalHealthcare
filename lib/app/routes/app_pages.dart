import 'package:food_delivery/app/modules/home/binding/main_binding.dart';
import 'package:food_delivery/app/modules/home/views/main_page.dart';
import 'package:food_delivery/app/modules/login/views/login_page.dart';
import 'package:food_delivery/app/modules/login/views/otp_page.dart';
import 'package:food_delivery/app/modules/register/views/register_persional.dart';
import 'package:food_delivery/app/modules/splash/views/splash_screen.dart';
import 'package:food_delivery/app/modules/user/views/user_page.dart';
import 'package:get/get.dart';

import '../modules/register/views/register_HealthCheck.dart';
import '../modules/register/views/register_list.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: _Paths.MAIN,
      page: () => MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OtpPage(),
    ),
    GetPage(
      name: _Paths.USERPAGE,
      page: () => UserPage(),
    ),
    GetPage(
      name: _Paths.REGISTERPERSIONAL,
      page: () => RegisterPersion(),
    ),
    GetPage(
      name: _Paths.REGISTERHEALTHCHECK,
      page: () => RegisterHealthCheck(),
    ),
    GetPage(
        name: _Paths.REGISTERLIST,
        page: () => RegisterList())
  ];
}
