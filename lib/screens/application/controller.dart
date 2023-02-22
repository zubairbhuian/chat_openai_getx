import 'dart:async';

import 'package:chat_openai_getx/screens/application/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplicationController extends GetxController {
  ApplicationState state = ApplicationState();

   
   final textEditingController = TextEditingController();

  hidetext() {
    state.isTyping.value = !state.isTyping.value;
  }
}
