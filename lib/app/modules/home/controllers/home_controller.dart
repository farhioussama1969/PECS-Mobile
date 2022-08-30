import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pecs_mobile/app/modules/localStorage.dart';

import 'model.dart';

class HomeController extends GetxController {
  var fullName = ''.obs;

  AudioPlayer audioPlayer = AudioPlayer();

  var reset = true.obs;

  var selectedAction = 0.obs;
  var selectedCategory = 9999.obs;
  var selectedItem = 9999.obs;

  void selectAction(int index) {
    selectedAction.value = index;
    restItem();
  }

  void selectCategory(int index) {
    selectedCategory.value = index;
  }

  void selectItem(int index) {
    reset(false);
    selectedItem.value = index;
  }

  void restItem() {
    reset(true);
    selectedItem.value = 9999;
  }

  Map<String, dynamic> data = {
    "data": [
      {
        "name": "أنا أريد",
        "categories": [
          {
            "name": "ألعاب",
            "image": "2.png",
            "items": [
              {
                'name': 'دمية',
                'audio': 'انا اريد الدمية.mp3',
                'image': '2.png',
              },
              {
                'name': 'كرة',
                'audio': 'انا اريد الكرة.mp3',
                'image': '4.png',
              },
              {
                'name': 'التلفاز',
                'audio': 'أنا أريد التلفاز .mp3',
                'image': 'tv.jpeg',
              },
              {
                'name': 'الحاسوب',
                'audio': 'أنا أريد الحاسوب.mp3',
                'image': 'computer.jpeg',
              },
              {
                'name': 'الدراجة',
                'audio': 'أنا أريد الدراجة .mp3',
                'image': 'bicycle.png',
              },
              {
                'name': 'الشطرنج',
                'audio': 'أنا أريد الشطرنج .mp3',
                'image': 'chess.jpeg',
              },
              {
                'name': 'الهاتف',
                'audio': 'أنا أريد الهاتف .mp3',
                'image': 'phone.png',
              },
              {
                'name': 'بطاقات اللعب',
                'audio': 'أنا أريد بطاقات اللعب .mp3',
                'image': 'playcard.jpeg',
              },
            ]
          },
          {
            "name": "أكل",
            "image": "1.png",
            "items": [
              {
                'name': 'تفاح',
                'audio': 'انا اريد التفاح.mp3',
                'image': '1.png',
              },
              {
                'name': 'عصير',
                'audio': 'انا اريد العصير.mp3',
                'image': '3.png',
              },
              {
                'name': 'مثلجات',
                'audio': 'انا أريد المثلجات.mp3',
                'image': '5.png',
              },
              //new items
              {
                'name': 'خبز',
                'audio': 'bread.mp3',
                'image': 'bred.jpeg',
              },
              {
                'name': 'بيض',
                'audio': 'أنا أريد البيض.mp3',
                'image': 'egg.jpeg',
              },
              {
                'name': 'جبن',
                'audio': 'أنا أريد الجبن .mp3',
                'image': 'cheese.jpeg',
              },
              {
                'name': 'حليب',
                'audio': 'أنا أريد الحليب.mp3',
                'image': 'milk.jpeg',
              },
              {
                'name': 'زبادي',
                'audio': 'أنا أريد الزبادي.mp3',
                'image': 'yogurt.jpeg',
              },
              {
                'name': 'شوكولاتة',
                'audio': 'أنا أريد الشوكولاته .mp3',
                'image': 'chocolate.jpeg',
              }
            ]
          },
          {
            "name": "ملابس",
            "image": "3.png",
            "items": [
              {
                'name': 'معطف',
                'audio': 'انا اريد المعطف.mp3',
                'image': '6.png',
              },
            ]
          }
        ]
      },
      {
        "name": "أنا أرى",
        "categories": [
          {
            "name": "ألعاب",
            "image": "2.png",
            "items": [
              {
                'name': 'دمية',
                'audio': 'أنا أرى الدمية.mp3',
                'image': '2.png',
              },
              {
                'name': 'كرة',
                'audio': 'انا ارى الكرة.mp3',
                'image': '4.png',
              },
            ]
          },
          {
            "name": "ملابس",
            "image": "3.png",
            "items": [
              {
                'name': 'قبعة',
                'audio': 'أنا أرى القبعة.mp3',
                'image': '7.png',
              },
            ]
          }
        ]
      },
      {
        "name": "أنا أسمع",
        "categories": [
          {
            "name": "العائلة",
            "image": "4.png",
            "items": [
              {
                'name': 'أبي',
                'audio': 'انا اسمع صوت ابي.mp3',
                'image': '8.png',
              },
              {
                'name': 'أمي',
                'audio': 'انا اسمع صوت امي.mp3',
                'image': '16.png',
              },
              {
                'name': 'أخي',
                'audio': 'انا اسمع صوت اخي.mp3',
                'image': '10.png',
              },
              {
                'name': 'أختي',
                'audio': 'انا اسمع صوت اختي.mp3',
                'image': '11.png',
              },
            ]
          },
          {
            "name": "مركبات",
            "image": "5.png",
            "items": [
              {
                'name': 'دراجة نارية',
                'audio': 'انا اسمع صوت الدراجة النارية.mp3',
                'image': '14.png',
              },
              {
                'name': 'سيارة',
                'audio': 'انا اسمع صوت السيارة.mp3',
                'image': '12.png',
              },
              {
                'name': 'قطار',
                'audio': 'انا اسمع صوت القطار.mp3',
                'image': '13.png',
              },
            ]
          }
        ]
      },
      {
        "name": "أنا أشعر",
        "categories": [
          {
            "name": "الأحاسيس",
            "image": "6.png",
            "items": [
              {
                'name': 'البرد',
                'audio': 'أنا أشعر بالبرد.mp3',
                'image': 'cold.jpeg',
              },
              {
                'name': 'الحر',
                'audio': 'أنا أشعر بالحر.mp3',
                'image': 'hot.jpg',
              },
              {
                'name': 'الخوف',
                'audio': 'أنا أشعر بالخوف.mp3',
                'image': 'afraid.jpeg',
              },
              {
                'name': 'السعادة',
                'audio': 'أنا أشعر بالسعادة.mp3',
                'image': 'happy.jpeg',
              },
              {
                'name': 'الغضب',
                'audio': 'أنا أشعر بالغضب.mp3',
                'image': 'angry.jpeg',
              },
              {
                'name': 'المرض',
                'audio': 'أنا أشعر بالمرض.mp3',
                'image': 'ill.jpeg',
              },
              {
                'name': 'الملل',
                'audio': 'أنا أشعر بالملل.mp3',
                'image': 'bored.jpeg',
              },
              {
                'name': 'النعاس',
                'audio': 'أنا أشعر بالنعاس.mp3',
                'image': 'sleepy.jpeg',
              },
            ]
          },
        ]
      }
    ]
  };

  Rx<Model?> dataModel = Model().obs;

  playSound(String? fileName) async {
    ByteData bytes = await rootBundle.load('assets/audio/${fileName}');
    Uint8List soundbytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    int result = await audioPlayer.playBytes(soundbytes);
  }

  Future<void> textToVoice() async {}

  @override
  void onInit() async {
    super.onInit();
    fullName.value = (await LocalStorage().read('fullName'))!;
    dataModel.value = Model.fromJson(data);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
