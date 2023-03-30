class UserPickListModel {
  final int beerId;
  final String beerNameKR,
      beerNameEN,
      beerImageUrl,
      profileImage,
      nickname,
      contents;
  final double overall;
  bool isLike;
  int likeCount;

  UserPickListModel.fromJson(Map<String, dynamic> json)
      : beerId = json['beerId'],
        beerNameKR = json['beerKrName'],
        beerNameEN = json['beerEnName'],
        beerImageUrl = json['beerImageUrl'] ?? '',
        profileImage = json['profileImage'] ?? '',
        nickname = json['nickname'],
        overall = json['overall'],
        contents = json['contents'],
        isLike = json['isLike'],
        likeCount = json['likeCount'];
}
