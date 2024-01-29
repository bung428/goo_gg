import 'package:flutter/material.dart';

typedef LoadMoreCallback<T> = Future<void> Function();

class LoadMoreListViewWidget<T> extends StatefulWidget {
  final List<T> list;
  final Widget? moreWidget;
  final Widget? emptyWidget;
  final Widget? nullWidget;
  final Widget sliverListWidget;
  final LoadMoreCallback<T> onLoadMoreCallback;
  final ScrollController scrollController;

  const LoadMoreListViewWidget({
    Key? key,
    this.nullWidget,
    this.moreWidget,
    this.emptyWidget,
    required this.list,
    required this.sliverListWidget,
    required this.onLoadMoreCallback,
    required this.scrollController
  }) : super(key: key);

  @override
  State<LoadMoreListViewWidget> createState() => _LoadMoreListViewWidgetState();
}

class _LoadMoreListViewWidgetState extends State<LoadMoreListViewWidget> {
  bool loadMore = false;
  bool enableLoadMore = true;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_loadMore);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_loadMore);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant LoadMoreListViewWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.list != oldWidget.list) {
      _setState();
    }
  }

  void _setState() {
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _loadMore() async {
    if (loadMore) {
      return;
    }
    if (!enableLoadMore) {
      return;
    }

    final position = widget.scrollController.position;
    if (!loadMore && position.pixels == position.maxScrollExtent) {
      setState(() {
        loadMore = true;
      });

      try {
        if (enableLoadMore) {
          setState(() {
            enableLoadMore = false;
          });

          await widget.onLoadMoreCallback();
          Future.delayed(Duration(seconds: 1));
          setState(() {
            loadMore = false;
            enableLoadMore = true;
          });
        }

      } catch (_) {
        setState(() {
          loadMore = false;
          enableLoadMore = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          controller: widget.scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            widget.sliverListWidget,
          ],
        ),
        if (loadMore && widget.moreWidget != null)
          Center(
            child: widget.moreWidget,
          ),
      ],
    );
  }
}