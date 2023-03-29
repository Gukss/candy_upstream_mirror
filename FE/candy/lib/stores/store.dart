import 'package:get/get.dart';

class UserController extends GetxController {
  RxString userEmail = ''.obs;
  RxString userProfileImg = ''.obs;
}

class SearchController extends GetxController {
  RxString searchInputText;

  SearchController({required this.searchInputText});
}

class PriorityOrderController extends GetxController {
  RxBool appearanceSelected = false.obs;
  RxBool flavorSelected = false.obs;
  RxBool mouthfeelSelected = false.obs;
  RxBool aromaSelected = false.obs;
  RxList<String> priorityOrder = <String>[].obs;

  void changeOrder(tappedPriority) {
    if (priorityOrder.contains(tappedPriority)) {
      priorityOrder.assignAll(priorityOrder
          .where((priority) => priority != tappedPriority)
          .toList()
          .obs);
    } else {
      priorityOrder.add(tappedPriority);
    }
  }
}
