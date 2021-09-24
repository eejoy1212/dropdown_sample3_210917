import 'package:dropdown_sample3_210917/src/controller/dropdown_button_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopupMenuButtonWidget extends GetView<DropDownButtonController> {
  const PopupMenuButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      offset: Offset(0, 52),
      shape: ShapeBorder.lerp(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50))),
          0),
      onSelected: (int value) {
        controller.changeDropDownMenu(value);
      },
      elevation: 0,
      itemBuilder: (BuildContext context) {
        return DropDownMenu.values
            .map(
              (menu) => PopupMenuItem(
                value: menu.index,
                child: Text(menu.name),
              ),
            )
            .toList();
      },
      child: Obx(
        () => Container(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Text(controller.currentItem.value.name),
              Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }
}
