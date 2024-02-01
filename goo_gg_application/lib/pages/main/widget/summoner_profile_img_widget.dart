import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_template/edge_insets.dart';
import 'package:goo_gg_application/main.dart';

enum LevelPosition {
  start,
  center,
  end
}

extension LevelPositionExt on LevelPosition{
  Widget buildPositionWidget(Widget child) {
    return switch (this) {
      LevelPosition.start => Positioned(
        left: 0,
        bottom: 0,
        child: child
      ),
      LevelPosition.end => Positioned(
        right: 0,
        bottom: 0,
        child: child
      ),
      LevelPosition.center => Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: child
      ),
    };
  }
}

class SummonerProfileImgWidget extends StatelessWidget {
  final double? imgSize;
  final double? imgWidth;
  final double? imgHeight;
  final double? lvSize;
  final double? lvWidth;
  final double? lvHeight;
  final double borderRadius;
  final String url;
  final String level;
  final LevelPosition position;

  const SummonerProfileImgWidget({
    super.key,
    required this.borderRadius,
    required this.url,
    required this.level,
    this.position = LevelPosition.end,
    this.imgHeight,
    this.imgWidth,
    this.imgSize,
    this.lvHeight,
    this.lvWidth,
    this.lvSize,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var iWidth = imgSize ?? imgWidth;
    var iHeight = imgSize ?? imgHeight;
    final lWidth = lvSize ?? lvWidth;
    final lHeight = lvSize ?? lvHeight;
    return SizedBox(
      width: iWidth! + 4,
      height: iHeight! + 4,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: CachedNetworkImage(
              width: iWidth,
              height: iHeight,
              imageUrl: url,
              fit: BoxFit.contain,
              placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                const Icon(Icons.error),
            ),
          ),
          position.buildPositionWidget(Container(
            width: lWidth,
            height: lHeight,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.textColor,
            ),
            padding: const EdgeInsetsApp(all: 2),
            child: Center(
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  level,
                  style: theme.textTheme.bodySmall
                      ?.copyWith(color: theme.scaffoldBackgroundColor),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
