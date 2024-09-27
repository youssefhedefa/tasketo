abstract class EditTaskState{}

class EditTaskInitialState extends EditTaskState{}

class EditTaskLoadingState extends EditTaskState{}

class EditTaskSuccessState extends EditTaskState{
  final String message;
  EditTaskSuccessState({required this.message});
}

class EditTaskErrorState extends EditTaskState{
  final String message;
  EditTaskErrorState({required this.message});
}