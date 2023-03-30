class RecommendationListModel {
  final int beerId;
  final String beerNameKR, beerNameEN, beerImageUrl;

  RecommendationListModel.fromJson(Map<String, dynamic> json)
      : beerId = json['beerId'],
        beerNameKR = json['beerKrName'],
        beerNameEN = json['beerEnName'],
        beerImageUrl = json['beerImageUrl'] ?? '';
}
