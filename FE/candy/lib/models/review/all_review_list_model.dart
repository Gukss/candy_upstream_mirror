class AllReviewListModel {
  late final String userName, profileImage, contents;
  late final double overall;
  late final int likeCount, reviewId;
  late bool isLiked;

  AllReviewListModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    profileImage = json['profileImage'];
    contents = json['contents'];
    overall = json['overall'];
    reviewId = json['reviewId'];
    likeCount = json['likeCount'];
    isLiked = json['isLikes'];
  }
}
