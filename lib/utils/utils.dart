// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../main/bloc/main_bloc.dart';
import '../app_router/app_router.dart';
import 'utils.dart';

export 'extensions/string_extension.dart';
export 'extensions/widget_extension.dart';
export 'custom_appbar.dart';
export 'custom_scaffold.dart';

const pageSize = 20;
const refkey = 'refcode';
const mapZoom = 15.0;

class Utils {
  static const debugLog = true;
  static late MainBloc mainBloc;
  static final appRouter = AppRouter();
  static final log = TalkerFlutter.init();
  int getTotalPage(int total) {
    int result = total ~/ pageSize;
    if (total % pageSize > 0) result += 1;
    return result;
  }

  Future<Uint8List> svgToPng(
      final BuildContext context, final String svgString) async {
    final pictureInfo =
        await vg.loadPicture(SvgStringLoader(svgString), context);

    final image = await pictureInfo.picture.toImage(100, 100);
    final byteData = await image.toByteData(format: ImageByteFormat.png);

    if (byteData == null) {
      throw Exception('Unable to convert SVG to PNG');
    }
    final pngBytes = byteData.buffer.asUint8List();
    return pngBytes;
  }

  static String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  static int get randomId => -Random().nextInt(9999999);
  static List<TextSpan> highlightResultSearch(String source, String query) {
    if (query.isEmpty) {
      return [TextSpan(text: source)];
    }

    var matches = <Match>[];
    for (final token in query.trim().toLowerCase().split(' ')) {
      matches.addAll(token.allMatches(source.toLowerCase()));
    }

    if (matches.isEmpty) {
      return [TextSpan(text: source)];
    }
    matches.sort((a, b) => a.start.compareTo(b.start));

    int lastMatchEnd = 0;
    final List<TextSpan> children = [];
    for (final match in matches) {
      if (match.end <= lastMatchEnd) {
        // already matched -> ignore
      } else if (match.start <= lastMatchEnd) {
        children.add(TextSpan(
          text: source.substring(lastMatchEnd, match.end),
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ));
      } else if (match.start > lastMatchEnd) {
        children.add(TextSpan(
          text: source.substring(lastMatchEnd, match.start),
        ));

        children.add(TextSpan(
          text: source.substring(match.start, match.end),
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ));
      }

      if (lastMatchEnd < match.end) {
        lastMatchEnd = match.end;
      }
    }

    if (lastMatchEnd < source.length) {
      children.add(TextSpan(
        text: source.substring(lastMatchEnd, source.length),
      ));
    }

    return children;
  }

  // Future<Position> determinePosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return Future.error('Dịch vụ định vị bị vô hiệu hóa.');
  //   }

  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Future.error('Quyền vị trí bị từ chối');
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     return Future.error(
  //         'Quyền vị trí bị từ chối vĩnh viễn, chúng tôi không thể yêu cầu quyền.');
  //   }

  //   return await Geolocator.getCurrentPosition();
  // }

  // Future<void> openUrl(final String url) async {
  //   if (!await launchUrl(Uri.parse(url),
  //       mode: LaunchMode.externalApplication)) {
  //     throw Exception('Could not launch $url');
  //   }
  // }

  // Future<Position> getCurrentPosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   // Test if location services are enabled.
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     // Location services are not enabled don't continue
  //     // accessing the position and request users of the
  //     // App to enable the location services.
  //     return Future.error('Location services are disabled.');
  //   }

  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       // Permissions are denied, next time you could try
  //       // requesting permissions again (this is also where
  //       // Android's shouldShowRequestPermissionRationale
  //       // returned true. According to Android guidelines
  //       // your App should show an explanatory UI now.
  //       return Future.error('Location permissions are denied');
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     // Permissions are denied forever, handle appropriately.
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }

  //   // When we reach here, permissions are granted and we can
  //   // continue accessing the position of the device.
  //   return await Geolocator.getCurrentPosition();
  // }

