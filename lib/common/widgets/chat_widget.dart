import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_openai_getx/common/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/img_path.dart';

class ChatWidget extends StatelessWidget {
  final String msg;
  final int chatIndex;

  const ChatWidget({super.key, required this.msg, required this.chatIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: chatIndex == 0 ? AppColor.primary : AppColor.secondary,
      padding: EdgeInsets.all(12.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          chatIndex == 0
              ? Image.asset(width: 21.w, height: 21.w, ImgPath.user)
              : Image.asset(width: 21.w, height: 21.w, ImgPath.chatgpt),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
              child: chatIndex == 0
                  ? Text(
                      msg,
                      style:
                          TextStyle(fontSize: 16.sp, color: AppColor.textColor),
                    )
                  : AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          textStyle:  TextStyle(fontSize: 16.sp,color: AppColor.textColor),
                          msg.trim(),
                        )
                      ],
                      isRepeatingAnimation: false,
                      repeatForever: false,
                      displayFullTextOnTap: true,
                      totalRepeatCount: 1,
                    )),
        ],
      ),
    );
  }
}
