import 'package:flutter/material.dart';
import 'package:tasketo/core/helper/color_helper.dart';
import 'package:tasketo/core/helper/text_style_helper.dart';
import 'package:tasketo/features/home/data/enum/task_states_enum.dart';
import 'package:tasketo/features/home/presentation/ui/widgets/state_container.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 204,
      decoration: BoxDecoration(
        color: AppColorHelper.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: AppColorHelper.grey.withOpacity(0.35),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - (180),
                child: const Text(
                  'Task TitleTask TitleTask TitleTask TitleTask TitleTask Title',
                  style: AppTextStyleHelper.font20SemiBoldBlack,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit_note_rounded,
                  color: AppColorHelper.green,
                  size: 34,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete_rounded,
                  color: AppColorHelper.red,
                  size: 30,
                ),
              ),
            ],
          ),
          const Row(
            children: [
              Text(
                  '23/9/2024',
                  style: AppTextStyleHelper.font16RegularGrey
              ),
              SizedBox(width: 14),
              StateContainer(taskState: TaskStatesEnum.inProgress),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Task DescriptionTaskTask DescriptionTaskTask DescriptionTask DescriptionTask DescriptionTask DescriptionTask Description',
            style: AppTextStyleHelper.font16RegularGrey,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
