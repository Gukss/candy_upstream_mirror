import 'package:candy/screens/search_page.dart';
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 248,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          controller: searchInputController,
          textInputAction: TextInputAction.search,
          style: const TextStyle(),
          expands: true,
          maxLines: null,
          minLines: null,
          textAlignVertical: TextAlignVertical.center,
          onSubmitted: (value) {
            Get.to(
              SearchPage(
                inputText: searchInputController.text.trim(),
              ),
            );
            searchInputController.clear();
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '검색어를 입력해주세요.',
            suffixIcon: IconButton(
              onPressed: () {
                Get.to(SearchPage(
                  inputText: searchInputController.text.trim(),
                ));
                searchInputController.clear();
              },
              icon: Icon(
                Icons.search_rounded,
                color: Theme.of(context).appBarTheme.backgroundColor,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
          ),
        ),
      ),
    );
  }
}
