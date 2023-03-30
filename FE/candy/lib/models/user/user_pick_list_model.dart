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
        // profileImage = json['profileImage'] ?? '',
        profileImage = json['profileImgae'] ?? '',
        // nickname = json['nickname'],
        nickname = json['nickName'],
        overall = json['overall'],
        contents = json['contents'],
        isLike = json['isLike'],
        likeCount = json['likeCount'];
}
