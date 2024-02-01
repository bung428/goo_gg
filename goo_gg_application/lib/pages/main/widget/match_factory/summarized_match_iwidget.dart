import 'package:flutter/cupertino.dart';
import 'package:goo_gg_application/data/match/model/game_analysis_model.dart';
import 'package:goo_gg_application/data/match/model/game_detail_info_model.dart';
import 'package:goo_gg_application/data/match/model/match_history_model.dart';

abstract class SummarizedMatchIWidget extends StatelessWidget {
  final Color color;
  final List<GameAnalysisModel> analysis;
  final GameDetailInfoModel gameDetailInfo;
  final SummarizedMatchModel summarized;

  const SummarizedMatchIWidget({
    super.key,
    required this.color,
    required this.analysis,
    required this.gameDetailInfo,
    required this.summarized
  });
}