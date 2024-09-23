class SignUpRequestModel {
  SignUpRequestModel({
    required this.fullName,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  final String fullName;
  final String email;
  final String password;
  final String confirmPassword;

  Map<String, dynamic> toJson() => {
    "full_name": fullName,
    "email": email,
    "password": password,
    "confirm_password": confirmPassword,
  };

}
