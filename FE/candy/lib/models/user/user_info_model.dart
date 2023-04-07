class UserInfoModel {
  final String nickname, profileImage;

  UserInfoModel.fromJson(Map<String, dynamic> json)
      : nickname = json['nickname'],
        profileImage = json['profileImage'];
}
