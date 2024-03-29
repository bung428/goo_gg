import 'package:flutter/material.dart';
import 'package:flutter_base_template/edge_insets.dart';
import 'package:goo_gg_application/data/match/model/game_detail_info_model.dart';
import 'package:goo_gg_application/main.dart';
import 'package:goo_gg_application/widget/app_cached_network_image.dart';
import 'package:goo_gg_application/widget/asset_imge_widget.dart';

// class PlayerMatchDetailWidget extends StatelessWidget {
//   final GameDetailInfoModel model;
//
//   const PlayerMatchDetailWidget({super.key, required this.model});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         model.isWinBlue
//             ? _buildBluePlayersResult(true)
//             : _buildRedPlayersResult(false),
//         const SizedBox(height: 4,),
//         _buildObjectResult(),
//         const SizedBox(height: 4,),
//         model.isWinBlue
//             ? _buildRedPlayersResult(false, true)
//             : _buildBluePlayersResult(true, true),
//       ],
//     );
//   }
//
//   Widget _buildBluePlayersResult(bool win, [bool isBottom = false]) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: isBottom ? const BorderRadius.only(
//           bottomLeft: Radius.circular(8),
//           bottomRight: Radius.circular(8),
//         ) : null,
//         color: win ? Colors.blueAccent.withOpacity(0.4) : Colors.redAccent.withOpacity(0.4),
//       ),
//       padding: const EdgeInsetsApp(horizontal: 18, vertical: 12),
//       child: Column(
//         children: model.blueTeamInfo?.map((e) {
//           final isLast = e == model.blueTeamInfo?.last;
//           return MatchPlayerDetailItemWidget(
//             model: e,
//             isLast: isLast,
//           );
//         }).toList() ?? [],
//       ),
//     );
//   }
//
//   Widget _buildRedPlayersResult(bool win, [bool isBottom = false]) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: isBottom ? const BorderRadius.only(
//           bottomLeft: Radius.circular(8),
//           bottomRight: Radius.circular(8),
//         ) : null,
//         color: win ? Colors.blueAccent.withOpacity(0.4) : Colors.redAccent.withOpacity(0.4),
//
//       ),
//       padding: const EdgeInsetsApp(horizontal: 18, vertical: 12),
//       child: Column(
//         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: model.redTeamInfo?.map((e) {
//           final isLast = e == model.redTeamInfo?.last;
//           final child = Column(
//               mainAxisSize: MainAxisSize.min,
//               children: e.spells.map((e) => AppCachedNetworkImage(
//                 url: e,
//                 // size: 12,
//               ),).toList()
//           );
//           return child;
//           // return MatchPlayerDetailItemWidget(
//           //   model: e,
//           //   isLast: isLast,
//           // );
//         }).toList() ?? [],
//       ),
//     );
//   }
//
//   Widget _buildObjectResult() {
//     final data = model.teamObjectInfo;
//     return Padding(
//       padding: const EdgeInsetsApp(horizontal: 16),
//       child: Row(
//         children: [
//           ObjectResultWidget(
//               baron: data?.first.baron ?? 0,
//               dragon: data?.first.dragon ?? 0,
//               horde: data?.first.horde ?? 0,
//               inhibitor: data?.first.inhibitor ?? 0,
//               riftHerald: data?.first.riftHerald ?? 0,
//               tower: data?.first.tower ?? 0
//           ),
//           const SizedBox(width: 4,),
//           Expanded(
//             child: Column(
//               children: [
//                 TupleValueGraphWidget(
//                   firstValue: data?.first.teamKills ?? 0,
//                   lastValue: data?.last.teamKills ?? 0,
//                   isBlue: data?.first.isBlue ?? true,
//                   title: 'Total Kill',
//                 ),
//                 const SizedBox(height: 4,),
//                 TupleValueGraphWidget(
//                   firstValue: data?.first.teamGolds ?? 0,
//                   lastValue: data?.last.teamGolds ?? 0,
//                   isBlue: data?.first.isBlue ?? false,
//                   title: 'Total Gold',
//                 ),
//               ],
//             )
//           ),
//           const SizedBox(width: 4,),
//           ObjectResultWidget(
//               baron: data?.last.baron ?? 0,
//               dragon: data?.last.dragon ?? 0,
//               horde: data?.last.horde ?? 0,
//               inhibitor: data?.last.inhibitor ?? 0,
//               riftHerald: data?.last.riftHerald ?? 0,
//               tower: data?.last.tower ?? 0
//           ),
//         ],
//       ),
//     );
//   }
// }

