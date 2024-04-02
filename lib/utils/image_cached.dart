import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ImageCached extends StatelessWidget {
  const ImageCached({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.alignment = Alignment.center,
  });
  final String image;
  final double? width;
  final double? height;
  final Alignment alignment;
  @override
  Widget build(BuildContext context) {
    return TDImage(
      imgUrl: image,
      type: TDImageType.roundedSquare,
      width: width,
      height: height,
      alignment: alignment,
    );
    // return Container(
    //   constraints: BoxConstraints(
    //       maxHeight: ScreenUtil().screenHeight,
    //       maxWidth: ScreenUtil().screenWidth),
    //   child: CachedNetworkImage(
    //     imageUrl: image,
    //     width: width ?? double.infinity,
    //     height: height ?? 100.sp,
    //     alignment: alignment,
    //     imageBuilder: (context, imageProvider) => Container(
    //       width: width ?? double.infinity,
    //       height: height ?? 100.sp,
    //       decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(borderRadius),
    //           image: DecorationImage(
    //               alignment: alignment,
    //               image: imageProvider,
    //               fit: fit,
    //               colorFilter: ColorFilter.mode(
    //                   Colors.white.withOpacity(disable ? 0.7 : 0),
    //                   BlendMode.hardLight))),
    //     ),
    //     fit: fit,
    // progressIndicatorBuilder: (context, url, progress) =>
    //     CircularProgressIndicator(
    //       color: AppColors.secondaryColor,
    //   value: progress.downloaded / (progress.totalSize ?? 1),
    // ),
    //     errorWidget: (context, url, error) {
    //       return ClipRRect(
    //         borderRadius: BorderRadius.circular(borderRadius),
    //         child: const Icon(
    //           Icons.error,
    //           color: Colors.red,
    //         ),
    //       );
    //     },
    //     placeholder: (context, url) =>
    //         const CircularProgressIndicator().marginAll(16),
    //   ),
    // );
  }
}
