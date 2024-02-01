import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_template/edge_insets.dart';
import 'package:flutter_base_template/river_pod/river_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goo_gg_application/pages/match_detail/match_detail_notifier.dart';

class MatchDetailPage extends RiverProvider<MatchDetailNotifier, MatchDetailViewModel> {
  const MatchDetailPage({super.key});

  @override
  Widget build(BuildContext context, provider, notifier) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 160,
            backgroundColor: theme.primaryColor,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('승리', style: theme.textTheme.titleMedium?.copyWith(
                color: theme.scaffoldBackgroundColor
              ),),
              background: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsetsApp(bottom: 8, end: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('자유랭크'),
                      Text('adsf'),
                    ],
                  ),
                ),
              )
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: [
              //     const Spacer(),
              //     Column(
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         Text('adsf'),
              //         Text('adsf'),
              //       ],
              //     ),
              //   ],
              // ),
            ),
            // bottom: PreferredSize(
            //   preferredSize: Size(160, 160),
            //   child: Container(
            //     color: Colors.yellow,
            //     child: Text('asdf'),
            //   ),
            // ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 80, child: Text('asdfas')),),
          SliverToBoxAdapter(child: SizedBox(height: 80, child: Text('asdfas')),),
          SliverToBoxAdapter(child: SizedBox(height: 80, child: Text('asdfas')),),
          SliverToBoxAdapter(child: SizedBox(height: 80, child: Text('asdfas')),),
          SliverToBoxAdapter(child: SizedBox(height: 80, child: Text('asdfas')),),
          SliverToBoxAdapter(child: SizedBox(height: 80, child: Text('asdfas')),),
          SliverToBoxAdapter(child: SizedBox(height: 80, child: Text('asdfas')),),
          SliverToBoxAdapter(child: SizedBox(height: 80, child: Text('asdfas')),),
          SliverToBoxAdapter(child: SizedBox(height: 80, child: Text('asdfas')),),
          SliverToBoxAdapter(child: SizedBox(height: 80, child: Text('asdfas')),),
          SliverToBoxAdapter(child: SizedBox(height: 80, child: Text('asdfas')),),
          SliverToBoxAdapter(child: SizedBox(height: 80, child: Text('asdfas')),),
        ],
      ),
    );
  }

  @override
  MatchDetailNotifier createProvider(WidgetRef ref) {
    return MatchDetailNotifier(MatchDetailViewModel());
  }

}