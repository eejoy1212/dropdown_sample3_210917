import 'package:dropdown_sample3_210917/src/components/custom_drop_down_button.dart';
import 'package:dropdown_sample3_210917/src/controller/dropdown_button_controller.dart';
import 'package:dropdown_sample3_210917/src/pages/default_page.dart';
import 'package:dropdown_sample3_210917/src/pages/page1.dart';
import 'package:dropdown_sample3_210917/src/pages/page2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends GetView<DropDownButtonController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("드롭다운 메뉴 샘플"),
      ),
      body: Column(
        children: [
          // DropdownButtonWidget(),
          // PopupMenuButtonWidget(),
          CustomDropDownButton(
            key: controller.dropKey,
          ),
          Expanded(
            child: Obx(
              () {
                switch (controller.currentItem.value) {
                  case DropDownMenu.DEFAULT:
                    return DefaultPage();
                  case DropDownMenu.MENU1:
                    return Page1();
                  case DropDownMenu.MENU2:
                    return Page2();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
