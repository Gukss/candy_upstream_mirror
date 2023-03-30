class AllBeerListModel {
  final int beerId;
  final String beerNameKR, beerNameEN, beerImageUrl;
  int isDrunk, isLiked;

  AllBeerListModel.fromJson(Map<String, dynamic> json)
      : beerId = json['beerId'],
        beerNameKR = json['beerKrName'],
        beerNameEN = json['beerEnName'],
        beerImageUrl = json['beerImageUrl'],
        isDrunk = json['isDrink'],
        isLiked = json['isLike'];
}
