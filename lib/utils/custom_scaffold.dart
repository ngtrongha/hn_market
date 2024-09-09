import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.extendBody = false,
    this.resizeToAvoidBottomInset,
    this.backgroundColor,
    this.floatingActionButtonLocation,
    this.bottomSheet,
    this.heightBottomSheet = 80,
  });
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Widget? floatingActionButton;
  final double heightBottomSheet;
  final bool extendBody;
  final bool? resizeToAvoidBottomInset;
  final Color? backgroundColor;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      dismissOnCapturedTaps: true,
      child: Scaffold(
        appBar: appBar,
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        floatingActionButtonLocation: floatingActionButtonLocation,
        extendBody: extendBody,
        bottomNavigationBar: bottomNavigationBar,
        bottomSheet: bottomSheet,
        floatingActionButton: floatingActionButton,
        body: SafeArea(
            minimum: EdgeInsets.only(
                bottom: bottomSheet != null ? heightBottomSheet.sp : 0),
            child: body),
      ),
    );
  }
}
