class AuthResponseModel {
  AuthResponseModel({
    required this.status,
    required this.data,
  });

  final String? status;
  final UserData? data;

  factory AuthResponseModel.fromJson(Map<String, dynamic> json){
    return AuthResponseModel(
      status: json["status"],
      data: json["data"] == null ? null : UserData.fromJson(json["data"]),
    );
  }

}

class UserData {
  UserData({
    required this.id,
    required this.fullName,
    required this.email,
    required this.profileImage,
  });

  final int? id;
  final String? fullName;
  final String? email;
  final String? profileImage;

  factory UserData.fromJson(Map<String, dynamic> json){
    return UserData(
      id: json["id"],
      fullName: json["full_name"],
      email: json["email"],
      profileImage: json["profile_image"],
    );
  }

}
