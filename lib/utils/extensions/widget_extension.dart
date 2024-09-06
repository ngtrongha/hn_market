import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils.dart';

extension ObjectExtension on dynamic {
  void get printDLog => {if (Utils.debugLog) Utils.log.debug(this)};
  void get printELog => {if (Utils.debugLog) Utils.log.error(this)};
}

extension WidgetsExtension on Widget {
  InkWell onTap(final void Function() onTap) {
    return InkWell(
      onTap: onTap,
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      child: this,
    );
  }

  ElevatedButton elevatedButton({
    final void Function()? onPressed,
    final bool enable = true,
    final double? radius,
    final double? height,
    final Color? backgroundColor,
    final BorderSide side = BorderSide.none,
  }) {
    final bgColor = backgroundColor ?? const Color(0xFF7E57C2);
    return ElevatedButton(
      onPressed: () {
        if (enable) {
          onPressed?.call();
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: enable ? bgColor : bgColor.withOpacity(0.5),
        shape: RoundedRectangleBorder(
            side: side, borderRadius: BorderRadius.circular(radius ?? 100)),
        maximumSize: Size(double.infinity, (height ?? 40).sp),
        minimumSize: Size(double.infinity, (height ?? 40).sp),
      ),
      child: this,
    );
  }

  TextButton textButton({
    final void Function()? onPressed,
    final bool enable = true,
    final double? radius,
    final double? height,
    final double? width,
    final Color? backgroundColor,
    final BorderSide side = BorderSide.none,
  }) {
    final bgColor = backgroundColor ?? const Color(0xFF7E57C2);
    return TextButton(
      onPressed: () {
        if (enable) {
          onPressed?.call();
        }
      },
      style: TextButton.styleFrom(
        backgroundColor: enable ? bgColor : bgColor.withOpacity(0.5),
        shape: RoundedRectangleBorder(
            side: side, borderRadius: BorderRadius.circular(radius ?? 100)),
        maximumSize: Size(width ?? double.infinity, (height ?? 48).sp),
        minimumSize: Size(width ?? double.infinity, (height ?? 48).sp),
      ),
      child: this,
    );
  }

  Container marginOnly({
    final double left = 0.0,
    final double right = 0.0,
    final double top = 0.0,
    final double bottom = 0.0,
  }) {
    return Container(
      margin:
          EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      child: this,
    );
  }

  Container marginAll(final double value) {
    return Container(
      margin: EdgeInsets.all(value),
      child: this,
    );
  }

  Container marginSymmetric({
    final double vertical = 0.0,
    final double horizontal = 0.0,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }

  Container paddingAll(final double value) {
    return Container(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  Container paddingOnly({
    final double left = 0.0,
    final double right = 0.0,
    final double top = 0.0,
    final double bottom = 0.0,
  }) {
    return Container(
      padding:
          EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      child: this,
    );
  }

  Container paddingSymmetric({
    final double vertical = 0.0,
    final double horizontal = 0.0,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }
}

extension NumExtension on num {
  Gap get sized => Gap(sp);
}