  static Future<void> deletePopup(
    final BuildContext context, {
    final void Function()? onConfirm,
    final void Function()? onBack,
  }) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            'Xoá thông tin'.size16.w600.marginOnly(bottom: 12.sp),
            'Bạn có chắc muốn xoá thông tin này không?'
                .size16
                .marginOnly(bottom: 10.sp),
            Row(
              children: [
                Expanded(
                  child: 'Huỷ'.size16.color('3951B1'.color).elevatedButton(
                      onPressed: onBack, backgroundColor: Colors.white),
                ),
                SizedBox(
                  width: 10.sp,
                ),
                Expanded(
                  child: 'Đồng ý'.size16.w600.elevatedButton(
                      onPressed: onConfirm, backgroundColor: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  static String dateToString(final String format, [final DateTime? time]) {
    if (time == null) {
      return '';
    }
    return DateFormat(format).format(time);
  }

  // static Future<void> openMap(double latitude, double longitude) async {
  //   String googleUrl =
  //       'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
  //   if (await canLaunchUrl(Uri.parse(googleUrl))) {
  //     await launchUrl(Uri.parse(googleUrl),
  //         mode: LaunchMode.externalApplication);
  //   } else {
  //     throw 'Could not open the map.';
  //   }
  // }
  static String moneyFormat(price, {String? symbol, int? decimal}) {
    return CurrencyFormatter.format(
      price ?? 0,
      CurrencyFormatterSettings(
        symbol: symbol ?? 'đ',
        symbolSide: SymbolSide.right,
        thousandSeparator: '.',
      ),
      decimal: decimal ?? 0,
    );
  }

  static String formatNumber(double number) {
    const double billion = 1000000000;
    const double million = 1000000;
    const double kilo = 1000;
    final isNegative = number <= 0;

    if (isNegative) {
      number = number.abs();
    }

    String resultNumber;
    String symbol;
    if (number >= billion) {
      resultNumber = (number / billion).toStringAsFixed(1);
      symbol = 'B';
    } else if (number >= million) {
      resultNumber = (number / million).toStringAsFixed(1);
      symbol = 'M';
    } else if (number >= kilo) {
      resultNumber = (number / kilo).toStringAsFixed(1);
      symbol = 'K';
    } else {
      resultNumber = number.toStringAsFixed(1);
      symbol = '';
    }

    if (resultNumber.endsWith('.0')) {
      resultNumber = resultNumber.substring(0, resultNumber.length - 2);
    }

    if (isNegative) {
      resultNumber = '-$resultNumber';
    }

    if (resultNumber == '-0') {
      resultNumber = '0';
    }

    return resultNumber + symbol;
  }

  unfocusScreen() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  // static Future<void> resultFunc(result, VoidCallback func,
  //     {bool showError = true, bool refershToken = false}) async {
  //   if (result == null) {
  //     throw Future.error(
  //       'null',
  //       StackTrace.fromString('null'),
  //     );
  //   } else if (result['success']) {
  //     func.call();
  //   } else {
  //     if (refershToken) {
  //       Utils.mainBloc.add(const UpdateIsRefreshToken(false));
  //       Utils.mainBloc.add(const DeleteLogin());
  //       Get.offAllNamed(SplashScreen.path);
  //     }
  //     if (result['error'] != null) {
  //       if (result['error']['message'] != null) {
  //         if (showError) Toast.notifyError(result['error']['message']);
  //         throw Future.error(Exception(result['error']),
  //             StackTrace.fromString(jsonEncode(result['error'])));
  //       } else {
  //         throw Future.error(Exception(result['error']),
  //             StackTrace.fromString(jsonEncode(result['error'])));
  //       }
  //     } else {
  //       throw Future.error(
  //         Utils.appLocalizations.system_error,
  //         StackTrace.fromString(Utils.appLocalizations.system_error),
  //       );
  //     }
  //   }
  // }

  String generateRandomString(int len) {
    var r = Random();
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
  }

  // makePhoneCall(String phoneNumber) async {
  //   final Uri launchUri = Uri(
  //     scheme: 'tel',
  //     path: phoneNumber,
  //   );
  //   await launchUrl(launchUri);
  // }

  // launchInBrowser(String url) async {
  //   if (!await launchUrl(
  //     Uri.tryParse(url)!,
  //     mode: LaunchMode.externalApplication,
  //   )) {
  //     throw 'Could not launch $url';
  //   }
  // }
}
