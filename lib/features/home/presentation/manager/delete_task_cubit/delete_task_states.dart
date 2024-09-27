abstract class DeleteTaskState{}

class DeleteTaskInitialState extends DeleteTaskState{}

class DeleteTaskLoadingState extends DeleteTaskState{}

class DeleteTaskSuccessState extends DeleteTaskState{
  final String message;
  DeleteTaskSuccessState({required this.message});
}

class DeleteTaskErrorState extends DeleteTaskState{
  final String message;
  DeleteTaskErrorState({required this.message});
}