import 'dart:convert';
import 'dart:io';
import 'package:chat_openai_getx/screens/application/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../common/constants/app_constant.dart';

class ApplicationController extends GetxController {
  ApplicationState state = ApplicationState();

  final textEditingController = TextEditingController();
  late FixedExtentScrollController picScrollController;

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

  Future<void> feachmModel() async {
    var url = Uri.parse("$BASE_URL/models");
    try {
      var res =
          await http.get(url, headers: {'Authorization': 'Bearer $MY_TOKEN'});
      Map jesonRes = jsonDecode(res.body);
      for (var value in jesonRes["data"]) {
        state.picItems.add(value["id"]);
      }
    } catch (e) {
      print("err:$e");
    }
  }

  // Chat messages
  Future<void> feachTheChat() async {
    var url = Uri.parse("$BASE_URL/completions");
    try {
      var re = textEditingController.text;
      print("Zubair: $re");
      var res = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $MY_TOKEN',
          },
          body: jsonEncode({
            "model": state.picItems[state.picItemIndex.value].toString(),
            "prompt": textEditingController.text,
            "temperature": 0,
            "max_tokens": 1000
          }));

      Map jesonRes = jsonDecode(res.body);
      //errer message
      if (jesonRes["error"] != null) {
        throw HttpException(jesonRes["errer"]["message"]);
      }
      // empty respose. choices length >0
      // if (jesonRes["choices"].lenght > 0) {
      //   print(jesonRes);
      // }
      // for (var value in jesonRes["data"]) {
      //   state.picItems.add(value["id"]);
      // }
      print(jesonRes);
    } catch (e) {
      print("err:$e");
    }
  }

  picScrollControllerInit() {
    picScrollController =
        FixedExtentScrollController(initialItem: state.picItemIndex.value);
  }

  @override
  void onInit() {
    picScrollController =
        FixedExtentScrollController(initialItem: state.picItemIndex.value);
    feachmModel();
    super.onInit();
  }

  @override
  void dispose() {
    picScrollController.dispose();
    super.dispose();
  }
}
