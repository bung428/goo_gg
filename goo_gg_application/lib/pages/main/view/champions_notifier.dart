import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_base_template/river_pod/river_notifier.dart';
import 'package:flutter_base_template/stream_subscription.dart';
import 'package:flutter_base_template/widget/dialog/app_bottom_sheet.dart';
import 'package:goo_gg_application/data/league/enum/tier_type.dart';
import 'package:goo_gg_application/data/league/repository/tier_repository.dart';
import 'package:goo_gg_application/widget/asset_imge_widget.dart';
import 'package:goo_gg_application/widget/dialog/app_dialog.dart';
import 'package:goo_gg_application/widget/touch_well.dart';

class ChampionsViewModel {
  final TierType tier;

  ChampionsViewModel({required this.tier});

  ChampionsViewModel copyWith({
    TierType? tier,
  }) => ChampionsViewModel(
    tier: tier ?? this.tier
  );

  factory ChampionsViewModel.init() => ChampionsViewModel(tier: TierType.emerald);
}

class ChampionsNotifier extends RiverNotifier<ChampionsViewModel>
    with AppStreamSubscription{
  ChampionsNotifier(super.state, this.tierRepository);

  final TierRepository tierRepository;

  @override
  void onInit() {
    // streamSubscription(
    //   stream: Stream.fromFuture(tierRepository.functionsTest()),
    //   onData: (_) {
    //     print('KBG onData : $_');
    //   }
    // );
  }

  void selectTier() async {
    final context = buildContext;
    if (context == null) return;

    final result = await showAppBottomSheet(
      context: context,
      content: (context) => ListView(
        children: TierType.values.map((e) => TouchWell(
          onTap: () => Navigator.pop(context, e),
          child: SizedBox(
            height: 44,
            child: Row(
              children: [
                AssetImageWidget(
                  image: e.assetUrl,
                  fit: BoxFit.contain,
                ),
                Text(e.name.toUpperCase())
              ],
            ),
          ),
        )).toList(),
      )
    );
    if (result is TierType) {
      streamSubscription(
        stream: Stream.fromFuture(tierRepository.functionsTest()),
        onShowLoading: () => showLoadingDialog(context),
        onHideLoading: () => hideLoadingDialog(context),
        onData: (_) {
          print('KBG data : $_ : ${_.runtimeType}');
        }
      );
    }
  }
}