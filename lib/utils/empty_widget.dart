import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key, this.emptyText, this.type = TDEmptyType.plain});
  final String? emptyText;
  final TDEmptyType type;
  @override
  Widget build(BuildContext context) {
    return TDEmpty(
      type: type,
      emptyText: emptyText ?? 'Không có dữ liệu',
    );
  }
}
