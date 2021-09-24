import 'package:dropdown_sample3_210917/src/controller/dropdown_button_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropdownButtonWidget extends GetView<DropDownButtonController> {
  const DropdownButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButton<dynamic>(
        value: controller.currentItem.value.index,
        onChanged: (var value) {
          controller.changeDropDownMenu(value);
        },
        items: DropDownMenu.values
            .map(
              (menu) => DropdownMenuItem(
                value: menu.index,
                child: Text(menu.name),
              ),
            )
            .toList(),
        // items: [
        //   DropdownMenuItem(
        //     value: 0,
        //     child: Text("메뉴1"),
        //   ),
        //   DropdownMenuItem(
        //     value: 1,
        //     child: Text("메뉴2"),
        //   ),
        // ],
      ),
    );
  }
}
