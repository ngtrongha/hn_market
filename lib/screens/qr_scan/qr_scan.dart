import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../utils/utils.dart';
import 'overlay.dart';
import 'scanner_error_widget.dart';

@RoutePage()
class QrScanScreen extends StatefulWidget {
  const QrScanScreen({super.key, required this.onResult});
  final void Function(BarcodeCapture code, MobileScannerController controller)
      onResult;
  @override
  State<QrScanScreen> createState() => _QrScanScreenState();
}

class _QrScanScreenState extends State<QrScanScreen>
    with WidgetsBindingObserver {
  late MobileScannerController controller;
  @override
  void initState() {
    controller =
        MobileScannerController(useNewCameraSelector: Platform.isAndroid);
    WidgetsBinding.instance.addObserver(this);
    unawaited(controller.start());
    super.initState();
  }

  @override
  Future<void> dispose() async {
    WidgetsBinding.instance.removeObserver(this);
    await controller.dispose();
    super.dispose(); 
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // If the controller is not ready, do not try to start or stop it.
    // Permission dialogs can trigger lifecycle changes before the controller is ready.
    if (!controller.value.isInitialized) {
      return;
    }

    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        return;
      case AppLifecycleState.resumed:
        // Restart the scanner when the app is resumed.
        // Don't forget to resume listening to the barcode events.
        unawaited(controller.start());
      case AppLifecycleState.inactive:
        // Stop the scanner when the app is paused.
        // Also stop the barcode events subscription.
        unawaited(controller.stop());
    }
  }

  @override
  Widget build(BuildContext context) {
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.sizeOf(context).center(Offset.zero),
      width: 300,
      height: 150,
    );
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Center(
            child: MobileScanner(
              fit: BoxFit.cover,
              controller: controller,
              scanWindow: scanWindow,
              errorBuilder: (context, error, child) {
                return ScannerErrorWidget(error: error);
              },
              onDetect: (barcodes) {
                widget.onResult.call(barcodes, controller);
              },
            ),
          ),
          ValueListenableBuilder(
            valueListenable: controller,
            builder: (context, value, child) {
              if (!value.isInitialized ||
                  !value.isRunning ||
                  value.error != null) {
                return const SizedBox();
              }
              return Container(
                decoration: ShapeDecoration(
                  shape: OverlayShape(
                      borderRadius: 40,
                      borderLength: 80,
                      borderWidth: 6,
                      cutOutSize: null,
                      cutOutWidth: scanWindow.width,
                      cutOutHeight: scanWindow.height,
                      borderColor: Colors.white),
                ),
              );
            },
          ),
          Positioned(
            top: 60 + ScreenUtil().statusBarHeight,
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
                child: 'Quét mã Barcode'.size14.w500.color(Colors.white),
              ),
            ),
          ),
          Positioned(
            top: 16 + ScreenUtil().statusBarHeight,
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
    );
  }
}
