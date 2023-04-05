class AllReviewListModel {
  final String userName, profileImage, contents, userEmail;
  final double overall;
  final int likeCount, reviewId;
  bool isLiked;

  AllReviewListModel.fromJson(Map<String, dynamic> json)
      : userEmail = json['userEmail'],
        userName = json['userName'],
        profileImage = json['profileImage'],
        contents = json['contents'],
        overall = json['overall'],
        reviewId = json['reviewId'],
        likeCount = json['likeCount'],
        isLiked = json['isLikes'];
}