class MatchPlayerDetailItemWidget extends StatelessWidget {
  // final PlayerInfoModel model;
  // final bool isLast;

  const MatchPlayerDetailItemWidget({
    super.key,
    // required this.model,
    // required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Widget child = Tooltip(
      message: 'model.nickName',
      preferBelow: false,
      triggerMode: TooltipTriggerMode.tap,
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: Container(color: Colors.yellow,)
            // Stack(
            //   children: [
            //     ClipOval(
            //       child: AppCachedNetworkImage(
            //         // size: 24,
            //         url: model.championUrl ?? '',
            //       ),
            //     ),
            //     Positioned(
            //       right: 0,
            //       bottom: 0,
            //       child: Container(
            //         width: 10,
            //         height: 10,
            //         decoration: BoxDecoration(
            //           shape: BoxShape.circle,
            //           color: theme.textColor,
            //         ),
            //         child: Center(
            //           child: FittedBox(
            //             fit: BoxFit.contain,
            //             child: Text(
            //               model.championLevel.toString(),
            //               style: theme.textTheme.bodySmall?.copyWith(
            //                 color: theme.scaffoldBackgroundColor
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     )
            //   ],
            // ),
          ),
          const SizedBox(width: 4,),
          Flexible(
            flex: 1,
            child: Container(color: Colors.blue,)
            // Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: model.spells.map((e) => AppCachedNetworkImage(
            //       url: e,
            //       size: 12,
                // ),).toList()
            // ),
          ),
          const SizedBox(width: 4,),
          Flexible(
            flex: 1,
            child: Container(color: Colors.red,)
            // Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: model.runes.map((e) => AppCachedNetworkImage(
            //       url: e,
            //       // size: 12,
            //     )).toList()
            // ),
          ),
          const SizedBox(width: 8,),
          Flexible(
            flex: 3,
            child: Container(color: Colors.grey,)
            // Column(
            //   children: [
            //     Text(
            //       '${model.kda} (${model.killInvolvementStr})',
            //       style: theme.textTheme.bodySmall?.copyWith(
            //         color: theme.disabledColor,
            //         // fontSize: 8
            //       ),
            //     ),
            //     Text(
            //       model.grade ?? '',
            //       style: theme.textTheme.bodySmall?.copyWith(
            //         color: theme.disabledColor,
            //         // fontSize: 8
            //       ),
            //     ),
            //   ],
            // ),
          ),
          const Spacer(),
          Flexible(
            flex: 3,
            child: Container(color: Colors.black,)
          ),
          // Column(
          //   children: [
          //     Text(
          //       '${model.totalCs.toString()} / ${model.totalCsPerMin?.toStringAsFixed(2)}',
          //       style: theme.textTheme.bodySmall?.copyWith(
          //           color: theme.disabledColor,
          //           // fontSize: 8
          //       ),
          //     ),
          //     Text(
          //       model.gold.toString(),
          //       style: theme.textTheme.bodySmall?.copyWith(
          //           color: theme.disabledColor,
          //           // fontSize: 8
          //       ),
          //     ),
          //   ],
          // ),
          const Spacer(),
          Expanded(
            flex: 3,
            child: Container(color: Colors.orange,)
            // child: Row(
            //   children: model.items.map((e) {
            //     final isLast = e == model.items.last;
            //     final child = AppCachedNetworkImage(url: e,/* size: 16,*/);
            //     return isLast ? child : Row(
            //       children: [
            //         child,
            //         const SizedBox(width: 4,)
            //       ],
            //     );
            //   }).toList(),
            // ),
          )
        ],
      ),
    );
      return child;
    // if (isLast) {
    // } else {
    //   return Column(
    //     children: [
    //       child,
    //       const SizedBox(height: 4,)
    //     ],
    //   );
    // }
  }
}

