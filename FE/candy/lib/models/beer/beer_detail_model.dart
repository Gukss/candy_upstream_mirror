class BeerDetailModel {
  final int beerId;
  final String beerNameKR, beerNameEN, countryNameKR, style, beerImageUrl;
  final double abv, aroma, mouthfeel, flavor, appearance, overall;
  bool isDrunk, isLiked;

  BeerDetailModel.fromJson(Map<String, dynamic> json)
      : beerId = json['beerId'],
        beerNameKR = json['beerKrName'],
        beerNameEN = json['beerEnName'],
        abv = json['abv'],
        style = json['style'],
        beerImageUrl = json['beerImageUrl'],
        countryNameKR = json['countryKrName'],
        overall = json['overall'],
        isDrunk = json['drink'],
        isLiked = json['like'],
        aroma = json['aroma'],
        mouthfeel = json['mouthfeel'],
        flavor = json['flavor'],
        appearance = json['appearance'];
}
