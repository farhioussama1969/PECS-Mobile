import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../localStorage.dart';

class SignUpController extends GetxController {
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  var fullName = '';
  var age = '';
  var address = '';
  var phone = '';
  var rating = '';

  void saveFullName(String value) {
    fullName = value;
  }

  void saveAge(String value) {
    age = value;
  }

  void saveAddress(String value) {
    address = value;
  }

  void savePhone(String value) {
    phone = value;
  }

  void saveRating(String value) {
    rating = value;
  }

  String? fullNameValidation(String value) {
    if (value.isEmpty) {
      return 'الرجاء إدخال الاسم';
    }
    if (value.length < 3) {
      return 'الرجاء إدخال اسم صحيح';
    }
  }

  String? ageValidation(String value) {
    if (value.isEmpty) {
      return 'الرجاء إدخال العمر';
    }
  }

  String? addressValidation(String value) {
    if (value.isEmpty) {
      return 'الرجاء إدخال العنوان';
    }
    if (value.length < 3) {
      return 'الرجاء إدخال عنوان صحيح';
    }
  }

  String? phoneValidation(String value) {
    if (value.isEmpty) {
      return 'الرجاء إدخال رقم الهاتف';
    }
    if (value.length != 10) {
      return 'الرجاء إدخال رقم هاتف صحيح';
    }
  }

  String? ratingValidation(String value) {
    if (value.isEmpty) {
      return 'الرجاء إدخال التقييم';
    }
  }

  void save() {
    if (!signUpFormKey.currentState!.validate()) {
      return;
    }
    signUpFormKey.currentState!.save();
    LocalStorage().save('fullName', fullName);
    LocalStorage().save('age', age);
    LocalStorage().save('address', address);
    LocalStorage().save('phone', phone);
    LocalStorage().save('rating', rating);
    Get.offAllNamed(Routes.HOME);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
