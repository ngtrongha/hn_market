import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart'; 

import 'utils.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  const CustomAppBar(
    this.context, {
    super.key,
    this.titleWidget,
    this.title,
    this.centerTitle = true,
    this.backgroundColor,
    this.iconTheme,
    this.customLeading,
    this.elevation = 1,
    this.actions = const [],
    this.hideLeading = false,
    this.shadowColor,
  });
  final BuildContext context;
  final Widget? titleWidget;
  final String? title;
  final List<Widget>? actions;
  final bool hideLeading;
  final bool centerTitle;
  final Color? backgroundColor;
  final IconThemeData? iconTheme;
  final Widget? customLeading;
  final Color? shadowColor;
  final double elevation;

  @override
  Widget get child => AppBar(
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: elevation,
      shadowColor: shadowColor ?? '#F1EFEF'.color,
      iconTheme: iconTheme,
      centerTitle: centerTitle,
      title: titleWidget ?? title?.size18.w700.color('151515'.color),
      // systemOverlayStyle: const SystemUiOverlayStyle(
      //   statusBarColor: Colors.white,
      //   statusBarBrightness: Brightness.light,
      //   statusBarIconBrightness: Brightness.dark,
      // ),
      automaticallyImplyLeading: false,
      actions: [
        ...?actions,
      ],
      leading: hideLeading ? null : customLeading ?? const AutoLeadingButton());

  @override
  Size get preferredSize => Size.fromHeight(56.sp);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
