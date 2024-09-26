class AlterTaskResponseModel {
  AlterTaskResponseModel({
    required this.status,
    required this.data,
  });

  final String? status;
  final String? data;

  factory AlterTaskResponseModel.fromJson(Map<String, dynamic> json){
    return AlterTaskResponseModel(
      status: json["status"],
      data: json["data"],
    );
  }

}
