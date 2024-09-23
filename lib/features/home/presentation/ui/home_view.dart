import 'package:flutter/material.dart';
import 'package:tasketo/core/helper/color_helper.dart';
import 'package:tasketo/features/home/presentation/ui/widgets/home_app_bar.dart';
import 'package:tasketo/features/home/presentation/ui/widgets/task_states_list.dart';
import 'package:tasketo/features/home/presentation/ui/widgets/tasks_list.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColorHelper.primary,
        child: const Icon(
            Icons.add_rounded,
          size: 40,
          color: AppColorHelper.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 20.0, bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TaskStatesList(
              onTaskStateSelected: (state){
              },
            ),
            const SizedBox(height: 20),
            const TasksList(),
          ],
        ),
      ),
    );
  }
}

