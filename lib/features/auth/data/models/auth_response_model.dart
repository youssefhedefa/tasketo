class AuthResponseModel {
  AuthResponseModel({
    required this.status,
    required this.data,
  });

  final String? status;
  final Data? data;

  factory AuthResponseModel.fromJson(Map<String, dynamic> json){
    return AuthResponseModel(
      status: json["status"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.id,
    required this.fullName,
    required this.email,
    required this.profileImage,
  });

  final int? id;
  final String? fullName;
  final String? email;
  final String? profileImage;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      id: json["id"],
      fullName: json["full_name"],
      email: json["email"],
      profileImage: json["profile_image"],
    );
  }

}