class ObjectResultWidget extends StatelessWidget {
  final int baron;
  final int dragon;
  final int horde; /// 유충
  final int inhibitor; /// 억제기
  final int riftHerald; /// 전령
  final int tower;

  const ObjectResultWidget({
    super.key,
    this.baron = 0,
    this.dragon = 0,
    this.horde = 0,
    this.inhibitor = 0,
    this.riftHerald = 0,
    this.tower = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 68,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Tooltip(
                  message: '바론',
                  preferBelow: false,
                  triggerMode: TooltipTriggerMode.tap,
                  child: ObjectItemWidget(
                    asset: 'baron',
                    value: '$baron',
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Tooltip(
                  message: '용',
                  preferBelow: false,
                  triggerMode: TooltipTriggerMode.tap,
                  child: ObjectItemWidget(
                    asset: 'dragon',
                    value: '$dragon',
                  )
                ),
              ),
              Expanded(
                flex: 1,
                child: Tooltip(
                  message: '유충',
                  preferBelow: false,
                  triggerMode: TooltipTriggerMode.tap,
                  child: ObjectItemWidget(
                    asset: 'horde',
                    value: '$horde',
                  )
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Tooltip(
                  message: '전령',
                  preferBelow: false,
                  triggerMode: TooltipTriggerMode.tap,
                  child: ObjectItemWidget(
                    asset: 'riftHerald',
                    value: '$riftHerald',
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Tooltip(
                  message: '억제기',
                  preferBelow: false,
                  triggerMode: TooltipTriggerMode.tap,
                  child: ObjectItemWidget(
                    asset: 'inhibitor',
                    value: '$inhibitor',
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Tooltip(
                  message: '타워',
                  preferBelow: false,
                  triggerMode: TooltipTriggerMode.tap,
                  child: ObjectItemWidget(
                    asset: 'tower',
                    value: '$tower',
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ObjectItemWidget extends StatelessWidget {
  final String asset;
  final String value;

  const ObjectItemWidget({
    super.key,
    required this.asset,
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AssetImageWidget(image: asset, size: 12,),
        const SizedBox(width: 2,),
        Text(value)
      ],
    );
  }
}

class TupleValueGraphWidget extends StatelessWidget {
  final int firstValue;
  final int lastValue;
  final bool isBlue;
  final String title;

  const TupleValueGraphWidget({super.key, required this.firstValue, required this.lastValue, required this.isBlue, required this.title});

  @override
  Widget build(BuildContext context) {
    final firstColor = isBlue
        ? Colors.blueAccent.withOpacity(0.4)
        : Colors.redAccent.withOpacity(0.4);
    final lastColor = !isBlue
        ? Colors.blueAccent.withOpacity(0.4)
        : Colors.redAccent.withOpacity(0.4);
    final theme = Theme.of(context);
    return SizedBox(
      height: 12,
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                  flex: firstValue,
                  child: Container(
                    color: firstColor,
                  )
              ),
              Expanded(
                  flex: lastValue,
                  child: Container(
                    color: lastColor,
                  )
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 4,),
              FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    '$firstValue',
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: theme.scaffoldBackgroundColor),
                  )),
              const Spacer(),
              FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    title,
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: theme.scaffoldBackgroundColor),
                  )),
              const Spacer(),
              FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    '$lastValue',
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: theme.scaffoldBackgroundColor),
                  )),
              const SizedBox(width: 4,),
            ],
          )
        ],
      ),
    );
  }
}

class OneValueGraphWidget extends StatelessWidget {
  const OneValueGraphWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 12,
      child: LinearProgressIndicator(
        // value: ,
      ),
    );
  }
}



