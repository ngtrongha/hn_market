import 'package:flutter/material.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({
    super.key,
    required this.avatarUrl,
    this.avatarSize = 40,
    this.shape = TDAvatarShape.circle,
    this.name,
  });
  final String avatarUrl;
  final String? name;
  final double avatarSize;
  final TDAvatarShape shape;
  @override
  Widget build(BuildContext context) {
    return TDAvatar(
      avatarUrl: avatarUrl.isEmpty
          ? 'https://ui-avatars.com/api/?name=${name ?? 'Ha Nguyen'}&size=128&background=random'
          : avatarUrl,
      avatarSize: avatarSize,
      shape: shape,
      avatarDisplayBorder: 0,
    );
  }
}
