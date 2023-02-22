import 'package:chat_openai_getx/common/constants/app_color.dart';
import 'package:chat_openai_getx/common/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: AppRoutes.logIn,
        getPages: AppRoutes.getpage,
        theme: ThemeData(
            textTheme: GoogleFonts.robotoTextTheme(),
            scaffoldBackgroundColor: AppColor.primary,
            appBarTheme:
                const AppBarTheme(backgroundColor: AppColor.secondary)),
      );
    });
  }
}
