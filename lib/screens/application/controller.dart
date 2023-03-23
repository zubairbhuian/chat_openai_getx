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
  RxList myChatList = [].obs;
  late ScrollController listScrollController;
  late FocusNode focusNode;

void scrollStartToEnd(){
  listScrollController.animateTo(listScrollController.position.maxScrollExtent, duration: Duration(seconds: 2), curve:Curves.easeIn);
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

  Future feachmModel() async {
    var url = Uri.parse("$BASE_URL/models");
    try {
      var res =
          await http.get(url, headers: {'Authorization': 'Bearer $MY_TOKEN'});
      Map jesonRes = jsonDecode(res.body);
      for (var value in jesonRes["data"]) {
        state.picItems.add(value["id"]);
      }
    } catch (e) {
      print("err feachmModel:$e");
    }
  }

  Future<void> addUserText() async {
    myChatList.add({"msg": textEditingController.text, "msgIndex": 0});
  }

  // Chat messages
  Future<void> feachTheChat() async {
    var url = Uri.parse("$BASE_URL/completions");
    try {
      var res = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $MY_TOKEN',
          },
          body: jsonEncode({
            "model": state.picItems[state.picItemIndex.value].toString(),
            "prompt": textEditingController.text,
            "temperature": 0,
            "max_tokens": 100
          }));

      Map jesonRes = jsonDecode(res.body);
      //errer message
      if (jesonRes["error"] != null) {
        throw HttpException(jesonRes["errer"]["message"]);
      }

      // empty respose. choices length >0
      // if (jesonRes["choices"].le > 0) {
      //   chatList = List.generate(
      //       jesonRes["choices"],
      //       (index) => ChatModel(
      //           msg: jesonRes["choices"][index]["text"], chatIndex: 1));
      // }
      myChatList.add({"msg": jesonRes["choices"][0]["text"], "msgIndex": 1});
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
    listScrollController = ScrollController();
    focusNode = FocusNode();
    super.onInit();
  }

  @override
  void dispose() {
    picScrollController.dispose();
    super.dispose();
    listScrollController.dispose();
    focusNode.dispose();
  }
}
