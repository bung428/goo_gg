import 'package:flutter/material.dart';
import 'package:goo_gg_application/pages/main/view/lol_analytics_view.dart';
import 'package:goo_gg_application/pages/main/view/home_view.dart';

enum MainTab {
  home(Icons.home_filled),
  analytics(Icons.analytics),
  ;

  final IconData icon;
  const MainTab(this.icon);
}

extension MainTabExt on MainTab {
  Widget getView() => switch(this) {
    MainTab.home => const HomeView(),
    MainTab.analytics => const LoLAnalyticsView(),
  };
}