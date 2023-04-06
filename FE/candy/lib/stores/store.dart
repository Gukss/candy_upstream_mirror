import 'package:get/get.dart';

class RefreshController extends GetxController {
  Function mainRefresh = () {};
  Function beerListRefresh = () {};
  Function calendarRefresh = () {};
}

class UserController extends GetxController {
  RxString userEmail = ''.obs;
  RxString userProfileImg = ''.obs;
}

class SearchController extends GetxController {
  RxString searchInputText;

  SearchController({required this.searchInputText});
}

class PriorityOrderController extends GetxController {
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

class ReviewController extends GetxController {
  RxDouble aroma = 0.0.obs;
  RxDouble appearance = 0.0.obs;
  RxDouble flavor = 0.0.obs;
  RxDouble mouthfeel = 0.0.obs;
  RxDouble overall = 0.0.obs;
  RxString content = ''.obs;
}
