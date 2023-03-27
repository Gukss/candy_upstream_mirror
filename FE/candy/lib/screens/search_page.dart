import 'package:candy/api/beer_api_service.dart';
import 'package:candy/models/beer/beer_search_list_model.dart';
import 'package:candy/stores/store.dart';
import 'package:candy/widgets/beer/beer_image.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  final SearchController searchController;

  const SearchPage({
    super.key,
    required this.searchController,
  });

  Future<List<BeerSearchListModel>> searchResults() async {
    final List<BeerSearchListModel> results =
        await BeerApiService.getBeerSearch(
            searchInput: searchController.searchText.value);
    return results;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SearchPageAppBar(
          searchText: searchController.searchText.value,
        ),
        body: FutureBuilder(
          future: searchResults(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '< ${searchController.searchText.value} > 검색 결과',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Margin(marginType: MarginType.height, size: 16),
                    Expanded(
                      child: ListView.separated(
                        itemCount: (snapshot.data!.length / 2).ceil(),
                        separatorBuilder: (context, index) {
                          return const Margin(
                              marginType: MarginType.height, size: 16);
                        },
                        itemBuilder: (context, index) {
                          return SearchResultRow(
                            index: index,
                            searchResults: snapshot.data!,
                            searchText: searchController.searchText.value,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            return Center(
              child: Column(
                children: const [
                  CircularProgressIndicator(),
                ],
              ),
            );
          },
        ));
  }
}

class SearchPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String searchText;

  const SearchPageAppBar({
    super.key,
    required this.searchText,
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
      actions: [
        SearchPageSearchBox(
          searchText: searchText,
        )
      ],
    );
  }
}

class SearchPageSearchBox extends StatefulWidget {
  final String searchText;
  const SearchPageSearchBox({
    super.key,
    required this.searchText,
  });

  @override
  State<SearchPageSearchBox> createState() => _SearchPageSearchBoxState();
}

class _SearchPageSearchBoxState extends State<SearchPageSearchBox> {
  final TextEditingController searchTextFieldController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    searchTextFieldController.text = widget.searchText;
  }

  @override
  Widget build(BuildContext context) {
    final SearchController searchController = Get.find(tag: 'search');
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
            searchController.searchText.value = searchTextFieldController.text;
          },
          textAlignVertical: TextAlignVertical.center,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                searchController.searchText.value =
                    searchTextFieldController.text;
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

class SearchResultRow extends StatelessWidget {
  final int index;
  final String searchText;
  final List<BeerSearchListModel> searchResults;

  const SearchResultRow({
    super.key,
    required this.index,
    required this.searchResults,
    required this.searchText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SearchResultItem(
          index: index * 2,
          searchResults: searchResults,
          searchText: 'searchText',
        ),
        if (index * 2 + 1 < searchResults.length)
          SearchResultItem(
            index: index * 2 + 1,
            searchResults: searchResults,
            searchText: 'searchText',
          ),
      ],
    );
  }
}

class SearchResultItem extends StatelessWidget {
  final String searchText;
  final int index;
  final List<BeerSearchListModel> searchResults;

  const SearchResultItem({
    super.key,
    required this.searchText,
    required this.index,
    required this.searchResults,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BeerImage(
          backSize: 152,
          backColor: Colors.grey,
          beerImgSrc: searchResults[index].beerImageUrl,
        ),
        const Margin(marginType: MarginType.height, size: 4),
        Row(
          children: [
            for (int i = 0; i < searchResults[index].beerNameKR.length; i++)
              Text(
                searchResults[index].beerNameKR[i],
                style: TextStyle(
                    fontSize: 16,
                    color:
                        searchText.contains(searchResults[index].beerNameKR[i])
                            ? Colors.amber
                            : null),
              )
          ],
        ),
        Row(
          children: [
            for (int i = 0; i < searchResults[index].beerNameEn.length; i++)
              Text(
                searchResults[index].beerNameEn[i],
                style: TextStyle(
                    fontSize: 16,
                    color: searchText.toLowerCase().contains(
                              searchResults[index].beerNameEn[i].toLowerCase(),
                            )
                        ? Colors.amber
                        : null),
              )
          ],
        ),
      ],
    );
  }
}
