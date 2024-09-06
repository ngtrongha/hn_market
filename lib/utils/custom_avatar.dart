import 'dart:typed_data';

import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({
    super.key,
    this.avatar,
    this.avatarUrl,
    this.avatarSize = 40,
    this.name,
  });
  final Uint8List? avatar;
  final String? avatarUrl;
  final String? name;
  final double avatarSize;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: avatar == null && avatarUrl == null
          ? Image.network(
                  'https://ui-avatars.com/api/?name=${name ?? 'Ha Nguyen'}&size=128&background=random')
              .image
          : avatar != null
              ? Image.memory(avatar!).image
              : Image.network(avatarUrl!).image,
      radius: avatarSize,
    );
  }
}
