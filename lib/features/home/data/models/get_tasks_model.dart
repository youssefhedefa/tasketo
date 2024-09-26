class GetTasksResponseModel {
  GetTasksResponseModel({
    required this.status,
    required this.data,
  });

  final String? status;
  final List<TaskData> data;

  factory GetTasksResponseModel.fromJson(Map<String, dynamic> json){
    return GetTasksResponseModel(
      status: json["status"],
      data: json["data"] == null ? [] : List<TaskData>.from(json["data"]!.map((x) => TaskData.fromJson(x))),
    );
  }

}

class TaskData {
  TaskData({
    required this.uid,
    required this.taskId,
    required this.title,
    required this.description,
    required this.state,
    required this.deadline,
  });

  final int? uid;
  final int? taskId;
  final String? title;
  final String? description;
  final String? state;
  final String? deadline;

  factory TaskData.fromJson(Map<String, dynamic> json){
    return TaskData(
      uid: json["uid"],
      taskId: json["task_id"],
      title: json["title"],
      description: json["description"],
      state: json["state"],
      deadline: json["deadline"],
    );
  }

}

class GetTasksRequestModel {
  GetTasksRequestModel({
    required this.uid,
  });

  final int uid;

  Map<String, dynamic> toJson() {
    return {
      "user_id": uid,
    };
  }
}