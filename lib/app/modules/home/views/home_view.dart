import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: Get.height,
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: Container(
                              child: Text(
                                'معلوماتي الشخصية',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onTap: () {
                              Get.toNamed(Routes.USER_INFO);
                            },
                          ),
                          GestureDetector(
                            onTap: () => Get.toNamed(Routes.USER_INFO),
                            child: Image.asset('assets/images/avatars/1.png',
                                width: 57),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Obx(() {
                      return Container(
                        height: 82,
                        child: ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.dataModel.value?.data?.length,
                            itemBuilder: (context, int index) {
                              return Obx(() {
                                return GestureDetector(
                                  onTap: () {
                                    controller.selectAction(index);
                                  },
                                  child: Container(
                                    width: 139,
                                    height: 82,
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    margin: EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(22),
                                      color: Color(0xFFFFEAD1),
                                      border: Border.all(
                                        color:
                                            controller.selectedAction.value ==
                                                    index
                                                ? Color(0xFFE64219)
                                                : Colors.transparent,
                                        width: 2,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${controller.dataModel.value?.data?[index].name}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              });
                            }),
                      );
                    }),
                    SizedBox(height: 20),
                    Divider(
                      color: Colors.black,
                      height: 3,
                      indent: 40,
                      endIndent: 40,
                    ),
                    SizedBox(height: 20),
                    Obx(() {
                      return Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 300,
                                    childAspectRatio: 2,
                                    mainAxisExtent: 123,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemCount: controller
                                .dataModel
                                .value
                                ?.data?[controller.selectedAction.value]
                                .categories
                                ?.length,
                            padding: EdgeInsets.only(
                                right: 20, left: 20, bottom: 190),
                            //shrinkWrap: true,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemBuilder: (BuildContext ctx, int index) {
                              return GestureDetector(
                                onTap: () {
                                  controller.selectCategory(index);
                                  itemsWindow(index);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFFffead1),
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Container(
                                          height: 70,
                                          width: 70,
                                          child: Image.asset(
                                              'assets/images/categories/${controller.dataModel.value?.data?[controller.selectedAction.value].categories?[index].image}'),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          '${controller.dataModel.value?.data?[controller.selectedAction.value].categories?[index].name}',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      );
                    }),
                  ],
                ),
              ),
              Container(
                height: Get.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (!controller.reset.value) {
                          controller.playSound(controller
                              .dataModel
                              .value
                              ?.data?[controller.selectedAction.value]
                              .categories?[controller.selectedCategory.value]
                              .items?[controller.selectedItem.value]
                              .audio);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        height: 34,
                        width: 82,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              spreadRadius: 0,
                              blurRadius: 2,
                              offset:
                                  Offset(0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'assets/images/icons/1.png',
                          width: 20,
                        ),
                      ),
                    ),
                    Container(
                      height: 130,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            spreadRadius: 0,
                            blurRadius: 2,
                            offset: Offset(0, 0), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() {
                            return Container(
                              height: double.infinity,
                              width: Get.width / 2 - 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: Color(0xFFFFEAD1),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    spreadRadius: 0,
                                    blurRadius: 2,
                                    offset: Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  controller.selectedAction.value == 9999
                                      ? '?'
                                      : '${controller.dataModel.value?.data?[controller.selectedAction.value].name}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            );
                          }),
                          Obx(() {
                            return Container(
                              height: double.infinity,
                              width: Get.width / 2 - 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: Color(0xFFFFEAD1),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    spreadRadius: 0,
                                    blurRadius: 2,
                                    offset: Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Visibility(
                                    child: Center(
                                      child: Container(
                                        child: Image.asset(controller
                                                    .selectedItem.value !=
                                                9999
                                            ? 'assets/images/items/${controller.dataModel.value?.data?[controller.selectedAction.value].categories?[controller.selectedCategory.value].items?[controller.selectedItem.value].image}'
                                            : 'assets/images/items/9.png'),
                                        width: 60,
                                        height: 60,
                                      ),
                                    ),
                                    visible:
                                        controller.selectedItem.value != 9999,
                                  ),
                                  Center(
                                    child: Text(
                                      controller.selectedItem.value == 9999
                                          ? '?'
                                          : '${controller.dataModel.value?.data?[controller.selectedAction.value].categories?[controller.selectedCategory.value].items?[controller.selectedItem.value].name}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void itemsWindow(int categoryIndex) {
    Get.bottomSheet(
      Container(
        height: 370,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        ),
        child: Column(
          children: [
            SizedBox(height: 30),
            Obx(() {
              return Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300,
                            childAspectRatio: 2,
                            mainAxisExtent: 123,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemCount: controller
                        .dataModel
                        .value
                        ?.data?[controller.selectedAction.value]
                        .categories?[categoryIndex]
                        .items
                        ?.length,
                    padding: EdgeInsets.only(right: 20, left: 20, bottom: 190),
                    //shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemBuilder: (BuildContext ctx, int index) {
                      return GestureDetector(
                        onTap: () {
                          controller.selectItem(index);
                          Get.back();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFffead1),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  child: Image.asset(
                                      'assets/images/items/${controller.dataModel.value?.data?[controller.selectedAction.value].categories?[categoryIndex].items?[index].image}'),
                                ),
                              ),
                              Center(
                                child: Text(
                                  '${controller.dataModel.value?.data?[controller.selectedAction.value].categories?[categoryIndex].items?[index].name}',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              );
            }),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }
}
