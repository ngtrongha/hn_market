import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

String? enumToString(dynamic e) {
  if (e == null) {
    return null;
  }
  return e.toString().split('.').last;
}

extension DoubleExtension on num {
  String get removeTrailingZero =>
      toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '');
}

extension StringsExtension on String {
  String noAccentVietnamese([final bool? enable]) {
    String result = this;
    if (enable == null || !enable) {
      result = result.replaceAll(RegExp('[áàảãạăắằẳẵặâấầẩẫậ]'), 'a');
      result = result.replaceAll(RegExp('[ÁÀẢÃẠĂẮẰẲẴẶÂẤẦẨẪẬ]'), 'A');
      result = result.replaceAll(RegExp('[éèẻẽẹêếềểễệ]'), 'e');
      result = result.replaceAll(RegExp('[ÉÈẺẼẸÊẾỀỂỄỆ]'), 'E');
      result = result.replaceAll(RegExp('[óòỏõọôốồổỗộơớờởỡợ]'), 'o');
      result = result.replaceAll(RegExp('[ÓÒỎÕỌÔỐỒỔỖỘƠỚỜỞỠỢ]'), 'O');
      result = result.replaceAll(RegExp('[íìỉĩị]'), 'i');
      result = result.replaceAll(RegExp('[ÍÌỈĨỊ]'), 'I');
      result = result.replaceAll(RegExp('[úùủũụưứừửữự]'), 'u');
      result = result.replaceAll(RegExp('[ÚÙỦŨỤƯỨỪỬỮỰ]'), 'U');
      result = result.replaceAll(RegExp('[ýỳỷỹỵ]'), 'y');
      result = result.replaceAll(RegExp('[ÝỲỶỸỴ]'), 'Y');
      result = result.replaceAll(RegExp('đ'), 'd');
      result = result.replaceAll(RegExp('Đ'), 'D');
    }
    return result;
  }

  T? toEnum<T>(List<T> list) {
    try {
      final T item = list.firstWhere(
        (T e) {
          final String t = e.toString().split('.').last;
          return t == this;
        },
      );
      return item;
    } catch (_) {}
    return null;
  }

  String pageParams([Map<String, dynamic> params = const {}]) {
    var router = this;
    if (params.isNotEmpty) {
      params.forEach((key, value) {
        if (key == params.keys.first) {
          router = '$router?$key=$value';
        } else {
          router = '$router&$key=$value';
        }
      });
    }
    return router;
  }
}

