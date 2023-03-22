import 'package:candy/widgets/beer/beer_image.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  List<Map<String, dynamic>> searchResults() {
    return [
      for (int i = 0; i < 11; i++)
        {
          'name': {
            'korean': '카스 프레시',
            'english': 'Cass Fresh',
          },
          'beerImgSrc':
              'https://justliquor.com.au/2735/cass-fresh-beer-can-355ml.jpg',
        }
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchPageAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '< 카스 > 검색 결과',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Margin(marginType: MarginType.height, size: 16),
            Expanded(
              child: ListView.separated(
                itemCount: (searchResults().length / 2).ceil(),
                separatorBuilder: (context, index) {
                  return const Margin(marginType: MarginType.height, size: 16);
                },
                itemBuilder: (context, index) {
                  return SearchResultRow(
                    index: index,
                    searchResults: searchResults(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchPageAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
        ),
      ),
      actions: const [SearchPageSearchBox()],
    );
  }
}

class SearchPageSearchBox extends StatefulWidget {
  const SearchPageSearchBox({super.key});

  @override
  State<SearchPageSearchBox> createState() => _SearchPageSearchBoxState();
}

class _SearchPageSearchBoxState extends State<SearchPageSearchBox> {
  final TextEditingController searchController = TextEditingController();

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
          controller: searchController,
          textInputAction: TextInputAction.search,
          onSubmitted: (value) {
            print(value);
          },
          textAlignVertical: TextAlignVertical.center,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                print(searchController.text);
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
  final List<Map<String, dynamic>> searchResults;

  const SearchResultRow({
    super.key,
    required this.index,
    required this.searchResults,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SearchResultItem(
          index: index * 2,
          searchResults: searchResults,
          searchedWord: '카스',
        ),
        if (index * 2 + 1 < searchResults.length)
          SearchResultItem(
            index: index * 2 + 1,
            searchResults: searchResults,
            searchedWord: '카스',
          ),
      ],
    );
  }
}

class SearchResultItem extends StatelessWidget {
  final String searchedWord;
  final int index;
  final List<Map<String, dynamic>> searchResults;

  const SearchResultItem({
    super.key,
    required this.searchedWord,
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
          beerImgSrc: searchResults[index]['beerImgSrc'],
        ),
        const Margin(marginType: MarginType.height, size: 4),
        Row(
          children: [
            for (int i = 0;
                i < searchResults[index]['name']['korean'].length;
                i++)
              Text(
                searchResults[index]['name']['korean'][i],
                style: TextStyle(
                    fontSize: 16,
                    color: searchedWord
                            .contains(searchResults[index]['name']['korean'][i])
                        ? Colors.amber
                        : null),
              )
          ],
        ),
        Text(
          'Cass Fresh',
          style: TextStyle(
            fontSize: 12,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
