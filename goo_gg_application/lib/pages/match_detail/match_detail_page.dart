import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_template/edge_insets.dart';
import 'package:flutter_base_template/river_pod/river_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goo_gg_application/data/match/model/match_history_model.dart';
import 'package:goo_gg_application/main.dart';
import 'package:goo_gg_application/model/detail_tab_model.dart';
import 'package:goo_gg_application/pages/match_detail/enum/detail_tab.dart';
import 'package:goo_gg_application/pages/match_detail/match_detail_notifier.dart';
import 'package:goo_gg_application/pages/match_detail/view/team_analytics_view.dart';
import 'package:goo_gg_application/pages/match_detail/view/total_view.dart';
import 'package:goo_gg_application/widget/touch_well.dart';

class MatchDetailPage
    extends RiverProvider<MatchDetailNotifier, MatchDetailViewModel> {
  final MatchHistoryModel model;

  const MatchDetailPage({super.key, required this.model});

  @override
  Widget build(BuildContext context, provider, notifier) {
    final theme = Theme.of(context);
    final summarized = model.summarizedMatch;
    final gameDetail = model.gameDetailInfo;
    final gameAnalysis = model.gameAnalysis;
    final mainColor = summarized.gameInfo.gameResult?.color;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, value) => [
          _buildAppBar(theme, summarized, mainColor),
          if (provider.tabs?.isNotEmpty == true)
            SliverPersistentHeader(
              pinned: true,
              // floating: true,
              delegate: _SliverAppBarDelegate(
                minHeight: 66,
                maxHeight: 66,
                child: _buildTabBar(theme, notifier, provider.tabs!, mainColor),
              ),
            ),
        ],
        body: PageView.builder(
          controller: notifier.pageController,
          itemCount: DetailTab.values.length,
          itemBuilder: (context, index) {
            final item = DetailTab.values[index].getView(gameDetail);
            return item;
          },
        )
      )
    );
  }

  SliverAppBar _buildAppBar(
    ThemeData theme,
    SummarizedMatchModel model,
    Color? mainColor
  ) => SliverAppBar(
    pinned: true,
    expandedHeight: 160,
    backgroundColor: mainColor,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        title: Text(
          model.gameInfo.gameResult?.value ?? '',
          style: theme.textTheme.titleMedium
              ?.copyWith(color: theme.scaffoldBackgroundColor),
        ),
        background: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsetsApp(bottom: 12, end: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${model.gameInfo.gameType.type} | ${model.gameInfo.finishedAtStr} | ${model.gameInfo.gameDuration}',
                  style: theme.textTheme.bodySmall
                      ?.copyWith(color: theme.scaffoldBackgroundColor),
                ),
                /// todo: 수치들로 재미난 컨텐츠로 이미지와 함께 보여주기 (많이 안죽었으면 생존의 왕 뭐 이런..)
                // Text('adsf'),
              ],
            ),
          ),
        )),
  );

  Row _buildTabBar(
    ThemeData theme,
    notifier,
    List<DetailTabModel> list,
    Color? color
  ) {
    return Row(
      children: list.map((e) => Expanded(
        flex: 1,
        child: Padding(
          padding: const EdgeInsetsApp(horizontal: 24),
          child: TouchWell(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
            ),
            onTap: () => notifier.changeTab(e.tab),
            child: Container(
              height: 48,
              color: e.selected ? color?.withOpacity(0.2) : Colors.transparent,
              child: Center(
                child: Text(
                  e.tab.text,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: e.selected ? color : theme.disabledColor
                  ),
                ),
              ),
            ),
          ),
        )
      )).toList(),
    );
  }

  @override
  MatchDetailNotifier createProvider(WidgetRef ref) {
    return MatchDetailNotifier(MatchDetailViewModel());
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: Container(color: Colors.white, child: child));
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
