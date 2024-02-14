import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_template/edge_insets.dart';
import 'package:goo_gg_application/core/env/app_config.dart';
import 'package:goo_gg_application/data/match/enum/game_result.dart';
import 'package:goo_gg_application/data/match/model/game_detail_info_model.dart';
import 'package:goo_gg_application/data/match/model/match_history_model.dart';
import 'package:goo_gg_application/main.dart';
import 'package:goo_gg_application/pages/main/widget/player_match_detail_widget.dart';
import 'package:goo_gg_application/widget/app_cached_network_image.dart';

class TotalView extends StatelessWidget {
  final SummarizedMatchModel summarized;
  final GameDetailInfoModel gameDetail;

  const TotalView({super.key, required this.summarized, required this.gameDetail});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isBlue = gameDetail.blueTeamInfo
        ?.where((e) => e.nickName?.contains(summarized.summonerName) ?? false)
        .isNotEmpty ?? false;
    final blueTeamColor = gameDetail.isWinBlue ? Colors.blue : Colors.red;
    final redTeamColor = gameDetail.isWinBlue ? Colors.red : Colors.blue;
    final test = [...gameDetail.blueTeamInfo ?? [], ...gameDetail.redTeamInfo ?? []];
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: isBlue
          ? isBlueWinListWidget(isBlue, theme, blueTeamColor, redTeamColor)
          : isRedWinListWidget(isBlue, theme, blueTeamColor, redTeamColor),
    );
  }

  List<Widget> isBlueWinListWidget(
    bool win,
    ThemeData theme,
    Color blueTeamColor,
    Color redTeamColor,
  ) => [
    if (gameDetail.blueTeamInfo?.isNotEmpty == true) ... [
      Divider(
        height: 1,
        thickness: 2,
        color: blueTeamColor,
      ),
      _buildTotalRecordWidget(theme, win),
      _buildUserRecordListWidget(gameDetail.blueTeamInfo!),
    ],
    const SizedBox(height: 12,),
    if (gameDetail.redTeamInfo?.isNotEmpty == true) ...[
      Divider(
        height: 1,
        thickness: 2,
        color: redTeamColor,
      ),
      _buildTotalRecordWidget(theme, !win),
      _buildUserRecordListWidget(gameDetail.redTeamInfo!),
    ],
    const SizedBox(height: 100,),
  ];

  List<Widget> isRedWinListWidget(
    bool win,
    ThemeData theme,
    Color blueTeamColor,
    Color redTeamColor
  ) => [
    if (gameDetail.redTeamInfo?.isNotEmpty == true) ...[
      Divider(
        height: 1,
        thickness: 2,
        color: redTeamColor,
      ),
      _buildTotalRecordWidget(theme, !win),
      _buildUserRecordListWidget(gameDetail.redTeamInfo!),
    ],
    const SizedBox(height: 12,),
    if (gameDetail.blueTeamInfo?.isNotEmpty == true) ... [
      Divider(
        height: 1,
        thickness: 2,
        color: blueTeamColor,
      ),
      _buildTotalRecordWidget(theme, win),
      _buildUserRecordListWidget(gameDetail.blueTeamInfo!),
    ],
    const SizedBox(height: 100,),
  ];

  Widget _buildUserRecordListWidget(List<PlayerInfoModel> list) {
    return Container(
      padding: const EdgeInsetsApp(horizontal: 12, vertical: 4),
      child: Column(
        children: list.map((e) {
          final child = UserRecordItemWidget(model: e);
          final isLast = e == gameDetail.blueTeamInfo!.last;
          return Column(
            children: [
              child,
              Divider(height: 1, thickness: isLast ? 8 : 1,),
            ],
          );
        }).toList()
      ),
    );
  }

  Widget _buildTotalRecordWidget(ThemeData theme, bool win) {
    return Padding(
      padding: const EdgeInsetsApp(horizontal: 12, top: 8),
      child: Row(
        children: [
          Text(
            win ? GameResult.win.value : GameResult.lose.value,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: win ? Colors.blue : Colors.red
            ),
          ),
          const SizedBox(width: 8,)
        ],
      ),
    );
  }

  // Widget _buildObjectResult() {
  //   final data = model.teamObjectInfo;
  //   return Padding(
  //     padding: const EdgeInsetsApp(horizontal: 16),
  //     child: Row(
  //       children: [
  //         ObjectResultWidget(
  //             baron: data?.first.baron ?? 0,
  //             dragon: data?.first.dragon ?? 0,
  //             horde: data?.first.horde ?? 0,
  //             inhibitor: data?.first.inhibitor ?? 0,
  //             riftHerald: data?.first.riftHerald ?? 0,
  //             tower: data?.first.tower ?? 0
  //         ),
  //         const SizedBox(width: 4,),
  //         Expanded(
  //             child: Column(
  //               children: [
  //                 TupleValueGraphWidget(
  //                   firstValue: data?.first.teamKills  ?? 0,
  //                   lastValue: data?.last.teamKills ?? 0,
  //                   isBlue: data?.first.isBlue ?? true,
  //                   title: 'Total Kill',
  //                 ),
  //                 const SizedBox(height: 4,),
  //                 TupleValueGraphWidget(
  //                   firstValue: data?.first.teamGolds  ?? 0,
  //                   lastValue: data?.last.teamGolds ?? 0,
  //                   isBlue: data?.first.isBlue ?? false,
  //                   title: 'Total Gold',
  //                 ),
  //               ],
  //             )
  //         ),
  //         const SizedBox(width: 4,),
  //         ObjectResultWidget(
  //             baron: data?.last.baron ?? 0,
  //             dragon: data?.last.dragon ?? 0,
  //             horde: data?.last.horde ?? 0,
  //             inhibitor: data?.last.inhibitor ?? 0,
  //             riftHerald: data?.last.riftHerald ?? 0,
  //             tower: data?.last.tower ?? 0
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

