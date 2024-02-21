import 'package:flutter/material.dart';
import 'package:goo_gg_application/data/match/model/game_analysis_model.dart';
import 'package:goo_gg_application/widget/value_graph_widget.dart';

class PlayerAnalysisWidget extends StatelessWidget {
  final List<GameAnalysisModel> list;

  const PlayerAnalysisWidget({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // CustomPaint(
            //   size: Size(constraints.maxWidth - 32, constraints.maxHeight - 16),
            //   foregroundPainter: BarChartPainter(
            //     barColor: Colors.redAccent.withOpacity(0.4),
            //     data: list.map((e) => e.totalDamage.toDouble()).toList(),
            //     labels: list.map((e) => e.champIconData).toList(),
            //   ),
            // ),
          ],
        );
      }
    );
  }
}
