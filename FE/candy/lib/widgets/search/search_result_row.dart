import 'package:candy/models/beer/beer_search_list_model.dart';
import 'package:candy/widgets/beer/beer_image.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class SearchResultRow extends StatelessWidget {
  final int index;

  final List<BeerSearchListModel> searchResults;

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
        ),
        if (index * 2 + 1 < searchResults.length)
          SearchResultItem(
            index: index * 2 + 1,
            searchResults: searchResults,
          ),
      ],
    );
  }
}

class SearchResultItem extends StatelessWidget {
  final int index;
  final List<BeerSearchListModel> searchResults;

  const SearchResultItem({
    super.key,
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
        SizedBox(
          width: 144,
          child: Text(
            searchResults[index].beerNameKR,
            style: const TextStyle(
              fontSize: 16,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          width: 144,
          child: Text(
            searchResults[index].beerNameEn,
            style: const TextStyle(
              fontSize: 14,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