class TeamRecordWidget extends StatelessWidget {
  const TeamRecordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class UserRecordItemWidget extends StatelessWidget {
  final PlayerInfoModel model;

  const UserRecordItemWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1, // 화면 높이의 10%
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
                children: [
                  ClipOval(
                    child: AppCachedNetworkImage(
                      url: model.championUrl ?? '',
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.textColor,
                      ),
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            model.championLevel.toString(),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.scaffoldBackgroundColor
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
          ),
          const SizedBox(width: 4,),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: model.spells.map((e) => AppCachedNetworkImage(
                      url: e,
                    ),).toList()
                  ),
                ),
                const SizedBox(width: 2,),
                Flexible(
                  flex: 1,
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: model.runes.map((e) => AppCachedNetworkImage(
                        url: e,
                      )).toList()
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 4,),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(model.nickName ?? '', style: theme.textTheme.bodySmall,)),
                const SizedBox(height: 4,),
                Row(
                  children: [
                    Text(
                      model.kda ?? '',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.disabledColor,
                      ),
                    ),
                    const SizedBox(width: 4,),
                    Text(
                      model.grade ?? '',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8,),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: AppCachedNetworkImage(
                        decoType: DecoType.borderRadius,
                        url: model.items.first
                      )
                    ),
                    const SizedBox(width: 2,),
                    Flexible(
                        flex: 1,
                        child: AppCachedNetworkImage(
                          decoType: DecoType.borderRadius,
                          url: model.items[1]
                        )
                    ),
                    const SizedBox(width: 2,),
                    Flexible(
                        flex: 1,
                        child: AppCachedNetworkImage(
                          decoType: DecoType.borderRadius,
                          url: model.items[2]
                        )
                    ),
                    const SizedBox(width: 2,),
                    Flexible(
                        flex: 1,
                        child: AppCachedNetworkImage(
                          decoType: DecoType.borderRadius,
                          url: model.items[3]
                        )
                    ),
                    const SizedBox(width: 2,),
                    Flexible(
                        flex: 1,
                        child: AppCachedNetworkImage(
                          decoType: DecoType.borderRadius,
                          url: model.items[4]
                        )
                    ),
                    const SizedBox(width: 2,),
                    Flexible(
                        flex: 1,
                        child: AppCachedNetworkImage(
                          decoType: DecoType.borderRadius,
                          url: model.items[5]
                        )
                    ),
                    const SizedBox(width: 2,),
                    Flexible(
                        flex: 1,
                        child: AppCachedNetworkImage(
                          decoType: DecoType.borderRadius,
                          url: model.items.last
                        )
                    ),
                  ]
                ),
                const SizedBox(height: 4,),
                Row(
                  children: [
                    Text(
                      '${model.totalCs.toString()} / ${model.totalCsPerMin?.toStringAsFixed(2)}',
                      style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.disabledColor,
                      ),
                    ),
                    const SizedBox(width: 8,),
                    Text(
                      '${(model.gold! / 100).toStringAsFixed(2)}K',
                      style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.disabledColor,
                      ),
                    ),
                  ],
                ),
              ],
            )

          ),
        ],
      )
    );
  }
}