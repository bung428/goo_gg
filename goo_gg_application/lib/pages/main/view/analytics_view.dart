import 'package:flutter/material.dart';
import 'package:flutter_base_template/river_pod/river_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goo_gg_application/pages/main/view/analytics_notifier.dart';

class AnalyticsView extends RiverProvider<AnalyticsNotifier, AnalyticsViewModel> {
  const AnalyticsView({super.key});

  @override
  Widget build(BuildContext context, provider, notifier) {
    return ListView(
      children: const [
        Text('test'),
      ],
    );
  }

  @override
  AnalyticsNotifier createProvider(WidgetRef ref) {
    return AnalyticsNotifier(AnalyticsViewModel());
  }
}