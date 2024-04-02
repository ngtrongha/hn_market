import 'package:flutter/material.dart';

class CustomRadio<T> extends StatelessWidget {
  const CustomRadio(
      {super.key,
      required this.value,
      required this.groupValue,
      this.onChanged});
  final T value;
  final T groupValue;
  final void Function(T?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Radio<T>(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      activeColor: Theme.of(context).primaryColor,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
    );
  }
}
