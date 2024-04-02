import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

@RoutePage()
class EmptyPageScreen extends StatelessWidget {
  const EmptyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TDEmpty(
      type: TDEmptyType.plain,
      emptyText: 'Không có dữ liệu',
    );
  }
}
