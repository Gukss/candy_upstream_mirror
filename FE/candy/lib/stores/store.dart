import 'package:get/get.dart';

class UserController extends GetxController {
  RxString userEmail = ''.obs;
}

class SearchController extends GetxController {
  RxString searchInputText;

  SearchController({required this.searchInputText});
}
