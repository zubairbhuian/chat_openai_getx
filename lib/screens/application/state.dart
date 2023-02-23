import 'package:get/get.dart';

class ApplicationState {
  var picItemIndex = 0.obs;
  RxBool isTyping = true.obs;

  List<String> picItems = [
    'item 1',
    'item 2',
    'item 3',
    'item 4',
    'item 5',
    'item 6',
    'item 7',
    'item 8',
    'item 9',
    'item 10',
    'item 11',
    'item 12',
    'item 13',
    'item 14',
    'item 15',
    'item 16',
    'item 17',
    'item 18',
  ].obs;
}
