// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_template/edge_insets.dart';
import 'package:goo_gg_application/data/match/enum/game_result.dart';
import 'package:goo_gg_application/data/match/model/game_detail_info_model.dart';
import 'package:goo_gg_application/main.dart';
import 'package:goo_gg_application/widget/app_cached_network_image.dart';

class TotalView extends StatefulWidget {
  final List<PlayerInfoModel>? players;

  const TotalView({super.key, required this.players});

  @override
  State<TotalView> createState() => _TotalViewState();
}

class _TotalViewState extends State<TotalView> {
  List<PlayersInfoDataSet> teamDataset = [];

  List<PlayersInfoDataSet> sortList() {
    if (widget.players == null) return [];
    final blue = widget.players!.sublist(0, 5);
    final red = widget.players!.sublist(5, 10);
    List<PlayersInfoDataSet> result = [];
    if (blue.first.win) {
      result.addAll([
        PlayersInfoDataSet(
          color: Colors.blueAccent,
          players: blue
        ),
        PlayersInfoDataSet(
          color: Colors.redAccent,
          players: red
        ),
      ]);
    } else {
      result.addAll([
        PlayersInfoDataSet(
          color: Colors.redAccent,
          players: red
        ),
        PlayersInfoDataSet(
          color: Colors.blueAccent,
          players: blue
        ),
      ]);
    }
    return result;
  }

  @override
  void initState() {
    teamDataset = sortList();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TotalView oldWidget) {
    const equality = DeepCollectionEquality();
    if (!equality.equals(widget.players, oldWidget.players)) {
      teamDataset = sortList();
      setState(() {});
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (teamDataset.isEmpty) {
      return const SizedBox();
    } else {
      return Builder(
          builder: (context) {
            return ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: teamDataset.map((e) {
                  return e.players.isNotEmpty ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Divider(
                        height: 1,
                        thickness: 2,
                        color: e.color,
                      ),
                      _buildTotalRecordWidget(theme, e.players.first.win),
                      _buildUserRecordListWidget(e.players),
                      const SizedBox(height: 24,),
                    ],
                  ) : const SizedBox();
                }).toList()
              // isBlue
              //     ? isBlueWinListWidget(isBlue, theme, blueTeamColor, redTeamColor)
              //     : isRedWinListWidget(isBlue, theme, blueTeamColor, redTeamColor),
            );
          }
      );
    }
  }
  //
  // List<Widget> isBlueWinListWidget(
  //   bool win,
  //   ThemeData theme,
  //   Color blueTeamColor,
  //   Color redTeamColor,
  // ) => [
  //   if (gameDetail.blueTeamInfo?.isNotEmpty == true) ... [
  //     Divider(
  //       height: 1,
  //       thickness: 2,
  //       color: blueTeamColor,
  //     ),
  //     _buildTotalRecordWidget(theme, win),
  //     _buildUserRecordListWidget(gameDetail.blueTeamInfo!),
  //   ],
  //   const SizedBox(height: 12,),
  //   if (gameDetail.redTeamInfo?.isNotEmpty == true) ...[
  //     Divider(
  //       height: 1,
  //       thickness: 2,
  //       color: redTeamColor,
  //     ),
  //     _buildTotalRecordWidget(theme, !win),
  //     _buildUserRecordListWidget(gameDetail.redTeamInfo!),
  //   ],
  //   const SizedBox(height: 100,),
  // ];
  //
  // List<Widget> isRedWinListWidget(
  //   bool win,
  //   ThemeData theme,
  //   Color blueTeamColor,
  //   Color redTeamColor
  // ) => [
  //   if (gameDetail.redTeamInfo?.isNotEmpty == true) ...[
  //     Divider(
  //       height: 1,
  //       thickness: 2,
  //       color: redTeamColor,
  //     ),
  //     _buildTotalRecordWidget(theme, !win),
  //     _buildUserRecordListWidget(gameDetail.redTeamInfo!),
  //   ],
  //   const SizedBox(height: 12,),
  //   if (gameDetail.blueTeamInfo?.isNotEmpty == true) ... [
  //     Divider(
  //       height: 1,
  //       thickness: 2,
  //       color: blueTeamColor,
  //     ),
  //     _buildTotalRecordWidget(theme, win),
  //     _buildUserRecordListWidget(gameDetail.blueTeamInfo!),
  //   ],
  //   const SizedBox(height: 100,),
  // ];
  //
  Widget _buildUserRecordListWidget(List<PlayerInfoModel> list) {
    return Container(
      padding: const EdgeInsetsApp(horizontal: 12, vertical: 4),
      child: Column(
        children: list.map((e) {
          final child = UserRecordItemWidget(model: e);
          final isLast = e == list.last;
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
}

class PlayersInfoDataSet {
  final Color color;
  final List<PlayerInfoModel> players;

  PlayersInfoDataSet({required this.color, required this.players});
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