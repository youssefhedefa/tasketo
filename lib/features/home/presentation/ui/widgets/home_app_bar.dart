import 'package:flutter/material.dart';
import 'package:tasketo/core/helper/color_helper.dart';
import 'package:tasketo/core/helper/image_helper.dart';
import 'package:tasketo/core/helper/text_style_helper.dart';
import 'package:tasketo/features/home/presentation/ui/widgets/dialogs/log_out_dialog.dart';


class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 55.0, bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
              'Hi, User!',
            style: AppTextStyleHelper.font24BoldBlack,
          ),
          const Spacer(),
          Container(
            height: 46,
            width: 46,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(AppImageHelper.onBoardingImage),
              ),
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(
                Icons.exit_to_app,
              size: 44,
              color: AppColorHelper.primary
            ),
            onPressed: () {
              showLogOutTaskDialog(context: context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}
