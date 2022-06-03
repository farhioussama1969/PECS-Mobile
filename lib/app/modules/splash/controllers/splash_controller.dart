import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../localStorage.dart';

class SplashController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
    await Future.delayed(Duration(seconds: 5));
    if (await LocalStorage().isSaved('fullName')) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.SIGN_UP);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
