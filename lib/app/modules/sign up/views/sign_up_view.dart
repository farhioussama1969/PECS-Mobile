import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 50),
              Row(
                children: [
                  Text(
                    'معلومات الطفل',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: controller.signUpFormKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'الاسم كاملا',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onSaved: (value) {
                          controller.saveFullName(value!);
                        },
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          return controller.fullNameValidation(value!);
                        },
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        decoration: InputDecoration(
                          counterText: '',
                          hintText: 'أدخل اسم الطفل هنا'.tr,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 15,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.black26,
                            ),
                            gapPadding: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.black26,
                            ),
                            gapPadding: 10,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.black26,
                            ),
                            gapPadding: 10,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          'العمر',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onSaved: (value) {
                          controller.saveAge(value!);
                        },
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          return controller.ageValidation(value!);
                        },
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        decoration: InputDecoration(
                          counterText: '',
                          hintText: 'أدخل عمر الطفل هنا'.tr,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 15,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.black26,
                            ),
                            gapPadding: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.black26,
                            ),
                            gapPadding: 10,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.black26,
                            ),
                            gapPadding: 10,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          'عنوان المنزل',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onSaved: (value) {
                          controller.saveAddress(value!);
                        },
                        keyboardType: TextInputType.streetAddress,
                        validator: (value) {
                          return controller.addressValidation(value!);
                        },
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        maxLines: 3,
                        decoration: InputDecoration(
                          counterText: '',
                          hintText: 'أدخل عنوان الطفل هنا'.tr,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 15,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.black26,
                            ),
                            gapPadding: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.black26,
                            ),
                            gapPadding: 10,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.black26,
                            ),
                            gapPadding: 10,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          'رقم هاتف الوالد',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onSaved: (value) {
                          controller.savePhone(value!);
                        },
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        validator: (value) {
                          return controller.phoneValidation(value!);
                        },
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        decoration: InputDecoration(
                          counterText: '',
                          hintText: 'أدخل رقم هاتف والد الطفل هنا'.tr,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 15,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.black26,
                            ),
                            gapPadding: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.black26,
                            ),
                            gapPadding: 10,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.black26,
                            ),
                            gapPadding: 10,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          'تقييم الطفل',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onSaved: (value) {
                          controller.saveRating(value!);
                        },
                        keyboardType: TextInputType.multiline,
                        validator: (value) {
                          return controller.ratingValidation(value!);
                        },
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        maxLines: 10,
                        decoration: InputDecoration(
                          counterText: '',
                          hintText: 'أدخل تقييم الطفل هنا'.tr,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 15,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.black26,
                            ),
                            gapPadding: 10,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.black26,
                            ),
                            gapPadding: 10,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.black26,
                            ),
                            gapPadding: 10,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: double.infinity,
                      height: 55,
                      child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Colors.blueAccent,
                          ),
                          onPressed: () {
                            controller.save();
                          },
                          child: Text(
                            'حــفــظ',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ),
                    SizedBox(height: 25),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
