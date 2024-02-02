import 'package:flutter/material.dart';
import 'package:flutter_base_template/river_pod/river_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goo_gg_application/pages/main/view/lol_analytics_notifier.dart';

class LoLAnalyticsView extends RiverProvider<LoLAnalyticsNotifier, LoLAnalyticsViewModel> {
  const LoLAnalyticsView({super.key});

  @override
  Widget build(BuildContext context, provider, notifier) {
    return ListView(
      children: const [
        Text('test'),
      ],
    );
  }

  @override
  LoLAnalyticsNotifier createProvider(WidgetRef ref) {
    return LoLAnalyticsNotifier(LoLAnalyticsViewModel());
  }
}