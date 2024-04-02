import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen(
      {super.key, this.bgColor = const Color.fromARGB(255, 0, 0, 0)});
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // color: bgColor.withOpacity(0.8),
      child: const LoadingWidget(),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TDLoading(
      size: TDLoadingSize.small,
      icon: TDLoadingIcon.activity,
      text: 'Đang tải...',
      axis: Axis.vertical,
    );
  }
}
