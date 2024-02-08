import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_template/edge_insets.dart';
import 'package:flutter_base_template/river_pod/river_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:goo_gg_application/data/summoner/repository/summoner_repository.dart';
import 'package:goo_gg_application/pages/main/view/home_notifier.dart';
import 'package:goo_gg_application/pages/main/widget/match_factory/summarized_match_mobile_widget.dart';
import 'package:goo_gg_application/pages/main/widget/summoner_info_factory/summoner_info_mobile_widget.dart';
import 'package:goo_gg_application/route/routes.dart';
import 'package:goo_gg_application/widget/load_more_listview.dart';
import 'package:goo_gg_application/widget/search_widget.dart';

import '../../../widget/asset_imge_widget.dart';

class HomeView extends RiverProvider<HomeNotifier, HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, provider, notifier) {
    return Padding(
      padding: const EdgeInsetsApp(horizontal: 12, vertical: 24),
      child: LoadMoreListViewWidget(
        list: provider.matches ?? [],
        scrollController: notifier.scrollController,
        sliverListWidget: SliverList(
          delegate: SliverChildListDelegate([
            TextButton(onPressed: notifier.test, child: Text('test')),
            const SizedBox(height: 8,),
            SearchWidget(
              hintText: '소환사 이름을 입력해주세요.',
              labelText: '소환사명',
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.done,
              searchCallback: notifier.searchSummoner,
            ),
            if (provider.summonerModel != null) ...[
              const SizedBox(height: 16,),
              // if (kIsWeb)
              //   SummonerInfoWebWidget(
              //     model: provider.summonerModel!,
              //     entries: provider.entries,
              //     refreshCallback: notifier.refreshSummoner,
              //   )
              // else
                SummonerInfoMobileWidget(
                  model: provider.summonerModel!,
                  image: notifier.getBgImage(),
                  inGameCallback: notifier.requestInGame,
                  refreshMatchesCallback: notifier.refreshSummoner,
                )
            ],
            if (provider.matches?.isNotEmpty == true) ... [
              const SizedBox(height: 16,),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: provider.matches!.length,
                itemBuilder: (context, index) {
                  final summarized = provider.matches![index].summarizedMatch;
                  final gameResult = summarized.gameInfo.gameResult;
                  // final gameDetailInfo = provider.matches![index].gameDetailInfo;
                  // final analysis = provider.matches![index].gameAnalysis;
                  return SummarizedMatchMobileWidget(
                    color: gameResult?.color ?? Colors.transparent,
                    summarized: summarized,
                    onTap: () => context.goNamed(
                      Routes.matchDetail.name,
                      extra: provider.matches![index]
                    ),
                  );
                  // return kIsWeb
                  //   ? SummarizedMatchWebWidget(
                  //     color: gameResult.color.withOpacity(0.25),
                  //     summarized: summarized,
                  //     gameDetailInfo: gameDetailInfo,
                  //     analysis: analysis,
                  // ) : SummarizedMatchMobileWidget(
                  //     color: gameResult.color,
                  //     analysis: analysis,
                  //     gameDetailInfo: gameDetailInfo,
                  //     summarized: summarized,
                  //     onTap: () => context.goNamed(Routes.matchDetail.name),
                  // );
                },
                separatorBuilder: (BuildContext context, int index) =>
                  kIsWeb ? const SizedBox() : const Divider(height: 1,),
              ),
            ]
          ]),
        ),
        moreWidget: const Center(child: CircularProgressIndicator()),
        onLoadMoreCallback: notifier.loadMoreMatches,
      ),
    );
  }

  @override
  createProvider(WidgetRef ref) {
    final repository = SummonerRepository().getRepoProvider(ref);
    return HomeNotifier(HomeViewModel(), repository as SummonerRepository);
  }

}