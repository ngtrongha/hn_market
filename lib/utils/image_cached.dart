import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hn_market/utils/loading.dart'; 

class ImageCached extends StatelessWidget {
  const ImageCached({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.alignment = Alignment.center,
    this.borderRadius = 4,
    this.fit = BoxFit.cover,
    this.disable = false,
  });
  final String image;
  final double? width;
  final double? height;
  final Alignment alignment;
  final double borderRadius;
  final BoxFit? fit;
  final bool disable;
  @override
  Widget build(BuildContext context) {
    // return TDImage(
    //   imgUrl: image,
    //   type: TDImageType.roundedSquare,
    //   width: width,
    //   height: height,
    //   alignment: alignment,
    // );
    return Container(
      constraints: BoxConstraints(
          maxHeight: ScreenUtil().screenHeight,
          maxWidth: ScreenUtil().screenWidth),
      child: CachedNetworkImage(
        imageUrl: image,
        width: width ?? double.infinity,
        height: height ?? 100.sp,
        alignment: alignment,
        imageBuilder: (context, imageProvider) => Container(
          width: width ?? double.infinity,
          height: height ?? 100.sp,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              image: DecorationImage(
                  alignment: alignment,
                  image: imageProvider,
                  fit: fit,
                  colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(disable ? 0.7 : 0),
                      BlendMode.hardLight))),
        ),
        fit: fit,
        // progressIndicatorBuilder: (context, url, progress) =>
        //     SizedBox(width: 50.sp, height:50.sp, child: const LoadingWidget()),
        errorWidget: (context, url, error) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: const Icon(
              Icons.error,
              color: Colors.red,
            ),
          );
        },
        placeholder: (context, url) => const Center(child: LoadingWidget()),
      ),
    );
  }
}
