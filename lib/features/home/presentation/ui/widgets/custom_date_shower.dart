import 'package:flutter/material.dart';
import 'package:tasketo/core/helper/color_helper.dart';
import 'package:tasketo/core/helper/text_style_helper.dart';

class CustomDateShower extends StatefulWidget {
  const CustomDateShower({super.key, required this.callback, this.label, });

  final String? label;
  final Function callback;

  @override
  State<CustomDateShower> createState() => _CustomDateShowerState();
}

class _CustomDateShowerState extends State<CustomDateShower> {

  String date = 'choose due date...';

  @override
  void initState() {
    if(widget.label != null){
      date = widget.label!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label ?? 'Date',
          style: AppTextStyleHelper.font18MediumPrimary,
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColorHelper.primary,
              width: 2,
            ),
          ),
          child: MaterialButton(
            onPressed: () {
              showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime(2025),
                initialDate: DateTime.now(),
              ).then((value) {
                if (value != null) {
                  setState(() {
                    date = '${value.day}/${value.month}/${value.year}';
                  });
                   widget.callback(date);
                }
              });
            },
            child: Row(
              children: [
                Text(
                  date,
                  style: AppTextStyleHelper.font16RegularGrey,
                ),
                const Spacer(),
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: AppColorHelper.primary,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
