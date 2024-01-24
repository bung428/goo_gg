import 'package:flutter/material.dart';

int _touchWellProtectedMultiTapTimeMs = 0;

class TouchWell extends StatelessWidget {
  final GestureTapCallback? onTap;
  final GestureTapCallback? onDoubleTap;
  final GestureLongPressCallback? onLongPress;
  final GestureTapDownCallback? onTapDown;
  final GestureTapCancelCallback? onTapCancel;
  final ValueChanged<bool>? onHighlightChanged;
  final ValueChanged<bool>? onHover;

  final bool protectMultiTap;
  final double? elevation;
  final Color? bgColor;
  final bool inkWellIsTop;
  final ShapeBorder? shape;

  final Widget child;

  const TouchWell({
    Key? key,
    required this.child,
    this.protectMultiTap = true,
    this.inkWellIsTop = true,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onTapDown,
    this.onTapCancel,
    this.onHighlightChanged,
    this.onHover,
    this.elevation,
    this.bgColor,
    this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: bgColor,
      shape: shape,
      clipBehavior: shape != null ? Clip.hardEdge : Clip.none,
      elevation: elevation ?? 0,
      child: inkWellIsTop
          ? Stack(
        children: [
          child,
          Positioned.fill(
            child: _buildInkWell(theme, null),
          )
        ],
      )
          : _buildInkWell(theme, child),
    );
  }

  Widget _buildInkWell(ThemeData theme, Widget? child) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: protectMultiTap ? onTap != null ? () {
          final now = DateTime.now().millisecondsSinceEpoch;
          if(now - _touchWellProtectedMultiTapTimeMs > 300) {
            _touchWellProtectedMultiTapTimeMs = now;
            final tap = onTap;
            if(tap != null) {
              tap();
            }
          }
        } : null : onTap,
        onDoubleTap: onDoubleTap,
        onLongPress: onLongPress,
        onTapDown: onTapDown,
        onTapCancel: onTapCancel,
        onHighlightChanged: onHighlightChanged,
        onHover: onHover,
        child: child,
      ),
    );
  }
}