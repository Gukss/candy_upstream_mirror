import 'package:candy/stores/store.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: Colors.grey,
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
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ),
      child: SizedBox(
        width: 280,
        child: TextField(
          controller: searchTextFieldController,
          textInputAction: TextInputAction.search,
          onSubmitted: (value) {
            searchController.searchInputText.value =
                searchTextFieldController.text.trim();
          },
          textAlignVertical: TextAlignVertical.center,
          cursorColor: Colors.black,
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
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 16,
            ),
          ),
        ),
      ),
    );
  }
}
