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
  /// todo: 타입에 따른 데이터 모델 매핑 다시 해야할듯 아래 두개의 리스트로는 해결안됌
  List<TypeDataSet> values = [];

  List<double> getCoordinates(List<double> data) {
    final maxData = data.reduce((value, e) => value > e ? value : e);
    final list = data.map((e) => (e / maxData)).toList();
    return list;
  }

  List<double> getListByType() {
    final data = widget.data;
    if (data == null) return [];
    return switch (type) {
      AnalysisType.kda => data.map((e) => double.tryParse(e.kda) ?? 0.0).toList(),
      AnalysisType.damage => data.map((e) => e.totalDamage.toDouble()).toList(),
      AnalysisType.damageTaken => data.map((e) => e.totalDamageTaken.toDouble()).toList(),
      AnalysisType.damageToChampion => data.map((e) => e.damageToChampion.toDouble()).toList(),
      AnalysisType.gold => data.map((e) => e.gold.toDouble()).toList(),
      AnalysisType.turret => data.map((e) => e.turret.toDouble()).toList(),
      AnalysisType.object => data.map((e) => e.turret.toDouble()).toList(),
      AnalysisType.visionScore => data.map((e) => e.visionScore.toDouble()).toList(),
      AnalysisType.pings => data.map((e) {
        final pingCounts = e.pings.map((e) => e.count.toDouble());
        return pingCounts.reduce((v, e) => v + e);
      }).toList(),
    };
  }

  void setData() {
    final data = widget.data;
    if (data == null) return;
    if (values.isNotEmpty) {
      values.clear();
    }

    final result = getCoordinates(getListByType());
    for (int index=0; index < data.length; index++) {
      final value = data[index];
      final type = switch (this.type) {
        AnalysisType.kda => double.tryParse(value.kda) ?? 0.0,
        AnalysisType.damage => value.totalDamage.toDouble(),
        AnalysisType.damageTaken => value.totalDamageTaken.toDouble(),
        AnalysisType.damageToChampion => value.damageToChampion.toDouble(),
        AnalysisType.gold => value.gold.toDouble(),
        AnalysisType.turret => value.turret.toDouble(),
        AnalysisType.visionScore => value.visionScore.toDouble(),
      /// todo: 오브젝트, 핑일땐 뷰 바꿔야할듯.
        AnalysisType.object => value.turret.toDouble(),
        AnalysisType.pings => value.pings.map((e) => e.count).reduce((v, e) => v + e).toDouble(),
      };
      values.add(TypeDataSet(
        url: value.url,
        isBlue: value.isBlue,
        value: type,
        coorDinateValue: result[index]
      ));
    }
    values.sort((a, b) => b.value.compareTo(a.value));

    setState(() {});
  }

  void _changeAnalysisType(AnalysisType type) {
    this.type = type;
    setData();
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
    final theme = Theme.of(context);
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
                      padding: const EdgeInsetsApp(start: 12, vertical: 2),
                      itemCount: AnalysisType.values.length,
                      itemBuilder: (context, index) => OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AnalysisType.values[index] == type
                            ? theme.primaryColor : theme.disabledColor,
                          side: BorderSide(color: AnalysisType.values[index] == type
                              ? theme.primaryColor : theme.disabledColor,)
                        ),
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
                      final model = values[index];
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
                                  Text('${model.value}'),
                                  LinearProgressIndicator(
                                    value: model.coorDinateValue,
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

class TypeDataSet {
  final String url;
  final bool isBlue;
  final double value;
  final double coorDinateValue;

  TypeDataSet({
    required this.url,
    required this.isBlue,
    required this.value,
    required this.coorDinateValue
  });
}