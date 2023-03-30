class UserDailyDataModel {
  final String createdAt;

  UserDailyDataModel.fromJson(Map<String, dynamic> json)
      : createdAt = json['createdAt'];
}
