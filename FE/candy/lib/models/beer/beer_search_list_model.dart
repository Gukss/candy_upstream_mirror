class BeerSearchListModel {
  final int beerId;
  final String beerNameKR, beerNameEn, beerImageUrl;

  BeerSearchListModel.fromJson(Map<String, dynamic> json)
      : beerId = json['beerId'],
        beerNameKR = json['beerKrName'],
        beerNameEn = json['beerEnName'],
        beerImageUrl = json['beerImageUrl'];
}
