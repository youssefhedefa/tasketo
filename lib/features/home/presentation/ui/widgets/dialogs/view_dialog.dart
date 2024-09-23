import 'package:flutter/material.dart';
import 'package:tasketo/core/helper/color_helper.dart';

showDialogDetails({
  required BuildContext context,
  required String title,
  required String description,
  required String date,
  required String state,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Row(
          children: [
            const Text('Task Details'),
            const Spacer(),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close_rounded,
                color: AppColorHelper.primary,
                size: 36,
              ),
            ),
          ],
        ),
        backgroundColor: AppColorHelper.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        content:  Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            taskInfo(value: title),
            const SizedBox(height: 16),
            taskInfo(value: description),
            const SizedBox(height: 16),
            Row(
              children: [
                taskInfo(value: date),
                const Spacer(),
                taskInfo(value: state),
              ],
            ),
          ],
        ),
      );
    },
  );
}
Widget taskInfo({required String value}){
  return Container(
    padding: const EdgeInsets.all(14),
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
    child: Text(
        value,
      style: const TextStyle(
          fontSize: 15,
          color: AppColorHelper.black,
        ),
    ),
  );
}
