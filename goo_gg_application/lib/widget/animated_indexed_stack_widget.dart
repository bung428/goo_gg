import 'package:flutter/material.dart';

class AnimatedIndexedStackWidget extends StatefulWidget {
  final int index;
  final List<Widget> children;
  final Duration duration;

  const AnimatedIndexedStackWidget({
    super.key,
    required this.index,
    required this.children,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  State<AnimatedIndexedStackWidget> createState() => _AnimatedIndexedStackWidgetState();
}

class _AnimatedIndexedStackWidgetState extends State<AnimatedIndexedStackWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _position = 1.0;

  @override
  void didUpdateWidget(oldWidget) {
    if (widget.index != oldWidget.index) {
      bool isRightScreen = widget.index > oldWidget.index;
      setState(() {
        _position = isRightScreen ? 1 : -1;
      });
      _controller.forward(from: 0.0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: SlideTransition(
        position: Tween(
          begin: Offset(_position, 0.0),
          end: Offset.zero,
        ).animate(_controller),
        child: IndexedStack(
          index: widget.index,
          children: widget.children,
        ),
      ),
    );
  }
}
