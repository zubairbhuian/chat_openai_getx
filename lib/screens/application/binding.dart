import 'package:chat_openai_getx/screens/application/controller.dart';
import 'package:get/get.dart';

class ApplicatonBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(() => ApplicationController());
  }
}
