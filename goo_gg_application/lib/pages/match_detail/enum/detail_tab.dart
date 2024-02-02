import 'package:flutter/material.dart';
import 'package:goo_gg_application/data/match/model/game_detail_info_model.dart';
import 'package:goo_gg_application/pages/match_detail/view/team_analytics_view.dart';
import 'package:goo_gg_application/pages/match_detail/view/total_view.dart';

enum DetailTab {
  total('종합'),
  teamAnalytics('팀 분석'),
  ;

  final String text;
  const DetailTab(this.text);
}

extension DetailTabExt on DetailTab {
  Widget getView(GameDetailInfoModel gameDetailInfo) => switch(this) {
    DetailTab.total => TotalView(model: gameDetailInfo),
    DetailTab.teamAnalytics => const TeamAnalyticsView(),
  };
}