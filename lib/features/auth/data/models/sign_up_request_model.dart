class SignUpRequestModel {
  SignUpRequestModel({
    required this.fullName,
    required this.email,
    required this.password,
  });

  final String? fullName;
  final String? email;
  final String? password;

  Map<String, dynamic> toJson() => {
    "full_name": fullName,
    "email": email,
    "password": password,
  };

}
