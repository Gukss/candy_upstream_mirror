import 'package:candy/screens/search_page.dart';
import 'package:candy/stores/store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarSearchBox extends StatefulWidget {
  const AppBarSearchBox({
    super.key,
  });

  @override
  State<AppBarSearchBox> createState() => _AppBarSearchBoxState();
}

class _AppBarSearchBoxState extends State<AppBarSearchBox> {
  final searchInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final SearchController searchController = Get.find(tag: 'search');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 240,
        child: TextField(
          textInputAction: TextInputAction.search,
          onSubmitted: (value) {
            searchController.searchText.value = searchInputController.text;
            Get.to(SearchPage(
              searchController: searchController,
            ));
          },
          controller: searchInputController,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide(),
            ),
            hintText: '검색어를 입력해주세요.',
            suffixIcon: IconButton(
              onPressed: () {
                searchController.searchText.value = searchInputController.text;
                Get.to(SearchPage(
                  searchController: searchController,
                ));
              },
              icon: const Icon(
                Icons.search_rounded,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
          ),
          textAlignVertical: TextAlignVertical.center,
        ),
      ),
    );
  }
}
