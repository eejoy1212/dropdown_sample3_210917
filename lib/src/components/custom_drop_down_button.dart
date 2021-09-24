import 'package:dropdown_sample3_210917/src/controller/dropdown_button_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropDownButton extends GetView<DropDownButtonController> {
  const CustomDropDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          DropDownList(),
          opaque: false,
          transition: Transition.fadeIn,
        );
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

class DropDownList extends GetView<DropDownButtonController> {
  const DropDownList({Key? key}) : super(key: key);

  Widget _dropDownList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: DropDownMenu.values
          .map(
            (menu) => GestureDetector(
              onTap: () {
                controller.changeDropDownMenu(menu.index);
                Get.back();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                color: controller.currentItem.value.index == menu.index
                    ? Colors.pink[300]
                    : Colors.white,
                child: Text(menu.name),
              ),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 0,
              child: GestureDetector(
                onTap: Get.back,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: controller.dropdownPositionY,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                child: Container(
                  color: Colors.white,
                  child:
                      Container(width: Get.size.width, child: _dropDownList()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
