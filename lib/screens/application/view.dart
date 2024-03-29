import 'package:chat_openai_getx/common/constants/app_color.dart';
import 'package:chat_openai_getx/common/constants/app_constant.dart';
import 'package:chat_openai_getx/common/constants/img_path.dart';
import 'package:chat_openai_getx/common/widgets/chat_widget.dart';
import 'package:chat_openai_getx/screens/application/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ApplicationView extends GetView<ApplicationController> {
  const ApplicationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        centerTitle: false,
        title: const Text(AppConstant.appTile),
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          child: Align(
              alignment: Alignment.topRight, child: Image.asset(ImgPath.gpt)),
        ),
        actions: [
          IconButton(
              splashRadius: 20,
              onPressed: () {
                print(controller.myChatList.value);
              },
              icon: const Icon(
                Icons.more_vert,
              )),
          // ElevatedButton(onPressed: (){}, child:Icons.more_vert, )
        ],
      ),
      body: Obx(() => SafeArea(
              child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                controller: controller.listScrollController,
                itemCount: controller.myChatList.length,
                itemBuilder: (contex, index) => ChatWidget(
                    msg: controller.myChatList[index]["msg"],
                    chatIndex: controller.myChatList[index]["msgIndex"]),
              )),
              if (controller.state.isTyping.value) ...[
                SpinKitThreeBounce(
                  color: AppColor.textColor,
                  size: 16.w,
                ),
              ],
              SizedBox(
                height: 5.w,
              ),
              Container(
                color: AppColor.primary,
                padding: EdgeInsets.only(
                    top: 10.w, right: 5.w, bottom: 10.w, left: 5.w),
                child: Row(
                  children: [
                    IconButton(
                        splashRadius: 20,
                        iconSize: 18.w,
                        color: AppColor.successLight,
                        onPressed: () {
                          controller.picScrollController.dispose();
                          controller.picScrollControllerInit();
                          showModalBottomSheet(
                              backgroundColor: AppColor.secondary,
                              context: context,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              builder: (_) => selecWidgets());
                        },
                        icon: const Icon(
                          Icons.settings,
                        )),
                    Expanded(
                      child: TextField(
                        focusNode: controller.focusNode,
                        minLines: 1,
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        autofocus: controller.state.isTyping.value,
                        cursorColor: const Color.fromARGB(255, 255, 0, 0),
                        style: const TextStyle(color: AppColor.textColorLight),
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: AppColor.secondary,
                            hintText: 'How can i help you',
                            hintStyle:
                                TextStyle(color: AppColor.secondaryLight),
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none),
                        controller: controller.textEditingController,
                        onSubmitted: (value) async {
                          await sendMSG();
                        },
                      ),
                    ),
                    IconButton(
                        splashRadius: 20,
                        iconSize: 18.w,
                        color: AppColor.successLight,
                        onPressed: () async {
                          await sendMSG();
                        },
                        icon: const Icon(
                          Icons.send,
                        )),
                  ],
                ),
              )
            ],
          ))),
    );
  }

  SizedBox selecWidgets() {
    return SizedBox(
      height: 300.h,
      child: CupertinoPicker(
          selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
              background:
                  const Color.fromARGB(255, 255, 255, 255).withOpacity(.2)),
          scrollController: controller.picScrollController,
          // looping: true,
          itemExtent: 64,
          backgroundColor: AppColor.secondaryLight,
          onSelectedItemChanged: (index) {
            controller.state.picItemIndex.value = index;
          },
          children: controller.getModelItems!),
    );
  }

  Future<void> sendMSG() async {
    if (controller.state.isTyping.value) {
      Get.snackbar("Comment Error", "Wait Some Time");
      return;
    }
    if (controller.textEditingController.text.isEmpty) {
      Get.snackbar("Comment Error", "You must write some valuable word !!");
      return;
    }

    controller.addUserText();
    controller.state.isTyping.value = true;
    await controller.feachTheChat();
    controller.textEditingController.clear();
    controller.focusNode.unfocus();
    controller.state.isTyping.value = false;
    controller.scrollStartToEnd();
  }
}
