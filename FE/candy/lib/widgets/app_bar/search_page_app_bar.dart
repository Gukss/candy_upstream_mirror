import 'package:flutter/material.dart';

import 'package:candy/stores/store.dart';

import 'package:get/get.dart';

class SearchPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchPageAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
        ),
      ),
      actions: const [SearchPageSearchBox()],
    );
  }
}

class SearchPageSearchBox extends StatefulWidget {
  const SearchPageSearchBox({
    super.key,
  });

  @override
  State<SearchPageSearchBox> createState() => _SearchPageSearchBoxState();
}

class _SearchPageSearchBoxState extends State<SearchPageSearchBox> {
  final TextEditingController searchTextFieldController =
      TextEditingController();
  final SearchController searchController = Get.find(tag: 'search');

  @override
  void initState() {
    super.initState();
    searchTextFieldController.text = searchController.searchInputText.value;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: 280,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          controller: searchTextFieldController,
          textInputAction: TextInputAction.search,
          textAlignVertical: TextAlignVertical.center,
          expands: true,
          maxLines: null,
          minLines: null,
          onChanged: (value) {
            searchController.searchInputText.value =
                searchTextFieldController.text.trim();
          },
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                searchController.searchInputText.value =
                    searchTextFieldController.text.trim();
              },
              icon: const Icon(
                Icons.search_rounded,
              ),
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
          ),
        ),
      ),
    );
  }
}
