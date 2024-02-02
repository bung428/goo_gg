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
        children: model.blueTeamInfo.map((e) {
          final isLast = e == model.blueTeamInfo.last;
          return MatchPlayerDetailItemWidget(
            model: e,
            isLast: isLast,
          );
        }).toList(),
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
        children: model.redTeamInfo.map((e) {
          final isLast = e == model.redTeamInfo.last;
          return MatchPlayerDetailItemWidget(
            model: e,
            isLast: isLast,
          );
        }).toList(),
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
              baron: data.first.baron,
              dragon: data.first.dragon,
              horde: data.first.horde,
              inhibitor: data.first.inhibitor,
              riftHerald: data.first.riftHerald,
              tower: data.first.tower
          ),
          const SizedBox(width: 4,),
          Expanded(
              child: Column(
                children: [
                  TupleValueGraphWidget(
                    firstValue: data.first.teamKills,
                    lastValue: data.last.teamKills,
                    isBlue: data.first.isBlue,
                    title: 'Total Kill',
                  ),
                  const SizedBox(height: 4,),
                  TupleValueGraphWidget(
                    firstValue: data.first.teamGolds,
                    lastValue: data.last.teamGolds,
                    isBlue: data.first.isBlue,
                    title: 'Total Gold',
                  ),
                ],
              )
          ),
          const SizedBox(width: 4,),
          ObjectResultWidget(
              baron: data.last.baron,
              dragon: data.last.dragon,
              horde: data.last.horde,
              inhibitor: data.last.inhibitor,
              riftHerald: data.last.riftHerald,
              tower: data.last.tower
          ),
        ],
      ),
    );
  }
}
