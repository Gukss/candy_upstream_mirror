class RecentBeerModel {
  final int beerId;
  final String beerName;

  RecentBeerModel.fromJson(Map<String, dynamic> json)
      : beerId = json['beerId'],
        beerName = json['beerKrName'];
}
