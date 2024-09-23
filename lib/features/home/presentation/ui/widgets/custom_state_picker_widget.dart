import 'package:flutter/material.dart';
import 'package:tasketo/core/helper/color_helper.dart';
import 'package:tasketo/core/helper/text_style_helper.dart';

class CustomPriorityContainer extends StatefulWidget {
  const CustomPriorityContainer(
      {super.key,
      required this.callback,
      required this.options,
      required this.label,
      });

  final Function callback;
  final List<String> options;
  final String label;

  @override
  State<CustomPriorityContainer> createState() =>
      _CustomPriorityContainerState();
}

class _CustomPriorityContainerState extends State<CustomPriorityContainer> {
  late String dropdownValue;

  @override
  void initState() {
    dropdownValue = widget.options[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColorHelper.primary,
          width: 2,
        ),
      ),
      child: DropdownButton<String>(
        items: getDropdownItems(),
        onChanged: (value) {
          setState(() {
            dropdownValue = value!;
          });
          widget.callback(value);
        },
        hint: Row(
          children: [
             const Icon(
                    Icons.flag_outlined,
                    size: 20,
                    color: AppColorHelper.primary,
                  )
                ,
            const SizedBox(width: 8),
            Text(dropdownValue,
                style: AppTextStyleHelper.font16MediumBlack),
          ],
        ),
        borderRadius: BorderRadius.circular(8),
        underline: const SizedBox(),
        isExpanded: true,
        iconSize: 40,
        iconEnabledColor: AppColorHelper.primary,
        iconDisabledColor: AppColorHelper.primary,
      ),
    );
  }

  List<DropdownMenuItem<String>> getDropdownItems() {
    return widget.options.map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(
          value,
        ),
      );
    }).toList();
  }

}
