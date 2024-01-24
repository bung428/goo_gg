import 'package:flutter/material.dart';
import 'package:flutter_base_template/edge_insets.dart';
import 'package:flutter_base_template/river_pod/river_template.dart';
import 'package:go_router/go_router.dart';
import 'package:goo_gg_application/data/summoner/repository/summoner_repository.dart';
import 'package:goo_gg_application/pages/main/main_notifier.dart';
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
            if (provider.matches?.isNotEmpty == true) ... [
              Text('matches : ${provider.matches!.length} : ${provider.matches!.first!.metaData?.toJson()}')
            ],
            TextButton(
                onPressed: () => context.go(Routes.splash.name),
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