// ignore_for_file: use_build_context_synchronously, depend_on_referenced_packages

import 'dart:io';
 
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
 
import 'gallary.dart';
export 'package:wechat_assets_picker/wechat_assets_picker.dart';
export 'package:wechat_camera_picker/wechat_camera_picker.dart';

class Gallery {
  final BuildContext context;
  Gallery(this.context);
  // Future<AssetEntity?> cropImage(final String path) async {
  //   CroppedFile? croppedFile = await ImageCropper().cropImage(
  //     sourcePath: path,
  //     aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
  //     compressFormat: ImageCompressFormat.png,
  //     aspectRatioPresets: [
  //       CropAspectRatioPreset.square,
  //     ],
  //     uiSettings: [
  //       AndroidUiSettings(
  //           toolbarTitle: 'Tuỳ chỉnh ảnh',
  //           toolbarColor: Colors.white,
  //           toolbarWidgetColor: Theme.of(context).primaryColor,
  //           statusBarColor: Colors.white,
  //           initAspectRatio: CropAspectRatioPreset.square,
  //           lockAspectRatio: false),
  //       IOSUiSettings(
  //         title: 'Tuỳ chỉnh ảnh',
  //       ),
  //     ],
  //   );
  //   if (croppedFile == null) {
  //     return null;
  //   }
  //   final AssetEntity? fileEntity = await PhotoManager.editor.saveImageWithPath(
  //     croppedFile.path,
  //     title: p.basename(croppedFile.path),
  //   );

  //   return fileEntity;
  // }

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
          textDelegate: const VietNamAssetPickerTextDelegate(),
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
              background: Colors.grey[900]!,
              surface: Colors.grey[900]!,
              brightness: Brightness.dark,
              error: const Color(0xffcf6679),
              onPrimary: Colors.black,
              onSecondary: Colors.black,
              onSurface: Colors.white,
              onBackground: Colors.white,
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
                            pickerConfig:
                                const CameraPickerConfig(
                                    textDelegate:
                                        VietnamCameraPickerTextDelegate()));
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
        pickerConfig: CameraPickerConfig(
          textDelegate: const VietnameseCameraPickerTextDelegate(),
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
              background: Colors.grey[900]!,
              surface: Colors.grey[900]!,
              brightness: Brightness.dark,
              error: const Color(0xffcf6679),
              onPrimary: Colors.black,
              onSecondary: Colors.black,
              onSurface: Colors.white,
              onBackground: Colors.white,
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

class VietNamAssetPickerTextDelegate extends AssetPickerTextDelegate {
  const VietNamAssetPickerTextDelegate();

  @override
  String get languageCode => 'vi';

  @override
  String get confirm => 'Xác nhận';

  @override
  String get cancel => 'Hủy bỏ';

  @override
  String get edit => 'Biên tập';

  @override
  String get gifIndicator => 'GIF';

  @override
  String get loadFailed => 'Tải không thành công';

  @override
  String get original => 'Nguồn gốc';

  @override
  String get preview => 'Xem trước';

  @override
  String get select => 'Lựa chọn';

  @override
  String get emptyList => 'Danh sách trống';

  @override
  String get unSupportedAssetType => 'Loại nội dung HEIC không được hỗ trợ.';

  @override
  String get unableToAccessAll =>
      'Không thể truy cập tất cả nội dung trên thiết bị';

  @override
  String get viewingLimitedAssetsTip =>
      'Chỉ xem nội dung và album có thể truy cập vào ứng dụng.';

  @override
  String get changeAccessibleLimitedAssets =>
      'Nhấp để cập nhật nội dung có thể truy cập';

  @override
  String get accessAllTip =>
      'Ứng dụng chỉ có thể truy cập một số nội dung trên thiết bị.'
      'Chuyển đến cài đặt hệ thống và cho phép ứng dụng truy cập tất cả nội dung trên thiết bị.';

  @override
  String get goToSystemSettings => 'Chuyển đến cài đặt hệ thống';

  @override
  String get accessLimitedAssets => 'Tiếp tục với quyền truy cập hạn chế';

  @override
  String get accessiblePathName => 'Nội dung có thể truy cập';

  @override
  String get sTypeAudioLabel => 'Âm thanh';

  @override
  String get sTypeImageLabel => 'Hình ảnh';

  @override
  String get sTypeVideoLabel => 'Video';

  @override
  String get sTypeOtherLabel => 'Other asset';

  @override
  String get sActionPlayHint => 'chơi';

  @override
  String get sActionPreviewHint => 'xem trước';

  @override
  String get sActionSelectHint => 'lựa chọn';

  @override
  String get sActionSwitchPathLabel => 'chuyển đổi đường dẫn';

  @override
  String get sActionUseCameraHint => 'sử dụng máy ảnh';

  @override
  String get sNameDurationLabel => 'khoảng thời gian';

  @override
  String get sUnitAssetCountLabel => 'đếm';
}

class VietnamCameraPickerTextDelegate extends CameraPickerTextDelegate {
  const VietnamCameraPickerTextDelegate();

  @override
  String get languageCode => 'vi';

  @override
  String get confirm => 'Xác nhận';

  @override
  String get shootingTips => 'Nhấn để chụp ảnh.';

  @override
  String get shootingWithRecordingTips =>
      'Nhấn để chụp ảnh. Nhấn và giữ để quay video.';

  @override
  String get shootingOnlyRecordingTips => 'Nhấn và giữ để quay video.';

  @override
  String get shootingTapRecordingTips => 'Nhấn để quay video.';

  @override
  String get loadFailed => 'Tải không thành công';

  @override
  String get loading => 'Đang tải...';

  @override
  String get saving => 'Đang lưu...';

  @override
  String get sActionManuallyFocusHint => 'lấy nét thủ công';

  @override
  String get sActionPreviewHint => 'xem trước';

  @override
  String get sActionRecordHint => 'ghi ';

  @override
  String get sActionShootHint => 'chụp ảnh';

  @override
  String get sActionShootingButtonTooltip => 'nút chụp';

  @override
  String get sActionStopRecordingHint => 'dừng ghi âm';

  @override
  String sCameraLensDirectionLabel(CameraLensDirection value) => value.name;

  @override
  String? sCameraPreviewLabel(CameraLensDirection? value) {
    if (value == null) {
      return null;
    }
    return '${sCameraLensDirectionLabel(value)} xem trước máy ảnh';
  }

  @override
  String sFlashModeLabel(FlashMode mode) => 'Chế độ đèn flash: ${mode.name}';

  @override
  String sSwitchCameraLensDirectionLabel(CameraLensDirection value) =>
      'Chuyển sang ${sCameraLensDirectionLabel(value)} máy ảnh';
}
