class TotalReviewList {
  late final String userName, profileImage, contents;
  late final double overall;
  late final int likeCount;

  TotalReviewList.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    profileImage = json['profileImage'];
    contents = json['contents'];
    overall = json['overall'];
    likeCount = json['likeCount'];
  }
}
