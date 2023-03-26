class UserDailyDataModel {
  late final String createdAt;

  UserDailyDataModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
  }
}
