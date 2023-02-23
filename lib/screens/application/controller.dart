import 'package:chat_openai_getx/screens/application/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplicationController extends GetxController {
  ApplicationState state = ApplicationState();

  final textEditingController = TextEditingController();
  late FixedExtentScrollController picScrollController;

  hidetext() {
    state.isTyping.value = !state.isTyping.value;
  }

  List<Widget>? get getModelItems {
    List<Widget>? modelsItems = List<Widget>.generate(
        state.picItems.length,
        (index) => Center(
              child: Text(
                state.picItems[index],
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ));

    return modelsItems;
  }
  picScrollControllerInit(){
    picScrollController =
        FixedExtentScrollController(initialItem: state.picItemIndex.value);
  }
  @override
  void onInit() {
    picScrollController =
        FixedExtentScrollController(initialItem: state.picItemIndex.value);
    super.onInit();
  }

  @override
  void dispose() {
    picScrollController.dispose();
    super.dispose();
  }
}
