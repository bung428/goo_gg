import 'package:flutter/material.dart';
import 'package:flutter_base_template/edge_insets.dart';
import 'package:goo_gg_application/data/match/model/game_detail_info_model.dart';
import 'package:goo_gg_application/pages/main/widget/player_match_detail_widget.dart';

class TotalView extends StatelessWidget {
  final GameDetailInfoModel model;

  const TotalView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        model.isWinBlue
            ? _buildBluePlayersResult(true)
            : _buildRedPlayersResult(false),
        const SizedBox(height: 4,),
        _buildObjectResult(),
        const SizedBox(height: 4,),
        model.isWinBlue
            ? _buildRedPlayersResult(false, true)
            : _buildBluePlayersResult(true, true),
      ],
    );
  }

  Widget _buildBluePlayersResult(bool win, [bool isBottom = false]) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: isBottom ? const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ) : null,
        color: win ? Colors.blueAccent.withOpacity(0.4) : Colors.redAccent.withOpacity(0.4),
      ),
      padding: const EdgeInsetsApp(horizontal: 18, vertical: 12),
      child: Column(
        children: model.blueTeamInfo?.map((e) {
          final isLast = e == model.blueTeamInfo?.last;
          return MatchPlayerDetailItemWidget(
            model: e,
            isLast: isLast,
          );
        }).toList() ?? [],
      ),
    );
  }

  Widget _buildRedPlayersResult(bool win, [bool isBottom = false]) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: isBottom ? const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ) : null,
        color: win ? Colors.blueAccent.withOpacity(0.4) : Colors.redAccent.withOpacity(0.4),

      ),
      padding: const EdgeInsetsApp(horizontal: 18, vertical: 12),
      child: Column(
        children: model.redTeamInfo?.map((e) {
          final isLast = e == model.redTeamInfo?.last;
          return MatchPlayerDetailItemWidget(
            model: e,
            isLast: isLast,
          );
        }).toList() ?? [],
      ),
    );
  }

  Widget _buildObjectResult() {
    final data = model.teamObjectInfo;
    return Padding(
      padding: const EdgeInsetsApp(horizontal: 16),
      child: Row(
        children: [
          ObjectResultWidget(
              baron: data?.first.baron ?? 0,
              dragon: data?.first.dragon ?? 0,
              horde: data?.first.horde ?? 0,
              inhibitor: data?.first.inhibitor ?? 0,
              riftHerald: data?.first.riftHerald ?? 0,
              tower: data?.first.tower ?? 0
          ),
          const SizedBox(width: 4,),
          Expanded(
              child: Column(
                children: [
                  TupleValueGraphWidget(
                    firstValue: data?.first.teamKills  ?? 0,
                    lastValue: data?.last.teamKills ?? 0,
                    isBlue: data?.first.isBlue ?? true,
                    title: 'Total Kill',
                  ),
                  const SizedBox(height: 4,),
                  TupleValueGraphWidget(
                    firstValue: data?.first.teamGolds  ?? 0,
                    lastValue: data?.last.teamGolds ?? 0,
                    isBlue: data?.first.isBlue ?? false,
                    title: 'Total Gold',
                  ),
                ],
              )
          ),
          const SizedBox(width: 4,),
          ObjectResultWidget(
              baron: data?.last.baron ?? 0,
              dragon: data?.last.dragon ?? 0,
              horde: data?.last.horde ?? 0,
              inhibitor: data?.last.inhibitor ?? 0,
              riftHerald: data?.last.riftHerald ?? 0,
              tower: data?.last.tower ?? 0
          ),
        ],
      ),
    );
  }
}
