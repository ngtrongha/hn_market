import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../utils/utils.dart';
import 'overlay.dart';

@RoutePage()
class QrScanScreen extends StatefulWidget {
  const QrScanScreen({super.key, required this.onResult});
  final void Function(BarcodeCapture code) onResult;
  @override
  State<QrScanScreen> createState() => _QrScanScreenState();
}

class _QrScanScreenState extends State<QrScanScreen> {
  late MobileScannerController controller;
  @override
  void initState() {
    controller = MobileScannerController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            MobileScanner(
              controller: controller,
              fit: BoxFit.cover,
              errorBuilder: (context, error, child) {
                return ColoredBox(
                  color: Colors.black,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.no_photography,
                          color: Theme.of(context).colorScheme.primary,
                          size: 100,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          "Failed to load camera.",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              },
              onDetect: (barcodes) {
                if (barcodes.barcodes.isNotEmpty) {
                  controller.stop();
                  widget.onResult.call(barcodes);
                }
              },
            ),
            Container(
              decoration: ShapeDecoration(
                shape: OverlayShape(
                    borderRadius: 40,
                    borderLength: 80,
                    borderWidth: 6,
                    borderColor: Colors.white),
              ),
            ),
            Positioned(
              top: 96,
              child: Opacity(
                opacity: 0.80,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 48),
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    color: Colors.black.withOpacity(0.699999988079071),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: 'Tìm mã để quét'.size14.w500.color(Colors.white),
                ),
              ),
            ),
            Positioned(
              top: 16,
              left: 16,
              child: Container(
                width: 40.sp,
                height: 40.sp,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(360),
                  ),
                ),
                child: Icon(
                  Icons.arrow_back,
                  size: 23.sp,
                  color: '#151515'.color,
                ),
              ).onTap(() {
                Utils.appRouter.maybePop();
              }),
            )
          ],
        ),
      ),
    );
  }
}
