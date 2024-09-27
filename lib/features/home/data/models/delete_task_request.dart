class DeleteTaskRequestModel {
  DeleteTaskRequestModel({
    required this.userId,
    required this.taskId,
  });

  final int userId;
  final int taskId;

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "task_id": taskId,
  };

}
