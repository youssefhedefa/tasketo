class AddTaskRequestModel {
  AddTaskRequestModel({
    required this.uid,
    required this.title,
    required this.description,
    required this.state,
    required this.deadline,
  });

  final int? uid;
  final String? title;
  final String? description;
  final String? state;
  final String? deadline;

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "title": title,
    "description": description,
    "state": state,
    "deadline": deadline,
  };

}
