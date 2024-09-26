abstract class AddTaskState{}

class AddTaskInitialState extends AddTaskState{}

class AddTaskLoadingState extends AddTaskState{}

class AddTaskSuccessState extends AddTaskState{
  final String message;
  AddTaskSuccessState({required this.message});
}

class AddTaskErrorState extends AddTaskState{
  final String message;
  AddTaskErrorState({required this.message});
}