class ErrorModel {
  ErrorModel({
    required this.status,
    required this.message,
  });

  final String? status;
  final String? message;

  factory ErrorModel.fromJson(Map<String, dynamic> json){
    return ErrorModel(
      status: json["status"],
      message: json["message"],
    );
  }

}
