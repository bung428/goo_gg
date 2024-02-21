import 'package:flutter/material.dart';
import 'package:flutter_base_template/edge_insets.dart';
import 'package:goo_gg_application/data/match/model/game_analysis_model.dart';
import 'package:goo_gg_application/pages/match_detail/enum/analysis_type.dart';
import 'package:goo_gg_application/widget/app_cached_network_image.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

class TeamAnalyticsView extends StatefulWidget {
  final List<GameAnalysisModel>? data;

  const TeamAnalyticsView({super.key, this.data});

  @override
  State<TeamAnalyticsView> createState() => _TeamAnalyticsViewState();
}

class _TeamAnalyticsViewState extends State<TeamAnalyticsView> {
  AnalysisType type = AnalysisType.kda;
  List<double> values = [];

  List<double> getUserDamage(List<int> data) {
    final maxData = data.reduce((value, e) => value > e ? value : e);
    final list = data.map((e) => (e / maxData)).toList();
    return list;
  }

  void setData() {
    if (widget.data == null) return;
    final result = getUserDamage(widget.data!.map((e) => e.totalDamage).toList());
    values = result;
    setState(() {});
  }

  void _changeAnalysisType(AnalysisType type) {

  }

  @override
  void initState() {
    setData();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TeamAnalyticsView oldWidget) {
    const equality = DeepCollectionEquality();
    if (!equality.equals(widget.data, oldWidget.data)) {
      setData();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final list = widget.data ?? [];
    if (list.isEmpty || values.isEmpty) {
      return const SizedBox();
    } else {
      return LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                SizedBox(
                    height: 44,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsetsApp(start: 12),
                      itemCount: AnalysisType.values.length,
                      itemBuilder: (context, index) => OutlinedButton(
                          onPressed: () => _changeAnalysisType(AnalysisType.values[index]),
                          child: Text(AnalysisType.values[index].title)
                      ),
                      separatorBuilder: (context, index) => const SizedBox(width: 8,),
                    )
                ),
                const SizedBox(height: 12,),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsetsApp(horizontal: 12),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final model = list[index];
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: Row(
                          children: [
                            AppCachedNetworkImage(
                              url: model.url,
                              decoType: DecoType.borderRadius,
                            ),
                            const SizedBox(width: 12,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(model.kda),
                                  LinearProgressIndicator(
                                    value: values[index],
                                    valueColor:  AlwaysStoppedAnimation<Color>(
                                        model.isBlue ? Colors.blue : Colors.red
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(height: 12,)
                ),
              ],
            );
          }
      );
    }
  }
}