import 'package:flutter/material.dart';
import 'package:goo_gg_application/pages/main/widget/match_factory/summarized_match_iwidget.dart';
import 'package:goo_gg_application/pages/main/widget/match_history_title_widget.dart';
import 'package:goo_gg_application/pages/main/widget/player_analysis_widget.dart';
import 'package:goo_gg_application/pages/main/widget/player_match_detail_widget.dart';

class SummarizedMatchWebWidget extends SummarizedMatchIWidget {
  const SummarizedMatchWebWidget({
    super.key,
    required super.color,
    required super.analysis,
    required super.gameDetailInfo,
    required super.summarized
  });

  @override
  Widget build(BuildContext context) {
    if (gameDetailInfo == null || analysis == null) return const SizedBox();
    return Card(
      elevation: 2,
      color: color,
      child: ExpansionTile(
        title: MatchHistoryTitleWidget(model: summarized),
        children: [
          SizedBox(
            height: 368,
            child: PageView(
              children: [
                PlayerMatchDetailWidget(model: gameDetailInfo!),
                PlayerAnalysisWidget(list: analysis!),
              ],
            ),
          )
        ],
      ),
    );
  }
}