extension Color2StringExtension on Color {
  String get toHexTriplet =>
      (value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase();
}

extension SVGExtension on String {
  String get svg => 'assets/svg/$this.svg';
  String get riv => 'assets/rive/$this.riv';
  String get lottie => 'assets/lottie/$this.json';
  String get png => 'assets/png/$this.png';
  String get jpg => 'assets/jpg/$this.jpg';
}

extension ColorExtension on String {
  Color get color => isEmpty
      ? Color(int.parse('0xFF34499D'))
      : Color(substring(0, 1) != '#'
          ? int.parse('0xFF$this')
          : int.parse(replaceAll('#', '0xFF')));
}

extension FontSizeExtension on String {
  TDText get size32 => TDText(
        this,
        style: TextStyle(
          fontSize: 32.sp,
          color: '151515'.color,
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
      );
  TDText get size30 => TDText(
        this,
        style: TextStyle(
          fontSize: 30.sp,
          color: '151515'.color,
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
      );
  TDText get size28 => TDText(
        this,
        style: TextStyle(
          fontSize: 28.sp,
          color: '151515'.color,
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
      );
  TDText get size26 => TDText(
        this,
        style: TextStyle(
          fontSize: 26.sp,
          color: '151515'.color,
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
      );
  TDText get size24 => TDText(
        this,
        style: TextStyle(
          fontSize: 24.sp,
          color: '151515'.color,
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
      );
  TDText get size22 => TDText(
        this,
        style: TextStyle(
          fontSize: 22.sp,
          color: '151515'.color,
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
      );
  TDText get size20 => TDText(
        this,
        style: TextStyle(
          fontSize: 20.sp,
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
      );
  TDText get size18 => TDText(
        this,
        style: TextStyle(
          fontSize: 18.sp,
          color: '151515'.color,
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
      );
  TDText get size17 => TDText(
        this,
        style: TextStyle(
          fontSize: 17.sp,
          color: '535353'.color,
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
      );
  TDText get size16 => TDText(
        this,
        style: TextStyle(
          fontSize: 16.sp,
          color: '535353'.color,
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
      );
  TDText get size15 => TDText(
        this,
        style: TextStyle(
          fontSize: 15.sp,
          color: '535353'.color,
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
      );
  TDText get size14 => TDText(
        this,
        style: TextStyle(
          fontSize: 14.sp,
          color: '535353'.color,
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
      );
  TDText get size13 => TDText(
        this,
        style: TextStyle(
          fontSize: 13.sp,
          color: '535353'.color,
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
      );
  TDText get size12 => TDText(
        this,
        style: TextStyle(
          fontSize: 12.sp,
          color: '535353'.color,
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
      );
  TDText get size11 => TDText(
        this,
        style: TextStyle(
          fontSize: 11.sp,
          color: '535353'.color,
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
      );
  TDText get size10 => TDText(
        this,
        style: TextStyle(
          fontSize: 10.sp,
          color: '535353'.color,
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
      );
}

extension FontWeightExtension on TDText {
  TDText get w100 => TDText(
        data!,
        style: style?.copyWith(fontWeight: FontWeight.w100),
      );
  TDText get w200 => TDText(
        data!,
        style: style?.copyWith(fontWeight: FontWeight.w200),
      );
  TDText get w300 => TDText(
        data!,
        style: style?.copyWith(fontWeight: FontWeight.w300),
      );
  TDText get w400 => TDText(
        data!,
        style: style?.copyWith(fontWeight: FontWeight.w400),
      );
  TDText get w500 => TDText(
        data!,
        style: style?.copyWith(fontWeight: FontWeight.w500),
      );
  TDText get w600 => TDText(
        data!,
        style: style?.copyWith(fontWeight: FontWeight.w600),
      );
  TDText get w700 => TDText(
        data!,
        style: style?.copyWith(fontWeight: FontWeight.w700),
      );
  TDText get w800 => TDText(
        data!,
        style: style?.copyWith(fontWeight: FontWeight.w800),
      );
  TDText get w900 => TDText(
        data!,
        style: style?.copyWith(fontWeight: FontWeight.w900),
      );
  TDText get bold => TDText(
        data!,
        style: style?.copyWith(fontWeight: FontWeight.bold),
      );
}

extension TextDecorationExtension on TDText {
  TDText get lineThrough => TDText(
        data!,
        style: style?.copyWith(decoration: TextDecoration.lineThrough),
      );
  TDText get overline => TDText(
        data!,
        style: style?.copyWith(decoration: TextDecoration.overline),
      );
  TDText get underline => TDText(
        data!,
        style: style?.copyWith(decoration: TextDecoration.underline),
      );
}

extension TextOverflowExtension on TDText {
  TDText get clip => TDText(
        data!,
        style: style?.copyWith(overflow: TextOverflow.clip),
      );
  Widget get ellipsis => TDText(
        data!,
        style: style?.copyWith(overflow: TextOverflow.ellipsis),
      );
  Widget get fade => TDText(
        data!,
        style: style?.copyWith(overflow: TextOverflow.fade),
      );
}

extension TextAlignExtension on TDText {
  TDText get center => TDText(
        data!,
        textAlign: TextAlign.center,
        style: style,
      );
  TDText get end => TDText(
        data!,
        textAlign: TextAlign.end,
        style: style,
      );
  TDText get justify => TDText(
        data!,
        textAlign: TextAlign.justify,
        style: style,
      );
  TDText get left => TDText(
        data!,
        textAlign: TextAlign.left,
        style: style,
      );
  TDText get right => TDText(
        data!,
        textAlign: TextAlign.right,
        style: style,
      );
  TDText get start => TDText(
        data!,
        textAlign: TextAlign.start,
        style: style,
      );
}

extension FontColorExtension on TDText {
  TDText color(final Color color) {
    return TDText(
      data!,
      style: style?.copyWith(color: color),
    );
  }
}

extension HeightStyleExtension on TDText {
  TDText height(final double height) {
    return TDText(
      data!,
      style: style?.copyWith(height: height),
    );
  }
}

extension FontStyleExtension on TDText {
  TDText get italic => TDText(
        data!,
        style: style?.copyWith(fontStyle: FontStyle.italic),
      );
  TDText lineHeight(final double height) => TDText(
        data!,
        style: style?.copyWith(height: height / 100),
      );
}

extension TextExtension on String {
  TDText requiredText({
    final Color? color,
    final double fontSize = 14,
    final FontWeight? fontWeight,
  }) {
    return TDText.rich(
      TDTextSpan(
          text: this,
          style: TextStyle(
              color: color ?? '535353'.color,
              fontSize: fontSize.sp,
              fontWeight: fontWeight),
          children: [
            TDTextSpan(
              text: '*',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: fontSize,
                  fontWeight: fontWeight),
            )
          ]),
    );
  }
}
