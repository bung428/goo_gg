import 'package:flutter/cupertino.dart';
import 'package:goo_gg_application/data/match/model/game_analysis_model.dart';
import 'package:goo_gg_application/data/match/model/game_detail_info_model.dart';
import 'package:goo_gg_application/data/match/model/match_history_model.dart';

abstract class SummarizedMatchIWidget extends StatelessWidget {
  final Color color;
  final SummarizedMatchModel summarized;
  final GameDetailInfoModel? gameDetailInfo;
  final List<GameAnalysisModel>? analysis;

  const SummarizedMatchIWidget({
    super.key,
    this.analysis,
    this.gameDetailInfo,
    required this.color,
    required this.summarized
  });
}