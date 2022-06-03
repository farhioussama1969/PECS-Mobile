import 'package:get/get.dart';

import 'package:pecs_mobile/app/modules/home/bindings/home_binding.dart';
import 'package:pecs_mobile/app/modules/home/views/home_view.dart';
import 'package:pecs_mobile/app/modules/sign up/bindings/sign_up_binding.dart';
import 'package:pecs_mobile/app/modules/sign up/views/sign_up_view.dart';
import 'package:pecs_mobile/app/modules/splash/bindings/splash_binding.dart';
import 'package:pecs_mobile/app/modules/splash/views/splash_view.dart';
import 'package:pecs_mobile/app/modules/user info/bindings/user_info_binding.dart';
import 'package:pecs_mobile/app/modules/user info/views/user_info_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.USER_INFO,
      page: () => UserInfoView(),
      binding: UserInfoBinding(),
    ),
  ];
}
