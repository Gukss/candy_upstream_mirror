import 'package:candy/api/beer_api_service.dart';
import 'package:candy/models/beer/beer_search_list_model.dart';
import 'package:candy/widgets/search/search_result_row.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class SearchPageResult extends StatelessWidget {
  final String inputText;

  const SearchPageResult({
    super.key,
    required this.inputText,
  });

  Future<List<BeerSearchListModel>> searchResults() async {
    final List<BeerSearchListModel> results =
        await BeerApiService.getBeerSearch(searchInput: inputText);
    return results;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: searchResults(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '< $inputText > 검색 결과',
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
    );
  }
}
