import 'package:food_delivery/app/modules/home/binding/main_hopital_binding.dart';
import 'package:food_delivery/app/modules/home/views/main_hopital_page.dart';
import 'package:food_delivery/app/modules/login/views/login_page.dart';
import 'package:food_delivery/app/modules/splash/views/splash_screen.dart';
import 'package:get/get.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.MAIN,
      page: () => MainHopitalPage(),
      binding: MainHopitalBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginPage(),
    ),
  ];
}
