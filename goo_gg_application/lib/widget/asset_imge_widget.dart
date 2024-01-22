import 'package:flutter/material.dart';

class AssetImageWidget extends StatelessWidget {
  final String image;
  final double? size;
  final double? width;
  final double? height;
  final Color? bgColor;
  final BoxFit fit;
  final BoxShape shape;
  final BoxBorder? border;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;

  const AssetImageWidget({
    super.key,
    required this.image,
    this.size,
    this.width,
    this.height,
    this.borderRadius,
    this.border,
    this.bgColor,
    this.padding,
    this.fit = BoxFit.contain,
    this.shape = BoxShape.rectangle,
  });

  @override
  Widget build(BuildContext context) {
    final _width = size ?? width;
    final _height = size ?? height;
    return ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(0),
        child: Container(
          decoration: BoxDecoration(
              shape: shape,
              border: border,
              color: bgColor
          ),
          padding: padding,
          child: Image.asset(
            'assets/images/$image.png',
            width: _width,
            height: _height,
            fit: fit,
          ),
        )
    );
  }
}
