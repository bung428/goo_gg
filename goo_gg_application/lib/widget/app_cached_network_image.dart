// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppCachedNetworkImage extends StatelessWidget {
  final String url;
  final double? size;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const AppCachedNetworkImage({
    super.key,
    required this.url,
    this.size,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    final _width = size ?? width;
    final _height = size ?? height;
    if (url.isEmpty) {
      return SizedBox(width: _width, height: _height,);
    } else {
      return CachedNetworkImage(
        width: _width,
        height: _height,
        fit: BoxFit.contain,
        imageUrl: url,
      );
    }
  }
}
