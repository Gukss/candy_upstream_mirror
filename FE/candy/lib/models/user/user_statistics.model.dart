class UserStatisticsModel {
  late final int totalCount, continuousDay, totalDay;
  late final String favoriteStyle;
  late final double topRank;
  late final List<dynamic> pieCountry, pieStyle;

  UserStatisticsModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    continuousDay = json['continuousDay'];
    totalDay = json['totalDay'];
    favoriteStyle = json['favoriteStyle'];
    topRank = json['topRank'];
    pieCountry = json['pieCountry'];
    pieStyle = json['pieStyle'];
  }
}
