import 'package:get/get.dart';

import '../../screens/application/index.dart';

class AppRoutes {
  static const String logIn = '/login';
  static const String application = '/application';

  static final List<GetPage> getpage = [
    GetPage(
        name: logIn,
        page: () => const ApplicationView(),
        binding: ApplicatonBinding())
  ];
}
