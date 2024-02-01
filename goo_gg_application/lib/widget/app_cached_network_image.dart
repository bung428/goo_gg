// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum DecoType {
  circle,
  normal,
  borderRadius,
}

class AppCachedNetworkImage extends StatelessWidget {
  final String url;
  final double? radius;
  final double? size;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget? emptyWidget;
  final DecoType decoType;

  const AppCachedNetworkImage({
    super.key,
    required this.url,
    this.size,
    this.width,
    this.height,
    this.emptyWidget,
    this.radius,
    this.fit = BoxFit.contain,
    this.decoType = DecoType.normal,
  });

  @override
  Widget build(BuildContext context) {
    final _width = size ?? width;
    final _height = size ?? height;
    final emptyChild = emptyWidget ?? SizedBox(width: _width, height: _height,);
    final imageWidget = CachedNetworkImage(
      width: _width,
      height: _height,
      fit: BoxFit.contain,
      imageUrl: url,
      errorWidget: (context, url, e) => emptyChild,
    );

    if (url.isEmpty) {
      return emptyChild;
    } else {
      return switch(decoType) {
        DecoType.normal => imageWidget,
        DecoType.circle => ClipOval(child: imageWidget),
        DecoType.borderRadius => ClipRRect(
          borderRadius: BorderRadius.circular(radius ?? 8),
          child: imageWidget
        ),
      };
    }
  }
}
