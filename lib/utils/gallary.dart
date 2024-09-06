// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:permission_handler/permission_handler.dart';

import 'gallary.dart';
export 'package:wechat_assets_picker/wechat_assets_picker.dart';
export 'package:wechat_camera_picker/wechat_camera_picker.dart';

class Gallery {
  final BuildContext context;
  Gallery(this.context);
  Future<Uint8List?> cropImage(final String path) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      compressFormat: ImageCompressFormat.png,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Tuỳ chỉnh ảnh',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Theme.of(context).primaryColor,
            statusBarColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true),
        IOSUiSettings(
          title: 'Tuỳ chỉnh ảnh',
        ),
      ],
    );
    if (croppedFile == null) {
      return null;
    }
    return await croppedFile.readAsBytes();
  }

  Future<List<AssetEntity>?> cameraAndStay({
    final int maxAssetsCount = 20,
    final List<AssetEntity>? selectedAssets,
  }) async {
    final photos = await Permission.photos.request();
    final storage = await Permission.storage.request();
    if ([PermissionStatus.granted, PermissionStatus.limited].contains(photos) ||
        [PermissionStatus.granted, PermissionStatus.limited]
            .contains(storage)) {
      return await AssetPicker.pickAssets(
        context,
        useRootNavigator: false,
        pickerConfig: AssetPickerConfig(
          maxAssets: maxAssetsCount,
          selectedAssets: selectedAssets,
          requestType: RequestType.image,
          // themeColor: Theme.of(context).primaryColor,
          specialItemPosition: SpecialItemPosition.prepend,
          pickerTheme: ThemeData.dark().copyWith(
            primaryColor: Colors.grey[900],
            primaryColorLight: Colors.grey[900],
            primaryColorDark: Colors.grey[900],
            canvasColor: Colors.grey[850],
            scaffoldBackgroundColor: Colors.grey[900],
            cardColor: Colors.grey[900],
            highlightColor: Colors.transparent,
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: Theme.of(context).primaryColor,
              selectionColor: Theme.of(context).primaryColor.withAlpha(100),
              selectionHandleColor: Theme.of(context).primaryColor,
            ),
            indicatorColor: Theme.of(context).primaryColor,
            appBarTheme: AppBarTheme(
              backgroundColor: Theme.of(context).primaryColor,
              elevation: 0,
            ),
            buttonTheme: const ButtonThemeData(buttonColor: Colors.white),
            colorScheme: ColorScheme(
              primary: Colors.grey[900]!,
              secondary: Theme.of(context).primaryColor,
              surface: Colors.grey[900]!,
              brightness: Brightness.dark,
              error: const Color(0xffcf6679),
              onPrimary: Colors.black,
              onSecondary: Colors.black,
              onSurface: Colors.white,
              onError: Colors.black,
            ),
          ),
          specialItemBuilder: (
            BuildContext context,
            AssetPathEntity? path,
            int length,
          ) {
            if (path?.isAll != true) {
              return null;
            }
            return Semantics(
              label: 'label',
              button: true,
              onTapHint: 'onTapHint',
              child: InkWell(
                onTap: () async {
                  final status = await Permission.camera.request();
                  if ([PermissionStatus.granted, PermissionStatus.limited]
                      .contains(status)) {
                    final AssetEntity? result =
                        await CameraPicker.pickFromCamera(context,
                            pickerConfig: const CameraPickerConfig());
                    if (result == null) {
                      return;
                    }
                    final AssetPicker<AssetEntity, AssetPathEntity> picker =
                        context.findAncestorWidgetOfExactType()!;
                    final DefaultAssetPickerBuilderDelegate builder =
                        picker.builder as DefaultAssetPickerBuilderDelegate;
                    final DefaultAssetPickerProvider p = builder.provider;
                    await p.switchPath(
                      PathWrapper<AssetPathEntity>(
                        path:
                            await p.currentPath!.path.obtainForNewProperties(),
                      ),
                    );
                    p.selectAsset(result);
                  } else {
                    // await DialogUtils(context)
                    //     .errorPermisstionPopup(
                    //         title: 'Truy cập vào camera',
                    //         subTitle:
                    //             'Như vậy, bạn có thể chụp ảnh, quay video. Bạn có thể thay đổi lựa chon này bất cứ lúc nào trong phần cài đặt thiết bị',
                    //         cancelText: 'Lúc khác',
                    //         confirmText: 'Cho phép truy cập')
                    //     .then((value) {
                    //   if (value) {
                    //     AppSettings.openAppSettings();
                    //   } else {
                    //     return;
                    //   }
                    // });
                  }
                },
                child: const Center(
                  child: Icon(Icons.camera_enhance, size: 42.0),
                ),
              ),
            );
          },
        ),
      );
    } else {
      // await DialogUtils(context)
      //     .errorPermisstionPopup(
      //         title: 'Truy cập vào thư viện ảnh',
      //         subTitle:
      //             'Cho phép truy cập hình ảnh, gợi ý cho bạn tải lên cũng như bật các tính năng khác',
      //         cancelText: 'Lúc khác',
      //         confirmText: 'Cho phép truy cập')
      //     .then((value) {
      //   if (value) {
      //     AppSettings.openAppSettings();
      //   } else {
      //     return;
      //   }
      // });
    }
    return null;
  }

  Future<AssetEntity?> camera({
    final int maxAssetsCount = 20,
    required Function(BuildContext, AssetEntity) handleResult,
  }) async {
    final photos = await Permission.photos.request();
    final storage = await Permission.storage.request();
    if ([PermissionStatus.granted, PermissionStatus.limited].contains(photos) ||
        [PermissionStatus.granted, PermissionStatus.limited]
            .contains(storage)) {
      return await CameraPicker.pickFromCamera(
        context,
        useRootNavigator: false,
        locale: const Locale('vi'),
        pickerConfig: CameraPickerConfig(
          enableRecording: false,
          resolutionPreset: ResolutionPreset.high,
          imageFormatGroup: ImageFormatGroup.jpeg,
          preferredLensDirection: CameraLensDirection.back,
          foregroundBuilder: (context, controller) {
            return AspectRatio(
              aspectRatio: 1.0,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            );
          },
          theme: ThemeData.dark().copyWith(
            primaryColor: Colors.grey[900],
            primaryColorLight: Colors.grey[900],
            primaryColorDark: Colors.grey[900],
            canvasColor: Colors.grey[850],
            scaffoldBackgroundColor: Colors.grey[900],
            cardColor: Colors.grey[900],
            highlightColor: Colors.transparent,
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: Theme.of(context).primaryColor,
              selectionColor: Theme.of(context).primaryColor.withAlpha(100),
              selectionHandleColor: Theme.of(context).primaryColor,
            ),
            indicatorColor: Theme.of(context).primaryColor,
            appBarTheme: AppBarTheme(
              backgroundColor: Theme.of(context).primaryColor,
              elevation: 0,
            ),
            buttonTheme: const ButtonThemeData(buttonColor: Colors.white),
            colorScheme: ColorScheme(
              primary: Colors.grey[900]!,
              secondary: Theme.of(context).primaryColor,
              surface: Colors.grey[900]!,
              brightness: Brightness.dark,
              error: const Color(0xffcf6679),
              onPrimary: Colors.black,
              onSecondary: Colors.black,
              onSurface: Colors.white,
              onError: Colors.black,
            ),
          ),
        ),
      );
    } else {
      // await DialogUtils(context)
      //     .errorPermisstionPopup(
      //         title: 'Truy cập vào thư viện ảnh',
      //         subTitle:
      //             'Cho phép truy cập hình ảnh, gợi ý cho bạn tải lên cũng như bật các tính năng khác',
      //         cancelText: 'Lúc khác',
      //         confirmText: 'Cho phép truy cập')
      //     .then((value) {
      //   if (value) {
      //     if ([PermissionStatus.denied, PermissionStatus.permanentlyDenied]
      //             .contains(photos) ||
      //         [PermissionStatus.denied, PermissionStatus.permanentlyDenied]
      //             .contains(storage)) {
      //       AppSettings.openAppSettings();
      //     }
      //   } else {
      //     return;
      //   }
      // });
    }
    return null;
  }

  static Future<List<File>> converToFiles(List<AssetEntity> list) async {
    var result = <File>[];
    for (var element in list) {
      final file = await element.file;
      result = [...result, file!];
    }
    return result;
  }
}
