class AllReviewListModel {
  late final String userName, profileImage, contents;
  late final double overall;
  late final int likeCount;
  late bool isLiked;

  AllReviewListModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    profileImage = json['profileImage'];
    contents = json['contents'];
    overall = json['overall'];
    likeCount = json['likeCount'];
    isLiked = json['isLikes'];
  }
}
