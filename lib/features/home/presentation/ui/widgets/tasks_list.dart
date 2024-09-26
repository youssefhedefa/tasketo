import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasketo/features/home/presentation/manager/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:tasketo/features/home/presentation/manager/get_tasks_cubit/get_tasks_states.dart';
import 'package:tasketo/features/home/presentation/ui/widgets/task_item.dart';

class TasksList extends StatefulWidget {
  const TasksList({super.key, });


  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<GetTasksCubit,GetTasksState>(
        builder: (context,state) {
          if(state is GetTasksLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if(state is GetTasksErrorState) {
            return Center(child: Text(state.message));
          }
          if(state is GetTasksSuccessState) {
            if(state.tasks.isEmpty) {
              return const Center(child: Text('No tasks found'));
            }
            return ListView.separated(
              itemBuilder: (context, index) => TaskItem(
                task: state.tasks[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: state.tasks.length,
            );
          }
          return const SizedBox();
        }
      ),
    );
  }
}
