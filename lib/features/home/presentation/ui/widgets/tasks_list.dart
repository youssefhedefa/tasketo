import 'package:flutter/material.dart';
import 'package:tasketo/features/home/presentation/ui/widgets/task_item.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => TaskItem(),
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemCount: 5,
      ),
    );
  }
}
