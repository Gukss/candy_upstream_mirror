class AllReviewListModel {
  final String userName, profileImage, contents;
  final double overall;
  final int likeCount, reviewId;
  bool isLiked;

  AllReviewListModel.fromJson(Map<String, dynamic> json)
      : userName = json['userName'],
        profileImage = json['profileImage'],
        contents = json['contents'],
        overall = json['overall'],
        reviewId = json['reviewId'],
        likeCount = json['likeCount'],
        isLiked = json['isLikes'];
}
