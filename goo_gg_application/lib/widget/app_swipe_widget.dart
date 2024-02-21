import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

class AppSwipeWidget<T extends Enum> extends StatefulWidget {
  final List<T> data;
  final int selectedData;
  final void Function(int index) swipeCallback;
  final List<Widget> children;

  const AppSwipeWidget({
    super.key,
    required this.children,
    required this.data,
    required this.selectedData,
    required this.swipeCallback
  });

  @override
  State<AppSwipeWidget> createState() => _AppSwipeWidgetState<T>();
}

class _AppSwipeWidgetState<T extends Enum> extends State<AppSwipeWidget<T>> {
  int currentPageIndex = 0;

  @override
  void didUpdateWidget(covariant AppSwipeWidget<T> oldWidget) {
    const equality = DeepCollectionEquality();
    if (!equality.equals(widget.selectedData, oldWidget.selectedData)) {
      currentPageIndex = widget.selectedData;
      setState(() {});
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          navigateToPreviousPage();
        } else if (details.primaryVelocity! < 0) {
          navigateToNextPage();
        }
        widget.swipeCallback(currentPageIndex);
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeIn,
        child: widget.children[currentPageIndex],
      ),
    );
  }

  void navigateToPreviousPage() {
    setState(() {
      if (currentPageIndex > 0) {
        currentPageIndex--;
      }
    });
  }

  void navigateToNextPage() {
    setState(() {
      if (currentPageIndex < widget.data.length - 1) {
        currentPageIndex++;
      }
    });
  }
}