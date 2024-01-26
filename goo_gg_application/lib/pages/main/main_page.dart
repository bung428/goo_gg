import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_template/edge_insets.dart';
import 'package:flutter_base_template/river_pod/river_template.dart';
import 'package:go_router/go_router.dart';
import 'package:goo_gg_application/data/summoner/repository/summoner_repository.dart';
import 'package:goo_gg_application/pages/main/main_notifier.dart';
import 'package:goo_gg_application/pages/main/widget/summarized_match_history_widget.dart';
import 'package:goo_gg_application/pages/main/widget/summoner_info_widget.dart';
import 'package:goo_gg_application/route/routes.dart';
import 'package:goo_gg_application/widget/search_widget.dart';

class MainPage extends RiverProvider<MainNotifier, MainViewModel> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, provider, MainNotifier notifier) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Goo.gg', style: theme.textTheme.titleLarge?.copyWith(
          color: theme.primaryColor,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: false,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsetsApp(horizontal: 16, vertical: 24),
          children: [
            SearchWidget(
              hintText: '소환사 이름을 입력해주세요.',
              labelText: '소환사명',
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.done,
              searchCallback: notifier.searchSummoners,
            ),
            if (provider.summonerModel != null) ...[
              const SizedBox(height: 16,),
              SummonerInfoWidget(
                model: provider.summonerModel!,
                entries: provider.entries,
              ),
            ],
            // CachedNetworkImage(
            //   width: 88,
            //   height: 88,
            //   imageUrl: 'http://ddragon.leagueoflegends.com/cdn/14.2.1/img/perk/843.png',
            //   fit: BoxFit.contain,
            // ),
            if (provider.shortMatches?.isNotEmpty == true) ... [
              const SizedBox(height: 16,),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: provider.shortMatches!.length,
                itemBuilder: (context, index) {
                  final model = provider.shortMatches![index];
                  final gameResult = model.gameInfo.gameResult;
                  return Card(
                    elevation: 2,
                    color: gameResult.color.withOpacity(0.25),
                    child: ExpansionTile(
                      title: SummarizedMatchHistoryWidget(model: model),
                      children: [
                        Text('asdfasdf'),
                        Text('asdfasdf'),
                        Text('asdfasdf'),
                        Text('asdfasdf'),
                        Text('asdfasdf'),
                      ],
                    ),
                  );
                }
              ),
              // Card(
              //   elevation: 4,
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(16),
              //     child: ExpansionPanelList(
              //       expansionCallback: notifier.changeMatchExpansion,
              //       children: provider.shortMatches!.map((e) => ExpansionPanel(
              //         headerBuilder: (BuildContext context, bool isExpanded) {
              //           return Container(
              //             color: Colors.red,
              //             child: SummarizedMatchHistoryWidget(model: e,));
              //         },
              //         body: ListTile(
              //           title: Text(e.gameInfo.gameType.name),
              //         ),
              //         isExpanded: e.expanded,
              //       )).toList()
              //     ),
              //   ),
              // ),
            ],
            TextButton(
                // onPressed: () => context.go(Routes.splash.name),
                onPressed: notifier.test,
                child: const Text('move splash')
            ),
            TextButton(
                onPressed: () => context.go(Routes.login.name),
                child: const Text('move login')
            ),
          ],
        ),
      ),
    );
  }

  @override
  MainNotifier createProvider(ref) {
    final repository = SummonerRepository().getRepoProvider(ref);
    return MainNotifier(MainViewModel(), repository as SummonerRepository);
  }
}