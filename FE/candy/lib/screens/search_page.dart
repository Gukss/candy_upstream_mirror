import 'package:candy/stores/store.dart';
import 'package:candy/widgets/app_bar/search_page_app_bar.dart';
import 'package:candy/widgets/search/search_page_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  final String inputText;

  const SearchPage({
    super.key,
    this.inputText = '',
  });

  @override
  Widget build(BuildContext context) {
    final SearchController searchController = Get.put(
        SearchController(
          searchInputText: inputText.obs,
        ),
        tag: 'search');
    return Scaffold(
      appBar: const SearchPageAppBar(),
      body: Obx(
        () => SearchPageResult(
          inputText: searchController.searchInputText.value,
        ),
      ),
    );
  }
}
