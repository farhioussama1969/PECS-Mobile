import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pecs_mobile/app/modules/localStorage.dart';

class UserInfoController extends GetxController {
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  late TextEditingController fullNameController;
  late TextEditingController ageController;
  late TextEditingController addressController;
  late TextEditingController phoneController;
  late TextEditingController ratingController;

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

  Future<void> loadData() async {
    print('Date load started');
    fullName = (await LocalStorage().read('fullName'))!;
    age = (await LocalStorage().read('age'))!;
    address = (await LocalStorage().read('address'))!;
    phone = (await LocalStorage().read('phone'))!;
    rating = (await LocalStorage().read('rating'))!;

    fullNameController.text = (await LocalStorage().read('fullName'))!;
    ageController.text = (await LocalStorage().read('age'))!;
    phoneController.text = (await LocalStorage().read('phone'))!;
    addressController.text = (await LocalStorage().read('address'))!;
    ratingController.text = (await LocalStorage().read('rating'))!;

    print(fullName);
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
    Get.back();
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    fullNameController = TextEditingController();
    ageController = TextEditingController();
    addressController = TextEditingController();
    phoneController = TextEditingController();
    ratingController = TextEditingController();
    loadData();
  }

  @override
  void onReady() {
    super.onReady();

    print('rating: ' + ratingController.text);
  }

  @override
  void onClose() {
    fullNameController.dispose();
    ageController.dispose();
    addressController.dispose();
    phoneController.dispose();
    ratingController.dispose();
  }
}
