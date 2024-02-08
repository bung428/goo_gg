import 'package:flutter/material.dart';
import 'package:flutter_base_template/river_pod/river_provider.dart';
import 'package:flutter_base_template/river_pod/river_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goo_gg_application/data/league/repository/tier_repository.dart';
import 'package:goo_gg_application/pages/main/view/champions_notifier.dart';
import 'package:goo_gg_application/widget/asset_imge_widget.dart';
import 'package:goo_gg_application/widget/touch_well.dart';

class ChampionsView extends RiverProvider<ChampionsNotifier, ChampionsViewModel> {
  const ChampionsView({super.key});

  @override
  Widget build(BuildContext context, provider, notifier) {
    return ListView(
      children: [
        SizedBox(
          height: 60,
          child: TouchWell(
            onTap: notifier.selectTier,
            child: Row(
              children: [
                AssetImageWidget(
                  image: provider.tier.assetUrl,
                  fit: BoxFit.contain,
                ),
                Text(provider.tier.name.toUpperCase())
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  ChampionsNotifier createProvider(WidgetRef ref) {
    final tier = TierRepository().getRepoProvider(ref);
    return ChampionsNotifier(ChampionsViewModel.init(), tier as TierRepository);
  }
}