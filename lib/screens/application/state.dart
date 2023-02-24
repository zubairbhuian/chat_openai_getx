import 'package:get/get.dart';

class ApplicationState {
  var picItemIndex = 0.obs;
  RxBool isTyping = true.obs;

  RxList<dynamic> picItems = [].obs;
}
