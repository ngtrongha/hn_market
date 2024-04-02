import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox(
      {super.key,
      required this.value,
      this.onChanged,
      this.title,
      this.subTitle});
  final bool value;
  final void Function(bool?)? onChanged;
  final String? title;
  final String? subTitle;
  @override
  Widget build(BuildContext context) {
    return TDCheckbox(
      checked: value,
      onCheckBoxChanged: onChanged,
      title: title,
      subTitle: subTitle,
    );
  }
}
