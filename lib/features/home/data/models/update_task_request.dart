class EditTaskRequestModel {
  EditTaskRequestModel({
    required this.userId,
    required this.taskId,
    required this.title,
    required this.description,
    required this.state,
    required this.deadline,
  });

  final int? userId;
  final int? taskId;
  final String? title;
  final String? description;
  final String? state;
  final String? deadline;


  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "task_id": taskId,
    "title": title,
    "description": description,
    "state": state,
    "deadline": deadline,
  };

}
